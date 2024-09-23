package com.admin.servlet;

import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.dao.BookDaoImpl;
import com.db.DbConnect;
import com.entity.BookDtls;


@WebServlet("/AddBook")
@MultipartConfig
public class BooksAdd extends HttpServlet{

	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			
		String	 BookName = req.getParameter("BookName");
		String	AuthorName = req.getParameter("AuthorName");
		String	price      = req.getParameter("price");
		String	btype      = req.getParameter("btype");
		String	bStatus    = req.getParameter("bStatus");
		Part part       = req.getPart("bimg");
		String fileName = part.getSubmittedFileName();
			
		BookDtls b = new BookDtls(BookName,AuthorName,price,btype,bStatus,fileName);

		BookDaoImpl dao = new BookDaoImpl(DbConnect.getConn());
		
		
		
		boolean f = dao.addBooks(b);
		
		HttpSession session = req.getSession();
		
		if (f) {
			
			String path = getServletContext().getRealPath("")+"img";
			
			File file = new File(path);
			part.write(path + File.separator + fileName);
			
			System.out.println(file);
			
			session.setAttribute("succMsg", "Book Add SuccessFully!");
		    resp.sendRedirect("admin/AddBook.jsp");
		}else {
			session.setAttribute("failedMsg", "Something went Wrong on Server!");
		    resp.sendRedirect("admin/AddBook.jsp");
		}
		
		
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
	}


}
