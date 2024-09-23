package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.Cart;

public class CartDAOImpl implements CartDAO{

	private Connection conn;
	
	public CartDAOImpl(Connection conn)
	{
		this.conn = conn;
	}
	
	
	@Override
	public boolean addCart(Cart c) {
		// TODO Auto-generated method stub
		boolean f = false;
		try {
			
			String sql = "insert into cart(bid,uid,bookName,author,price,total_price) Values(?,?,?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, c.getBid());
			ps.setInt(2, c.getUid());
			ps.setString(3, c.getBookName());
			ps.setString(4, c.getAuthor());
			ps.setDouble(5, c.getPrice());
			ps.setDouble(6, c.getTotalPrice());

			
			int i = ps.executeUpdate();
			if(i==1) {
				f=true;
			}
			

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		
		return f;
	}


	@Override
	public List<Cart>  getBookByUser(int uid) {
	   // TODO Auto-generated method stub
		List<Cart>  list4 = new ArrayList<Cart>();
		Cart c  = null;
		Double totalprice = 0.00;
		try {
			String sql = "select * from cart where uid=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, uid);
			
			ResultSet rs = ps.executeQuery();
			
			while(rs.next())
			{
				c=new Cart();
				c.setCid(rs.getInt(1));
				c.setBid(rs.getInt(2));
				c.setUid(rs.getInt(3));
				c.setBookName(rs.getString(4));
				c.setAuthor(rs.getString(5));
				c.setPrice(rs.getDouble(6));
				
				totalprice=totalprice+rs.getDouble(7);
				
				c.setTotalPrice(totalprice);
				
				list4.add(c);
			}
			
		} catch (Exception e) {
			// TODO: handle exception
	        System.out.println(e.getMessage());
		}
		
		
		
		
		
		
		
		return list4;
	}


	@Override
	public boolean deleteBook(int bid,int uid,int cid) {
		// TODO Auto-generated method stub
		boolean f=false;
		
		try {
			
			String sql ="delete from cart where bid=? and uid=? and cid=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, bid);
			ps.setInt(2, uid);
            ps.setInt(3, cid);
			
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

}
