package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.BookDaoImpl;
import com.db.DbConnect;

@WebServlet("/delete_old_book")
public class DeleteOldBook extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		try {

			int id = Integer.parseInt(req.getParameter("id"));
			BookDaoImpl dao = new BookDaoImpl(DbConnect.getConn());

			boolean f = dao.oldBookDelete(id);

			HttpSession session = req.getSession();

			if (f) {
				session.setAttribute("succMsg", "Old Book Removed");
				resp.sendRedirect("ListOfSell_book.jsp");
			} else {
				session.setAttribute("FailedMsg", "Something went wrong on Server");
				resp.sendRedirect("ListOfSell_book.jsp");
			}

		} catch (Exception e) {
			// TODO: handle exception

			e.printStackTrace();
		}

	}

}
