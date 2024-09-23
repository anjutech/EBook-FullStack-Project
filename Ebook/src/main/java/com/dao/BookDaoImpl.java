package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.BookDtls;

public class BookDaoImpl implements BookDao{

	private Connection conn;
	
	public BookDaoImpl(Connection conn) {
		super();
		this.conn = conn;
	}

	@Override
	public boolean addBooks(BookDtls b) {

		boolean f = false;
		try {
			
			String sql = "insert into addbook(bookname,author,price,Category,status,photo) Values(?,?,?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			
			ps.setString(1, b.getBookname());
			ps.setString(2, b.getAuthor());
			ps.setString(3, b.getPrice());
			ps.setString(4, b.getCategory());
			ps.setString(5, b.getStatus());
			ps.setString(6, b.getPhoto());
			
			int i = ps.executeUpdate();
			if (i ==1 ) {
				f =true;
			}

		} catch (Exception e) {
           
			e.printStackTrace();
		}
		
		return f;
	}

	@Override
	public List<BookDtls> getAllBook() {
		
		List<BookDtls> list  = new ArrayList<BookDtls>();
		BookDtls b = null;
		
		try {
			String sql = "select * from addbook";
			PreparedStatement ps = conn.prepareStatement(sql);
			
			
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				
				b = new BookDtls();
				b.setId(rs.getInt(1));
				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhoto(rs.getString(7));
				list.add(b);
			}
		
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		
		return list;
	}

	@Override
	public BookDtls getBookById(int id) {
	
		// TODO Auto-generated method stub
		
		BookDtls b = null;
		try {
			
			String sql = "select * from addbook where Id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
 			
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				
				b = new BookDtls();
				b.setId(rs.getInt(1));
				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhoto(rs.getString(7));
				
			}
			
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		
		
		return b;
	}
	@Override
	public boolean updateEditBooks(BookDtls b) {
		// TODO Auto-generated method stub
		boolean f = false;
		try {
			
			String sql ="update addbook set bookname=?,author=?,price=?,status=? where Id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			
			ps.setString(1, b.getBookname());
			ps.setString(2, b.getAuthor());
			ps.setString(3, b.getPrice());
			ps.setString(4, b.getStatus());
			ps.setInt(5, b.getId());
			
			int i = ps.executeUpdate();
			if (i==1) {
				f=true;
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		
		return f;
	}

	@Override
	public boolean deleteBooks(int id) {
		// TODO Auto-generated method stub
		boolean f=false;
		try {
			
			String sql ="delete from addbook where Id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			
			ps.setInt(1, id);
			
			int i=ps.executeUpdate();
			if (i==1) {
				f=true;
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return f;
	}

	@Override
	public List<BookDtls> getNewBook() {
		// TODO Auto-generated method stub
		
		List<BookDtls> list = new ArrayList<BookDtls>();
		BookDtls b=null;
		
		try {
			
			String sql = " select * from addbook where Category=? and status=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "New");
			ps.setString(2, "Active");
			ResultSet rs = ps.executeQuery();
			int i =1;
			while(rs.next() && i<=4) {
				
				b=new BookDtls();
				b.setId(rs.getInt(1));
				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhoto(rs.getString(7));
				list.add(b);
				i++;
			}
			
			
			
		} catch (Exception e) {
			// TODO: handle exception
			
			e.printStackTrace();
		}
				
		return list;
	}

	@Override
	public List<BookDtls> getRecentBooks() {
		// TODO Auto-generated method stub
		List<BookDtls> list2 = new ArrayList<BookDtls>();
		BookDtls b=null;
		
		try {
			
			String sql = " select * from addbook where status=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "Active");
			ResultSet rs = ps.executeQuery();
			int i =1;
			while(rs.next() && i<=4) {
				
				b=new BookDtls();
				b.setId(rs.getInt(1));
				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhoto(rs.getString(7));
				list2.add(b);
				i++;
			}
			
			
			
		} catch (Exception e) {
			// TODO: handle exception
			
			e.printStackTrace();
		}
				
		return list2;
		
		
		
	}

	@Override
	public List<BookDtls> getoldBooks() {
		
		// TODO Auto-generated method stub
				List<BookDtls> list3 = new ArrayList<BookDtls>();
				BookDtls b=null;
				
				try {
					
					String sql = " select * from addbook where Category=? ";
					PreparedStatement ps = conn.prepareStatement(sql);
					ps.setString(1, "Old");

					ResultSet rs = ps.executeQuery();
					int i =1;
					while(rs.next() && i<=4) {
						
						b=new BookDtls();
						b.setId(rs.getInt(1));
						b.setBookname(rs.getString(2));
						b.setAuthor(rs.getString(3));
						b.setPrice(rs.getString(4));
						b.setCategory(rs.getString(5));
						b.setStatus(rs.getString(6));
						b.setPhoto(rs.getString(7));
						list3.add(b);
						i++;
					}
					
					
					
				} catch (Exception e) {
					// TODO: handle exception
					
					e.printStackTrace();
				}
						
				return list3;
				
		
	}

	@Override
	public List<BookDtls> getAllNewBook() {
		// TODO Auto-generated method stub
		List<BookDtls> list = new ArrayList<BookDtls>();
		BookDtls b=null;
		
		try {
			
			String sql = " select * from addbook where Category=? and status=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "New");
			ps.setString(2, "Active");
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				
				b=new BookDtls();
				b.setId(rs.getInt(1));
				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhoto(rs.getString(7));
				list.add(b);
				
			}
			
			
			
		} catch (Exception e) {
			// TODO: handle exception
			
			e.printStackTrace();
		}
				
		return list;
	}

	@Override
	public List<BookDtls> getAllRecentBooks() {
		// TODO Auto-generated method stub
		// TODO Auto-generated method stub
				List<BookDtls> list2 = new ArrayList<BookDtls>();
				BookDtls b=null;
				
				try {
					
					String sql = " select * from addbook where status=?";
					PreparedStatement ps = conn.prepareStatement(sql);
					ps.setString(1, "Active");
					ResultSet rs = ps.executeQuery();
					
					while(rs.next() ) {
						
						b=new BookDtls();
						b.setId(rs.getInt(1));
						b.setBookname(rs.getString(2));
						b.setAuthor(rs.getString(3));
						b.setPrice(rs.getString(4));
						b.setCategory(rs.getString(5));
						b.setStatus(rs.getString(6));
						b.setPhoto(rs.getString(7));
						list2.add(b);
						
					}
					
					
					
				} catch (Exception e) {
					// TODO: handle exception
					
					e.printStackTrace();
				}
						
				return list2;
				
				
				
	}

	@Override
	public List<BookDtls> getAlloldBooks() {
		// TODO Auto-generated method stub
		// TODO Auto-generated method stub
		List<BookDtls> list3 = new ArrayList<BookDtls>();
		BookDtls b=null;
		
		try {
			
			String sql = " select * from addbook where Category=? ";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "Old");

			ResultSet rs = ps.executeQuery();
			
			while(rs.next() ) {
				
				b=new BookDtls();
				b.setId(rs.getInt(1));
				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhoto(rs.getString(7));
				list3.add(b);
				
			}
			
			
			
		} catch (Exception e) {
			// TODO: handle exception
			
			e.printStackTrace();
		}
				
		return list3;
		

	}

	@Override
	public List<BookDtls> getBookByold(String Category) {
		// TODO Auto-generated method stub
		
		List<BookDtls> list7 = new ArrayList<>();
		BookDtls b= null;
		
		try {
			
			String sql="select * from addbook where  Category=?";
			PreparedStatement ps = conn.prepareStatement(sql);
		
			ps.setString(1, Category);
			
			
			
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				
				b=new BookDtls();
				b.setId(rs.getInt(1));
				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhoto(rs.getString(7));
				list7.add(b);
				
				
			}
			
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		
		return list7;
	}

	@Override
	public boolean oldBookDelete(int id) {
		// TODO Auto-generated method stub
		boolean f=false;
		try {
			String sql="delete from addbook where id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			
			int i = ps.executeUpdate();
			if (i==1) {
				f=true;
			}
			
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return f;
	}

	@Override
	public List<BookDtls> getBookBySearch(String ch) {
		// TODO Auto-generated method stub
		
		List<BookDtls> list8 = new ArrayList<>();
		BookDtls b= null;
		
		try {
			
			String sql="select * from addbook where  bookname like ? or author like ? or Category like ? and status=?";
			PreparedStatement ps = conn.prepareStatement(sql);
		
			ps.setString(1,"%"+ch+"%");
			ps.setString(2,"%"+ch+"%");
			ps.setString(3,"%"+ch+"%");

			ps.setString(4,"Active");
			
			
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				
				b=new BookDtls();
				b.setId(rs.getInt(1));
				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhoto(rs.getString(7));
				list8.add(b);
				
				
			}
			
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		
		return list8;
	
	}

	
}
