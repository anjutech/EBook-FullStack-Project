package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


import com.entity.User;

public class UserDaoImp implements UserDao{

	
	private Connection conn=null;

	

	
	public UserDaoImp(Connection conn) {
		super();
		this.conn = conn;
	}




	public boolean UserRegister(User us) {
		boolean f = false;
		try {
			String sql ="insert into ebook(email,password) values(?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, us.getEmail());
			ps.setString(2, us.getPassword());
			
			int i=ps.executeUpdate();
			if (i==1) {
				f=true;
			}
		} catch (Exception e) {
               e.printStackTrace();
		}
		
		
		
		return f;
	}




	public User login(String email,String password) {
		// TODO Auto-generated method stub
		
		User us = null;
		
		try {
			
			String sql="select * from ebook where email=? and password=?";
			PreparedStatement ps =conn.prepareStatement(sql) ;
			
			ps.setString(1, email);
			ps.setString(2, password);
			
			
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				us=new User();
				us.setId(rs.getInt(1));
				us.setEmail(rs.getString(2));
				us.setPassword(rs.getString(3));
				
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		
				
		return us;
		
	}




	@Override
	public boolean checkPassword(int id) {
		// TODO Auto-generated method stub
		
		boolean f = false;
		
		try {
			
			String sql ="select * from ebook where id=? ";
			PreparedStatement ps = conn.prepareStatement(sql);
			
			ps.setInt(1,id);
			
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				
				f = true;
				
			}
			
			
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
			
		return f;
	}




	@Override
	public boolean updateProfile(User us) {
		// TODO Auto-generated method stub
		boolean f = false;
		try {
			String sql ="update ebook set email=?,password=? where id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, us.getEmail());
			ps.setString(2, us.getPassword());
			ps.setInt(3,us.getId());
			int i=ps.executeUpdate();
			if (i==1) {
				f=true;
			}
		} catch (Exception e) {
               e.printStackTrace();
		}
		
		
		
		return f;
		
		
	}




	@Override
	public boolean checkUser(String em) {
		// TODO Auto-generated method stub
		boolean f=true;
		
		try {
			String sql ="select * from ebook where email=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, em);
			
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				f=false;
			}
			
			
		} catch (Exception e) {
               e.printStackTrace();
		}
			
		
		return f;
	}
}
