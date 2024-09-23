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
import com.entity.BookDtls;

@WebServlet("/edit_books")
public class EditBooksServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {

			int Id = Integer.parseInt(req.getParameter("Id"));
			String BookName = req.getParameter("BookName");
			String AuthorName = req.getParameter("AuthorName");
			String price = req.getParameter("price");
			String bStatus = req.getParameter("bStatus");

			BookDtls b = new BookDtls();
            b.setId(Id);
            b.setBookname(BookName);
            b.setAuthor(AuthorName);
            b.setPrice(price);
            b.setStatus(bStatus);
			
			
			BookDaoImpl dao = new BookDaoImpl(DbConnect.getConn());
			boolean f = dao.updateEditBooks(b);
			
			HttpSession session = req.getSession();
			
			
			if(f) {
				
				session.setAttribute("succMsg", "Book Updated");
				resp.sendRedirect("admin/AllBook.jsp");
			}else {
				session.setAttribute("failedMsg", "Something went wrong on server");
				resp.sendRedirect("admin/AllBook.jsp");
			}
			
		} catch (Exception e) {
			// TODO: handle exception

			e.printStackTrace();
		}

	}

}
