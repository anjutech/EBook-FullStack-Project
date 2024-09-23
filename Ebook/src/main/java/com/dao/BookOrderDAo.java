package com.dao;

import java.util.List;

import com.entity.Book_Order;

public interface BookOrderDAo {

//	public int getOrderNo();
	
	public boolean saveOrder(List<Book_Order> b);
	
	public List<Book_Order> getBook();
}
