package com.ebook.dao;

import java.util.List;

import com.ebook.model.Cart;

public interface CartDAO {
	boolean addCart(Cart cart);
	List<Cart> getCartByUser(int userId);
	boolean deleteBook(int cid);
}
