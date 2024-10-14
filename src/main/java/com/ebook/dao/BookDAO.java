package com.ebook.dao;

import java.util.List;

import com.ebook.model.BookDetails;

public interface BookDAO {
	boolean addBooks(BookDetails bd);
	boolean updateBook(BookDetails bd);
	boolean deleteBook(int bookId);
	BookDetails getBookById(int bookId);
	List<BookDetails> getAllBooks();
	List<BookDetails> getAllNewBooks();
	List<BookDetails> getAllRecentBooks();
	List<BookDetails> getAllOldBooks();
	List<BookDetails> getAllBooksByEmail(String email);
	List<BookDetails> getAllBooksSearch(String ch);
	
}
