package com.entity;

public class Book_Order {

	private int id;
	private String order_id;
	private String name;
	private String email;
	private String phone;
	private String address;
	private String paymentType;
	private String bookName;
	private String author;
	private String price;
	
	public Book_Order() {
		super();
		// TODO Auto-generated constructor stub
	}
	

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getOrder_id() {
		return order_id;
	}

	public void setOrder_id(String order_id) {
		this.order_id = order_id;
	}
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPaymentType() {
		return paymentType;
	}

	public void setPaymentType(String paymentType) {
		this.paymentType = paymentType;
	}
	

	public String getBookName() {
		return bookName;
	}


	public void setBookName(String bookName) {
		this.bookName = bookName;
	}


	public String getAuthor() {
		return author;
	}


	public void setAuthor(String author) {
		this.author = author;
	}


	public String getPrice() {
		return price;
	}


	public void setPrice(String price) {
		this.price = price;
	}


	@Override
	public String toString() {
		return "Book_Order [id=" + id + ", order_id=" + order_id + ",name=" + name + ", email=" + email + ", phone=" + phone + ", address="
				+ address + ", paymentType=" + paymentType + ", bookName=" + bookName + ", author=" + author +
				", price=" + price+"]";
	}

	public Book_Order(int id,String order_id, String name, String email, String phone, String address, String paymentType , String bookName,String author, String price) {
		super();
		this.id = id;
		this.order_id = order_id;
		this.name = name;
		this.email = email;
		this.phone = phone;
		this.address = address;
		this.paymentType = paymentType;
		this.bookName =  bookName;
		this.author = author;
		this.price = price;
		
	}
}
