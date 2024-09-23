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

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String email = req.getParameter("email");
			String password = req.getParameter("password");
			String check = req.getParameter("check");

//			System.out.println("Email: "+email + "Password: "+ password + "Check:" + check);

			User us = new User();
			us.setEmail(email);
			us.setPassword(password);

			HttpSession session = req.getSession();

			if (check != null) {

				UserDaoImp dao = new UserDaoImp(DbConnect.getConn());
				boolean f2 = dao.checkUser(email);
				if (f2) {
					boolean f = dao.UserRegister(us);
					if (f) {
//					System.out.println("User Registered");

						session.setAttribute("succMsg", "Registration Successfull...");
						resp.sendRedirect("Register.jsp");
					} else {
//					System.out.println("Failed in User Registeration");
						session.setAttribute("failedMsg", "Something Went Wrong on Server...");
						resp.sendRedirect("Register.jsp");

					}
				} else {
					session.setAttribute("failedMsg", "User Already Exist");
					resp.sendRedirect("Register.jsp");
				}

			} else {
				session.setAttribute("failedMsg", "Please  Agree With Our Term And Conditions");
				resp.sendRedirect("Register.jsp");
			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();

		}
	}

}
