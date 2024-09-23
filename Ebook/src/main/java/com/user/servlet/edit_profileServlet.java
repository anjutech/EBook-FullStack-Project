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

@WebServlet("/edit_profile")
public class edit_profileServlet extends HttpServlet{


	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {


		try {
			int id=Integer.parseInt(req.getParameter("id"));
			String email = req.getParameter("email");
			String password  = req.getParameter("password");
			
            User us = new User();
            us.setId(id);
            us.setEmail(email);
            us.setPassword(password);
            

			UserDaoImp dao = new UserDaoImp(DbConnect.getConn());
			
			HttpSession session = req.getSession();
						
			boolean f= dao.checkPassword(id);
			if (f) {
				
				boolean f2=dao.updateProfile(us);
				if (f2) {
					
					session.setAttribute("succMsg", "Email & Password Updated!");
					resp.sendRedirect("edit_profile.jsp");
					
				} else {

					session.setAttribute("failedMsg", "Something Went Wrong on Server..");
					resp.sendRedirect("edit_profile.jsp");
					
				}
			}else {
				
				session.setAttribute("failedMsg", "Your Password is incorrect..");
				resp.sendRedirect("edit_profile.jsp");
			}
			
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();

		}
		
	}

	
	
}
