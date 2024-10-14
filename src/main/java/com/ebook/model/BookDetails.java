package com.ebook.model;

public class BookDetails {
	private int bookId;
	private String bookName;
	private String authorName ;
	private int price ;
	private String bCategeory ;
	private String status ;
	private String photo ;
	private String user_email ;
	
	public BookDetails() {	}

	public BookDetails(int bookId, String bookName, String authorName, int price, String bCategeory, String status,
			String photo, String user_email) {
		super();
		this.bookId = bookId;
		this.bookName = bookName;
		this.authorName = authorName;
		this.price = price;
		this.bCategeory = bCategeory;
		this.status = status;
		this.photo = photo;
		this.user_email = user_email;
	}

	public int getBookId() {
		return bookId;
	}

	public void setBookId(int bookId) {
		this.bookId = bookId;
	}

	public String getBookName() {
		return bookName;
	}

	public void setBookName(String bookName) {
		this.bookName = bookName;
	}

	public String getAuthorName() {
		return authorName;
	}

	public void setAuthorName(String authorName) {
		this.authorName = authorName;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getbCategeory() {
		return bCategeory;
	}

	public void setbCategeory(String bCategeory) {
		this.bCategeory = bCategeory;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}

	public String getUser_email() {
		return user_email;
	}

	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}

	@Override
	public String toString() {
		return "BookDetails [bookId=" + bookId + ", bookName=" + bookName + ", authorName=" + authorName + ", price="
				+ price + ", bCategeory=" + bCategeory + ", status=" + status + ", photo=" + photo + ", user_email="
				+ user_email + "]";
	}
	
}
