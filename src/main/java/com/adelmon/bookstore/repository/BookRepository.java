package com.adelmon.bookstore.repository;

import com.adelmon.bookstore.model.Book;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface BookRepository extends JpaRepository<Book, Long> {

    /**
     * Find a book by ISBN
     */
    Optional<Book> findByIsbn(String isbn);

    /**
     * Find books by author name (case-insensitive)
     */
    List<Book> findByAuthorContainingIgnoreCase(String author);

    /**
     * Find books by title (case-insensitive)
     */
    List<Book> findByTitleContainingIgnoreCase(String title);

    /**
     * Search books by title or author (case-insensitive)
     */
    @Query("SELECT b FROM Book b WHERE LOWER(b.title) LIKE LOWER(CONCAT('%', :keyword, '%')) " +
           "OR LOWER(b.author) LIKE LOWER(CONCAT('%', :keyword, '%'))")
    List<Book> searchBooks(@Param("keyword") String keyword);

    /**
     * Check if a book exists by ISBN
     */
    boolean existsByIsbn(String isbn);
}

