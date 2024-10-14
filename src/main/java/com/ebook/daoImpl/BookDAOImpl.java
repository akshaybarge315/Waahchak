package com.ebook.daoImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.ebook.dao.BookDAO;
import com.ebook.model.BookDetails;
import com.ebook.util.ConnectionUtil;

public class BookDAOImpl implements BookDAO {
	
	private static Connection connection = null;
    private static PreparedStatement prepareStatement = null;
    private static Statement statement = null;
    private static ResultSet res = null;

    private static final String INSERT_QUERY = "INSERT INTO book_details (bookName, authorName, price, bCategeory, status, photo, user_email) VALUES (?, ?, ?, ?, ?, ?, ?)";
    private static final String UPDATE_QUERY = "UPDATE book_details SET bookName = ?, authorName = ?, price = ?, status = ? WHERE bookId = ?";
    private static final String DELETE_QUERY = "DELETE FROM book_details WHERE bookId = ?";
    private static final String SELECT_QUERY = "SELECT * FROM book_details WHERE bookId = ?";
    private static final String SELECT_ALL_QUERY = "SELECT * FROM book_details";
    private static final String SELECT_NEWOLD_BOOK_QUERY = "SELECT * FROM book_details where bCategeory=? AND status=? ORDER BY bookId DESC";
    private static final String SELECT_ALL_RECENT_QUERY = "SELECT * FROM book_details where status=? ORDER BY bookId DESC";
    private static final String SELECT_QUERY_EMAIL = "SELECT * FROM book_details WHERE user_email = ?";
    private static final String SELECT_QUERY_SEARCH = "SELECT * FROM book_details WHERE bookName like ? or authorName like ? or bCategeory like ? and status=?";
    
    public BookDAOImpl() {
    	connection = ConnectionUtil.getConnection();
    }

	@Override
	public boolean addBooks(BookDetails bd) {
		
		try {
            prepareStatement = connection.prepareStatement(INSERT_QUERY);
            prepareStatement.setString(1, bd.getBookName());
            prepareStatement.setString(2, bd.getAuthorName());
            prepareStatement.setInt(3, bd.getPrice());
            prepareStatement.setString(4, bd.getbCategeory());
            prepareStatement.setString(5, bd.getStatus());
            prepareStatement.setString(6, bd.getPhoto());
            prepareStatement.setString(7, bd.getUser_email());
            int i = prepareStatement.executeUpdate();
            
            if(i==1) {
            	return true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
		return false;
	}

	@Override
	public boolean updateBook(BookDetails bd) {
		try {
            prepareStatement = connection.prepareStatement(UPDATE_QUERY);
            prepareStatement.setString(1, bd.getBookName());
            prepareStatement.setString(2, bd.getAuthorName());
            prepareStatement.setInt(3, bd.getPrice());
            prepareStatement.setString(4, bd.getStatus());
            prepareStatement.setInt(5, bd.getBookId());
            int i = prepareStatement.executeUpdate();
            
            if(i==1) {
            	return true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
		return false;
	}

	@Override
	public boolean deleteBook(int bookId) {
		try {
            prepareStatement = connection.prepareStatement(DELETE_QUERY);
            prepareStatement.setInt(1, bookId);
            int i = prepareStatement.executeUpdate();
            
            if(i==1) {
            	return true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
		return false;
	}

	@Override
	public BookDetails getBookById(int bookId) {
		try {
            prepareStatement = connection.prepareStatement(SELECT_QUERY);
            prepareStatement.setInt(1, bookId);
            res = prepareStatement.executeQuery();
            
            if (res.next()) {
                return new BookDetails(
                		res.getInt("bookId"),
	                    res.getString("bookName"),
	                    res.getString("authorName"),
	                    res.getInt("price"),
	                    res.getString("bCategeory"),
	                    res.getString("status"),
	                    res.getString("photo"),
	                    res.getString("user_email")
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
		return null;
	}

	@Override
	public List<BookDetails> getAllBooks() {
		List<BookDetails> b = new ArrayList<>();
		
        try {
            prepareStatement = connection.prepareStatement(SELECT_ALL_QUERY);
            res = prepareStatement.executeQuery();
            while (res.next()) {
                b.add(new BookDetails(
	            		res.getInt("bookId"),
	                    res.getString("bookName"),
	                    res.getString("authorName"),
	                    res.getInt("price"),
	                    res.getString("bCategeory"),
	                    res.getString("status"),
	                    res.getString("photo"),
	                    res.getString("user_email")
	            ));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return b;
	}
	
	@Override
	public List<BookDetails> getAllNewBooks() {
		List<BookDetails> b = new ArrayList<>();
		
        try {
            prepareStatement = connection.prepareStatement(SELECT_NEWOLD_BOOK_QUERY);
            prepareStatement.setString(1, "New");
            prepareStatement.setString(2, "Active");
            res = prepareStatement.executeQuery();
            while (res.next()) {
                b.add(new BookDetails(
	            		res.getInt("bookId"),
	                    res.getString("bookName"),
	                    res.getString("authorName"),
	                    res.getInt("price"),
	                    res.getString("bCategeory"),
	                    res.getString("status"),
	                    res.getString("photo"),
	                    res.getString("user_email")
	            ));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return b;
	}
	
	@Override
	public List<BookDetails> getAllRecentBooks() {
		List<BookDetails> b = new ArrayList<>();
		
        try {
            prepareStatement = connection.prepareStatement(SELECT_ALL_RECENT_QUERY);
            prepareStatement.setString(1, "Active");
            res = prepareStatement.executeQuery();
            while (res.next()) {
                b.add(new BookDetails(
	            		res.getInt("bookId"),
	                    res.getString("bookName"),
	                    res.getString("authorName"),
	                    res.getInt("price"),
	                    res.getString("bCategeory"),
	                    res.getString("status"),
	                    res.getString("photo"),
	                    res.getString("user_email")
	            ));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return b;
	}
	
	@Override
	public List<BookDetails> getAllOldBooks() {
		List<BookDetails> b = new ArrayList<>();
		
        try {
            prepareStatement = connection.prepareStatement(SELECT_NEWOLD_BOOK_QUERY);
            prepareStatement.setString(1, "Old");
            prepareStatement.setString(2, "Active");
            res = prepareStatement.executeQuery();
            while (res.next()) {
                b.add(new BookDetails(
	            		res.getInt("bookId"),
	                    res.getString("bookName"),
	                    res.getString("authorName"),
	                    res.getInt("price"),
	                    res.getString("bCategeory"),
	                    res.getString("status"),
	                    res.getString("photo"),
	                    res.getString("user_email")
	            ));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return b;
	}
	
	@Override
	public List<BookDetails> getAllBooksByEmail(String email) {
		List<BookDetails> b = new ArrayList<>();
		try {
            prepareStatement = connection.prepareStatement(SELECT_QUERY_EMAIL);
            prepareStatement.setString(1, email);
            res = prepareStatement.executeQuery();
            
            while (res.next()) {
                b.add(new BookDetails(
	            		res.getInt("bookId"),
	                    res.getString("bookName"),
	                    res.getString("authorName"),
	                    res.getInt("price"),
	                    res.getString("bCategeory"),
	                    res.getString("status"),
	                    res.getString("photo"),
	                    res.getString("user_email")
	            ));
            }
            
		}catch (SQLException e) {
            e.printStackTrace();
        }
        return b;
	}
	
	@Override
	public List<BookDetails> getAllBooksSearch(String ch) {
		List<BookDetails> b = new ArrayList<>();
		
        try {
            prepareStatement = connection.prepareStatement(SELECT_QUERY_SEARCH);
            prepareStatement.setString(1, "%"+ch+"%");
            prepareStatement.setString(2, "%"+ch+"%");
            prepareStatement.setString(3, "%"+ch+"%");
            prepareStatement.setString(4, "Active");
            
            res = prepareStatement.executeQuery();
            while (res.next()) {
                b.add(new BookDetails(
	            		res.getInt("bookId"),
	                    res.getString("bookName"),
	                    res.getString("authorName"),
	                    res.getInt("price"),
	                    res.getString("bCategeory"),
	                    res.getString("status"),
	                    res.getString("photo"),
	                    res.getString("user_email")
	            ));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return b;
	}
	
	@Override
    public void finalize() throws Throwable {
        if (res != null) {
            res.close();
        }
        if (prepareStatement != null) {
            prepareStatement.close();
        }
        if (statement != null) {
            statement.close();
        }
        if (connection != null) {
            connection.close();
        }
    }


}
