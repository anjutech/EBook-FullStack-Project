package com.user.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.BookOrderImpl;
import com.dao.CartDAOImpl;
import com.db.DbConnect;
import com.entity.Book_Order;
import com.entity.Cart;

@WebServlet("/order")
public class OrderServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		try {

			HttpSession session = req.getSession();

			int id = Integer.parseInt(req.getParameter("id"));
			String name = req.getParameter("name");
			String email = req.getParameter("email");
			String phone = req.getParameter("phone");
			String address = req.getParameter("address");
			String city = req.getParameter("city");
			String state = req.getParameter("state");
			String zip = req.getParameter("zip");
			String paymentmode = req.getParameter("paymentmode");

			CartDAOImpl dao = new CartDAOImpl(DbConnect.getConn());

			List<Cart> blist = dao.getBookByUser(id);

			if (blist.isEmpty()) {
				session.setAttribute("failedMsg", "Please choose Some Books To Order!");
				resp.sendRedirect("cart.jsp");
			} else {
				BookOrderImpl dao2 = new BookOrderImpl(DbConnect.getConn());

				Book_Order o = null;

				ArrayList<Book_Order> orderlist = new ArrayList<Book_Order>();
				Random r = new Random();
				for (Cart c : blist) {
					o = new Book_Order();
					o.setOrder_id("BOOK-ORD-00" + r.nextInt(1000));
					o.setName(name);
					o.setEmail(email);
					o.setPhone(phone);
					o.setAddress(address);
					o.setBookName(c.getBookName());
					o.setAuthor(c.getAuthor());
					o.setPrice(c.getPrice() + "");
					o.setPaymentType(paymentmode);
					orderlist.add(o);

				}

				if ("noselect".equals(paymentmode)) {
					session.setAttribute("failedMsg", "Please choose Payment Mode!");
					resp.sendRedirect("cart.jsp");

				} else {
					boolean f = dao2.saveOrder(orderlist);
					if (f) {
						resp.sendRedirect("order_success.jsp");

					} else {
						session.setAttribute("failedMsg", "Failed to Place a Order!");
						resp.sendRedirect("cart.jsp");
					}
				}

			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

	}

}
