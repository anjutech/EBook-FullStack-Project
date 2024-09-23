package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.UserDaoImp;
import com.db.DbConnect;
import com.entity.User;




@WebServlet("/login")
public class LoginServlet extends HttpServlet{

	private static final long serialVersionUID = 1L;

	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			
			UserDaoImp dao = new UserDaoImp(DbConnect.getConn());

			HttpSession session = req.getSession();
			
			String email = req.getParameter("email");
			String password = req.getParameter("password");
			
//			System.out.println(email + password);
			
			if ("admin@gmail.com".equals(email) && "admin".equals(password)) {
				User us = new User();
				us.setEmail(email);
				session.setAttribute("userobj", us);
				resp.sendRedirect("admin/home.jsp");
			}else {
				User us = dao.login(email, password);
				if (us!=null) {
					session.setAttribute("userobj", us);
					resp.sendRedirect("index.jsp");
				}else {
					session.setAttribute("failedMsg", "InValid Credentials");
				    resp.sendRedirect("Login.jsp");
				}
				
			
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}


}
