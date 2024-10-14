package com.ebook.daoImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.ebook.dao.UserDAO;
import com.ebook.model.User;
import com.ebook.util.ConnectionUtil;

public class UserDAOImpl implements UserDAO {
	
	private static Connection connection = null;
    private static PreparedStatement prepareStatement = null;
    private static ResultSet res = null;

    private static final String INSERT_QUERY = "INSERT INTO user (name, email, password, phNumber) VALUES (?, ?, ?, ?)";
    private static final String UPDATE_ADDRESS_QUERY = "UPDATE user SET address = ?, landmark = ?, city = ?, state = ?, pincode = ? WHERE id = ?";
    private static final String UPDATE_QUERY = "UPDATE user SET name = ?, email = ?, phNumber = ? WHERE id = ?";
    private static final String SELECT_BY_EMAIL_QUERY = "SELECT * FROM user WHERE email = ?";
	
    public UserDAOImpl() {
    	connection = ConnectionUtil.getConnection();
    }

	@Override
	public boolean addUser(User user) {
		boolean f=false;
		
		try {
            prepareStatement = connection.prepareStatement(INSERT_QUERY);
            prepareStatement.setString(1, user.getName());
            prepareStatement.setString(2, user.getEmail());
            prepareStatement.setString(3, user.getPassword());
            prepareStatement.setString(4, user.getPhNumber());
            int n = prepareStatement.executeUpdate();
            
            if(n==1) {
            	f=true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
		return f;
	}
	
	@Override
	public boolean addUserAddress(User user) {
		try {
            prepareStatement = connection.prepareStatement(UPDATE_ADDRESS_QUERY);
            prepareStatement.setString(1, user.getAddress());
            prepareStatement.setString(2, user.getLandmark());
            prepareStatement.setString(3, user.getCity());
            prepareStatement.setString(4, user.getState());
            prepareStatement.setString(5, user.getPincode());
            prepareStatement.setInt(6, user.getId());
            int r = prepareStatement.executeUpdate();
            
            if(r==1) {
            	return true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
		return false;
	}
	
	@Override
	public User getUserByEmail(String email) {
        try {
            prepareStatement = connection.prepareStatement(SELECT_BY_EMAIL_QUERY);
            prepareStatement.setString(1, email);
            res = prepareStatement.executeQuery();

            if (res.next()) {
                return new User(
                    res.getInt("id"),
                    res.getString("name"),
                    res.getString("email"),
                    res.getString("password"),
                    res.getString("phNumber"),
                    res.getString("address"),
                    res.getString("landmark"),
                    res.getString("city"),
                    res.getString("state"),
                    res.getString("pincode")
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

	@Override
	public boolean updateUser(User user) {
		try {
            prepareStatement = connection.prepareStatement(UPDATE_QUERY);
            prepareStatement.setString(1, user.getName());
            prepareStatement.setString(2, user.getEmail());
            prepareStatement.setString(3, user.getPhNumber());
            prepareStatement.setInt(4, user.getId());
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
	public boolean checkUser(String email) {
		
		try {
            prepareStatement = connection.prepareStatement(SELECT_BY_EMAIL_QUERY);
            prepareStatement.setString(1, email);
            res = prepareStatement.executeQuery();

            if (res.next()) {
            	return false;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
		return true;
	}

}
