package com.ebook.model;

public class Cart {
	private int cid;
	private int bookid;
	private int userid;
	private String bname;
	private String author;
	private int price;
	private int total_price;
	
	public Cart() {	}

	public Cart(int cid, int bookid, int userid, String bname, String author, int price, int total_price) {
		super();
		this.cid = cid;
		this.bookid = bookid;
		this.userid = userid;
		this.bname = bname;
		this.author = author;
		this.price = price;
		this.total_price = total_price;
	}

	public int getCid() {
		return cid;
	}

	public void setCid(int cid) {
		this.cid = cid;
	}

	public int getBookid() {
		return bookid;
	}

	public void setBookid(int bookid) {
		this.bookid = bookid;
	}

	public int getUserid() {
		return userid;
	}

	public void setUserid(int userid) {
		this.userid = userid;
	}

	public String getBname() {
		return bname;
	}

	public void setBname(String bname) {
		this.bname = bname;
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

	public int getTotal_price() {
		return total_price;
	}

	public void setTotal_price(int total_price) {
		this.total_price = total_price;
	}

	@Override
	public String toString() {
		return "Cart [cid=" + cid + ", bookid=" + bookid + ", userid=" + userid + ", bname=" + bname + ", author="
				+ author + ", price=" + price + ", total_price=" + total_price + "]";
	}
	
}
