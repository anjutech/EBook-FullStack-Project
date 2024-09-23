package com.admin.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.BookDaoImpl;
import com.db.DbConnect;

@WebServlet("/delete")
public class BooksDeleteServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {

			int id = Integer.parseInt(req.getParameter("id"));

			BookDaoImpl dao = new BookDaoImpl(DbConnect.getConn());
			boolean f = dao.deleteBooks(id);
			HttpSession session = req.getSession();

			if (f) {

				session.setAttribute("succMsg", "Book Deleted SuccessFully");
				resp.sendRedirect("admin/AllBook.jsp");
			} else {
				session.setAttribute("failedMsg", "Something went wrong on server");
				resp.sendRedirect("admin/AllBook.jsp");
			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

	

}
