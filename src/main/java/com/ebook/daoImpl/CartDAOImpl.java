package com.ebook.daoImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.ebook.dao.CartDAO;
import com.ebook.model.Cart;
import com.ebook.util.ConnectionUtil;

public class CartDAOImpl implements CartDAO {
	
	private static Connection connection = null;
    private static PreparedStatement prepareStatement = null;
    private static ResultSet res = null;
    
    private static final String INSERT_QUERY = "INSERT INTO cart (bookid, userid, bname, author, price, total_price) VALUES (?, ?, ?, ?, ?, ?)";
    private static final String DELETE_QUERY = "DELETE FROM cart WHERE cid = ?";
    private static final String SELECT_QUERY = "SELECT * FROM cart WHERE userid = ?";
    
    public CartDAOImpl() {
    	connection = ConnectionUtil.getConnection();
    }

	@Override
	public boolean addCart(Cart cart) {
		
		try {
            prepareStatement = connection.prepareStatement(INSERT_QUERY);
            prepareStatement.setInt(1, cart.getBookid());
            prepareStatement.setInt(2, cart.getUserid());
            prepareStatement.setString(3, cart.getBname());
            prepareStatement.setString(4, cart.getAuthor());
            prepareStatement.setInt(5, cart.getPrice());
            prepareStatement.setInt(6, cart.getTotal_price());
            
            int n = prepareStatement.executeUpdate();
            
            if(n==1) {
            	return true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
		
		return false;
	}

	@Override
	public List<Cart> getCartByUser(int userId) {
		List<Cart> b = new ArrayList<>();
		try {
            prepareStatement = connection.prepareStatement(SELECT_QUERY);
            prepareStatement.setInt(1, userId);
            res = prepareStatement.executeQuery();
            
            while (res.next()) {
                b.add(new Cart(
                		res.getInt("cid"),
	            		res.getInt("bookid"),
	                    res.getInt("userid"),
	                    res.getString("bname"),
	                    res.getString("author"),
	                    res.getInt("price"),
	                    res.getInt("total_price")
	            ));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
		return b;
	}	

	@Override
	public boolean deleteBook(int cid) {
		try {
            prepareStatement = connection.prepareStatement(DELETE_QUERY);
            prepareStatement.setInt(1, cid);
            int i = prepareStatement.executeUpdate();
            
            if(i==1) {
            	return true;
            }
            
        } catch (SQLException e) {
            e.printStackTrace();
        }
		return false;
	}

}
