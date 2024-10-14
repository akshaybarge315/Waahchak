package com.ebook.dao;

import java.util.List;

import com.ebook.model.Order;

public interface OrderDAO {
	boolean addOrder(List<Order> order);
	List<Order> getAllOrderByEmail(String email);
	List<Order> getAllOrder();
	
}
