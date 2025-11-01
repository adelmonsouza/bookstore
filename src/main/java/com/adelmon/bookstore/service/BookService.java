package com.adelmon.bookstore.service;

import com.adelmon.bookstore.dto.BookRequest;
import com.adelmon.bookstore.dto.BookResponse;
import com.adelmon.bookstore.exception.ResourceNotFoundException;
import com.adelmon.bookstore.exception.DuplicateResourceException;
import com.adelmon.bookstore.model.Book;
import com.adelmon.bookstore.repository.BookRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.stream.Collectors;

@Service
@Transactional
public class BookService {

    private final BookRepository bookRepository;

    @Autowired
    public BookService(BookRepository bookRepository) {
        this.bookRepository = bookRepository;
    }

    /**
     * Get all books
     */
    @Transactional(readOnly = true)
    public List<BookResponse> getAllBooks() {
        return bookRepository.findAll()
                .stream()
                .map(BookResponse::fromEntity)
                .collect(Collectors.toList());
    }

    /**
     * Get a book by ID
     */
    @Transactional(readOnly = true)
    public BookResponse getBookById(Long id) {
        Book book = bookRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Book not found with id: " + id));
        return BookResponse.fromEntity(book);
    }

    /**
     * Get a book by ISBN
     */
    @Transactional(readOnly = true)
    public BookResponse getBookByIsbn(String isbn) {
        Book book = bookRepository.findByIsbn(isbn)
                .orElseThrow(() -> new ResourceNotFoundException("Book not found with ISBN: " + isbn));
        return BookResponse.fromEntity(book);
    }

    /**
     * Search books by keyword (title or author)
     */
    @Transactional(readOnly = true)
    public List<BookResponse> searchBooks(String keyword) {
        return bookRepository.searchBooks(keyword)
                .stream()
                .map(BookResponse::fromEntity)
                .collect(Collectors.toList());
    }

    /**
     * Create a new book
     */
    public BookResponse createBook(BookRequest bookRequest) {
        // Check if ISBN already exists
        if (bookRepository.existsByIsbn(bookRequest.getIsbn())) {
            throw new DuplicateResourceException("Book with ISBN " + bookRequest.getIsbn() + " already exists");
        }

        Book book = new Book(
                bookRequest.getTitle(),
                bookRequest.getIsbn(),
                bookRequest.getAuthor(),
                bookRequest.getPrice(),
                bookRequest.getStockQuantity(),
                bookRequest.getDescription()
        );

        Book savedBook = bookRepository.save(book);
        return BookResponse.fromEntity(savedBook);
    }

    /**
     * Update an existing book
     */
    public BookResponse updateBook(Long id, BookRequest bookRequest) {
        Book book = bookRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Book not found with id: " + id));

        // Check if ISBN is being changed and if it already exists
        if (!book.getIsbn().equals(bookRequest.getIsbn()) && 
            bookRepository.existsByIsbn(bookRequest.getIsbn())) {
            throw new DuplicateResourceException("Book with ISBN " + bookRequest.getIsbn() + " already exists");
        }

        book.setTitle(bookRequest.getTitle());
        book.setIsbn(bookRequest.getIsbn());
        book.setAuthor(bookRequest.getAuthor());
        book.setPrice(bookRequest.getPrice());
        book.setStockQuantity(bookRequest.getStockQuantity());
        book.setDescription(bookRequest.getDescription());

        Book updatedBook = bookRepository.save(book);
        return BookResponse.fromEntity(updatedBook);
    }

    /**
     * Delete a book by ID
     */
    public void deleteBook(Long id) {
        if (!bookRepository.existsById(id)) {
            throw new ResourceNotFoundException("Book not found with id: " + id);
        }
        bookRepository.deleteById(id);
    }

    /**
     * Update stock quantity for a book
     */
    public BookResponse updateStock(Long id, Integer quantity) {
        Book book = bookRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Book not found with id: " + id));

        if (quantity < 0) {
            throw new IllegalArgumentException("Stock quantity cannot be negative");
        }

        book.setStockQuantity(quantity);
        Book updatedBook = bookRepository.save(book);
        return BookResponse.fromEntity(updatedBook);
    }
}

