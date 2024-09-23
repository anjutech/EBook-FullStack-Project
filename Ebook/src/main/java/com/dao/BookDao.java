package com.dao;

import java.util.List;

import com.entity.BookDtls;

public interface BookDao {

	public boolean addBooks(BookDtls b);

	public List<BookDtls> getAllBook();

	public BookDtls getBookById(int Id);

	public boolean updateEditBooks(BookDtls b);

	public boolean deleteBooks(int id);

	public List<BookDtls> getNewBook();

	public List<BookDtls> getRecentBooks();

	public List<BookDtls> getoldBooks();

//	Get All Details
	public List<BookDtls> getAllNewBook();

	public List<BookDtls> getAllRecentBooks();

	public List<BookDtls> getAlloldBooks();
	
	
	public List<BookDtls> getBookByold(String Category);

	public boolean oldBookDelete(int id);
	
	public List<BookDtls> getBookBySearch(String ch);
	
}
