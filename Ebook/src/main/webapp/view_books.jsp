<%@page import="com.entity.BookDtls"%>
<%@page import="com.db.DbConnect"%>
<%@page import="com.dao.BookDaoImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View Book Details</title>
<%@include file="AllComponents/AllCss.jsp"%>
</head>
<body>
	<%@include file="AllComponents/NavBar.jsp"%>
	
	<%
	int id = Integer.parseInt(request.getParameter("id"));
	BookDaoImpl dao=new BookDaoImpl(DbConnect.getConn());
	BookDtls b = dao.getBookById(id);
	%>
	
	
	<div class="container ">
		<div class="row g-5 mt-5  border border-success shadow-lg   rounded">
			<div class="col-md-6 text-center mb-5 text-success">
				<img src="img/<%=b.getPhoto() %>" style="height: 250px; width: 200px" ><br>
				<h5 class="mt-3">Book Name: <%=b.getBookname() %></h5>
				<h5>Author Name: <%=b.getAuthor() %></h5>
				<h5>Category: <%=b.getCategory() %></h5>
			</div>
			<div class="col-md-6 text-center text-success">
				<h1><%=b.getBookname() %> By <%=b.getAuthor() %></h1>
				<div class="row mt-5">
					<div class="col-md-4 text-success text center p-2 mt-5">
						<i class="fas fa-money-bill-wave fa-2x"></i>
						<p>Cash On Delivery</p>
					</div>

					<div class="col-md-4 text-success text center p-2 mt-5">
						<i class="fas fa-undo-alt fa-2x"></i>
						<p>Return Available</p>

					</div>

					<div class="col-md-4 text-success text center p-2 mt-5">
						<i class="fas fa-truck-moving fa-2x"></i>
						<p>FreeShipping</p>

					</div>


				</div>

				<div class="row text-center mt-5">
					<div class="col mt-5">
						<a href="" class="btn  btn-outline-success "><i class="fas fa-cart-plus"></i> Add to Cart</a> <a
							href="" class="btn btn-outline-success ">$ <%=b.getPrice() %></a>
					</div>



				</div>
			</div>
		</div>
	</div>
</body>
</html>