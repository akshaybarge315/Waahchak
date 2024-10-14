package com.ebook.dao;

import com.ebook.model.User;

public interface UserDAO {
	boolean addUser(User user);
	boolean addUserAddress(User user);
	User getUserByEmail(String email);
	boolean updateUser(User user);
	boolean checkUser(String email);
//	User getUser(int userId);
//	void deleteUser(int userId);
//	List<User> getAllUser();
}
