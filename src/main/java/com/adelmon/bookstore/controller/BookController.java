package com.adelmon.bookstore.controller;

import com.adelmon.bookstore.dto.BookRequest;
import com.adelmon.bookstore.dto.BookResponse;
import com.adelmon.bookstore.service.BookService;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/books")
@CrossOrigin(origins = "*")
public class BookController {

    private final BookService bookService;

    @Autowired
    public BookController(BookService bookService) {
        this.bookService = bookService;
    }

    /**
     * Get all books
     * GET /api/books
     */
    @GetMapping
    public ResponseEntity<List<BookResponse>> getAllBooks() {
        List<BookResponse> books = bookService.getAllBooks();
        return ResponseEntity.ok(books);
    }

    /**
     * Get a book by ID
     * GET /api/books/{id}
     */
    @GetMapping("/{id}")
    public ResponseEntity<BookResponse> getBookById(@PathVariable Long id) {
        BookResponse book = bookService.getBookById(id);
        return ResponseEntity.ok(book);
    }

    /**
     * Get a book by ISBN
     * GET /api/books/isbn/{isbn}
     */
    @GetMapping("/isbn/{isbn}")
    public ResponseEntity<BookResponse> getBookByIsbn(@PathVariable String isbn) {
        BookResponse book = bookService.getBookByIsbn(isbn);
        return ResponseEntity.ok(book);
    }

    /**
     * Search books by keyword
     * GET /api/books/search?keyword={keyword}
     */
    @GetMapping("/search")
    public ResponseEntity<List<BookResponse>> searchBooks(@RequestParam String keyword) {
        List<BookResponse> books = bookService.searchBooks(keyword);
        return ResponseEntity.ok(books);
    }

    /**
     * Create a new book
     * POST /api/books
     */
    @PostMapping
    public ResponseEntity<BookResponse> createBook(@Valid @RequestBody BookRequest bookRequest) {
        BookResponse createdBook = bookService.createBook(bookRequest);
        return new ResponseEntity<>(createdBook, HttpStatus.CREATED);
    }

    /**
     * Update an existing book
     * PUT /api/books/{id}
     */
    @PutMapping("/{id}")
    public ResponseEntity<BookResponse> updateBook(
            @PathVariable Long id,
            @Valid @RequestBody BookRequest bookRequest) {
        BookResponse updatedBook = bookService.updateBook(id, bookRequest);
        return ResponseEntity.ok(updatedBook);
    }

    /**
     * Delete a book
     * DELETE /api/books/{id}
     */
    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteBook(@PathVariable Long id) {
        bookService.deleteBook(id);
        return ResponseEntity.noContent().build();
    }

    /**
     * Update stock quantity
     * PATCH /api/books/{id}/stock
     */
    @PatchMapping("/{id}/stock")
    public ResponseEntity<BookResponse> updateStock(
            @PathVariable Long id,
            @RequestParam Integer quantity) {
        BookResponse updatedBook = bookService.updateStock(id, quantity);
        return ResponseEntity.ok(updatedBook);
    }
}

