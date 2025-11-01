package com.adelmon.bookstore.dto;

import com.adelmon.bookstore.model.Book;
import java.math.BigDecimal;
import java.time.LocalDateTime;

public class BookResponse {

    private Long id;
    private String title;
    private String isbn;
    private String author;
    private BigDecimal price;
    private Integer stockQuantity;
    private String description;
    private LocalDateTime createdAt;
    private LocalDateTime updatedAt;

    // Constructors
    public BookResponse() {
    }

    public BookResponse(Long id, String title, String isbn, String author, BigDecimal price, 
                       Integer stockQuantity, String description, LocalDateTime createdAt, LocalDateTime updatedAt) {
        this.id = id;
        this.title = title;
        this.isbn = isbn;
        this.author = author;
        this.price = price;
        this.stockQuantity = stockQuantity;
        this.description = description;
        this.createdAt = createdAt;
        this.updatedAt = updatedAt;
    }

    // Factory method to convert from Entity
    public static BookResponse fromEntity(Book book) {
        return new BookResponse(
            book.getId(),
            book.getTitle(),
            book.getIsbn(),
            book.getAuthor(),
            book.getPrice(),
            book.getStockQuantity(),
            book.getDescription(),
            book.getCreatedAt(),
            book.getUpdatedAt()
        );
    }

    // Getters and Setters
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getIsbn() {
        return isbn;
    }

    public void setIsbn(String isbn) {
        this.isbn = isbn;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public Integer getStockQuantity() {
        return stockQuantity;
    }

    public void setStockQuantity(Integer stockQuantity) {
        this.stockQuantity = stockQuantity;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public LocalDateTime getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(LocalDateTime createdAt) {
        this.createdAt = createdAt;
    }

    public LocalDateTime getUpdatedAt() {
        return updatedAt;
    }

    public void setUpdatedAt(LocalDateTime updatedAt) {
        this.updatedAt = updatedAt;
    }
}

