package com.ebook.model;

public class Order {
	int id;
	String orderId;
	String userName;
	String email;
	String address;
	String phone;
	String book_name;
	String author;
	int price;
	String paymentMode;
	
	public Order() {	}

	public Order(int id, String orderId, String userName, String email, String address, String phone, String book_name,
			String author, int price, String paymentMode) {
		super();
		this.id = id;
		this.orderId = orderId;
		this.userName = userName;
		this.email = email;
		this.address = address;
		this.phone = phone;
		this.book_name = book_name;
		this.author = author;
		this.price = price;
		this.paymentMode = paymentMode;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getOrderId() {
		return orderId;
	}

	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getBook_name() {
		return book_name;
	}

	public void setBook_name(String book_name) {
		this.book_name = book_name;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getPaymentMode() {
		return paymentMode;
	}

	public void setPaymentMode(String paymentMode) {
		this.paymentMode = paymentMode;
	}

	@Override
	public String toString() {
		return "Order [id=" + id + ", orderId=" + orderId + ", userName=" + userName + ", email=" + email + ", address="
				+ address + ", phone=" + phone + ", book_name=" + book_name + ", author=" + author + ", price=" + price
				+ ", paymentMode=" + paymentMode + "]";
	}
	
}
