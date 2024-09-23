package com.dao;


import com.entity.User;

public interface UserDao {

	public boolean UserRegister(User us);
	
	public User login(String email,String password);
	
	public boolean checkPassword(int id);
	
	public boolean updateProfile(User us);
	
	public boolean checkUser(String em);
}
