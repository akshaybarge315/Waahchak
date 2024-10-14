package com.ebook.daoImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.ebook.dao.OrderDAO;
import com.ebook.model.Order;
import com.ebook.util.ConnectionUtil;

public class OrderDAOImpl implements OrderDAO {
	private static Connection connection = null;
    private static PreparedStatement prepareStatement = null;
    private static ResultSet res = null;

    private static final String INSERT_QUERY = "INSERT INTO `order`(orderId, userName, email, address, phone, book_name,author, price, paymentMode) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
    private static final String SELECT_BY_EMAIL_QUERY = "SELECT * FROM `order` WHERE email = ?";
    private static final String SELECT_QUERY = "SELECT * FROM `order`";
    
    public OrderDAOImpl() {
    	connection = ConnectionUtil.getConnection();
    }

	@Override
	public boolean addOrder(List<Order> o) {
		boolean r=false;
		try {
			connection.setAutoCommit(false);
            prepareStatement = connection.prepareStatement(INSERT_QUERY);
            
            for (Order order : o) {
				
	            prepareStatement.setString(1, order.getOrderId());
	            prepareStatement.setString(2, order.getUserName());
	            prepareStatement.setString(3, order.getEmail());
	            prepareStatement.setString(4, order.getAddress());
	            prepareStatement.setString(5, order.getPhone());
	            prepareStatement.setString(6, order.getBook_name());
	            prepareStatement.setString(7, order.getAuthor());
	            prepareStatement.setInt(8, order.getPrice());
	            prepareStatement.setString(9, order.getPaymentMode());
	            prepareStatement.addBatch();
            
            }
            prepareStatement.executeBatch();
            connection.commit();
            r=true;
            connection.setAutoCommit(true);
            
        } catch (SQLException e) {
            e.printStackTrace();
        }
		
		return r;
	}

	@Override
	public List<Order> getAllOrderByEmail(String email) {
		List<Order> o = new ArrayList<>();
		
		try {
            prepareStatement = connection.prepareStatement(SELECT_BY_EMAIL_QUERY);
            prepareStatement.setString(1, email);
            res = prepareStatement.executeQuery();

            while (res.next()) {
                o.add(new Order(
                		res.getInt("id"),
	                    res.getString("orderId"),
	                    res.getString("userName"),
	                    res.getString("email"),
	                    res.getString("address"),
	                    res.getString("phone"),
	                    res.getString("book_name"),
	                    res.getString("author"),
	                    res.getInt("price"),
	                    res.getString("paymentMode")
	            ));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return o;
	}

	@Override
	public List<Order> getAllOrder() {
		List<Order> o = new ArrayList<>();
		
		try {
            prepareStatement = connection.prepareStatement(SELECT_QUERY);
            res = prepareStatement.executeQuery();

            while (res.next()) {
                o.add(new Order(
                		res.getInt("id"),
	                    res.getString("orderId"),
	                    res.getString("userName"),
	                    res.getString("email"),
	                    res.getString("address"),
	                    res.getString("phone"),
	                    res.getString("book_name"),
	                    res.getString("author"),
	                    res.getInt("price"),
	                    res.getString("paymentMode")
	            ));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return o;
	}

}
