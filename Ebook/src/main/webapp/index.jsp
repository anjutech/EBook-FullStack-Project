<%@page import="com.entity.User"%>
<%@page import="com.entity.BookDtls"%>
<%@page import="java.util.List"%>
<%@page import="com.dao.BookDaoImpl"%>
<%@page import="com.db.DbConnect"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
	<!-- Jstl Uri -->
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>E-Book</title>
<%@include file="AllComponents/AllCss.jsp"%>

<style>
body {
	background: url("img/BookShelf.jpg");
	height: 100vh;
	width: 100%;
	background-repeat: no-repeat;
	background-size: cover;
}
</style>
</head>
<body>

	<%
	User u = (User) session.getAttribute("userobj");
	%>
	<div class="container-fluid ">
		<%@include file="AllComponents/NavBar.jsp"%>
	</div>




	<!-- Start Recent Book Cards -->
	<hr>
	<div class="container 	">
		<h1 class="text-center m-5 text-success">Recent Books</h1>
		<div class="row  g-5">

			<%
			BookDaoImpl dao2 = new BookDaoImpl(DbConnect.getConn());
			List<BookDtls> list2 = dao2.getRecentBooks();
			for (BookDtls b : list2) {
			%>
			<div class="col-md-3">
				<div class="card border-success">
					<div class="card-body text-center ">
						<p>
							Book Name: <b><%=b.getBookname()%></b>
						</p>

						<img src="img/<%=b.getPhoto()%>"
							style="width: 150px; height: 200px" class="img-thumblin">
						<p>
							Writer: <i><%=b.getAuthor()%></i>
						</p>
						<p>
							Categories:
							<%=b.getCategory()%></p>
						<div class="row">
							<div class="col">

								<%
								if (u == null) {
								%>
								<a href="Login.jsp" class=" btn btn-success btn-sm ">Buy In
									$<%=b.getPrice()%></a>
								<%
								} else {
								%>

								<a href="cart?bid=<%=b.getId()%>&&uid=<%=u.getId()%>"
									class=" btn btn-success btn-sm ">Buy In $<%=b.getPrice()%></a>


								<%
								}
								%>
								<a href="view_books.jsp?id=<%=b.getId()%>"
									class=" btn btn-success btn-sm">View</a>
							</div>
						</div>
					</div>
				</div>
			</div>
			<%
			}
			%>
		</div>

		<div class="text-center mt-1">
			<a href="all_recent_book.jsp"
				class="btn btn-outline-success btn-sm mt-5">View All</a>
		</div>
	</div>


	<!-- End Of  Recent Book Cards -->


	<!-- Start New Book Cards -->
	<hr>
	<div class="container ">
		<h1 class="text-center m-5 text-success">New Arrivals</h1>
		<div class="row g-5">


			<%
			BookDaoImpl dao = new BookDaoImpl(DbConnect.getConn());
			List<BookDtls> list4 = dao.getNewBook();
			for (BookDtls b : list4) {
			%>
			<div class="col-md-3">
				<div class="card border-success">
					<div class="card-body text-center ">
						<p>
							Book Name: <b><%=b.getBookname()%></b>
						</p>

						<img src="img/<%=b.getPhoto()%>"
							style="width: 150px; height: 200px" class="img-thumblin">
						<p>
							Writer: <i><%=b.getAuthor()%></i>
						</p>
						<p>
							Categories:
							<%=b.getCategory()%></p>
						<div class="row">
							<div class="col">
								<a href="#" class=" btn btn-success btn-sm ">Buy In $<%=b.getPrice()%></a>
								<a href="view_books.jsp?id=<%=b.getId()%>"
									class=" btn btn-success btn-sm">View</a>
							</div>
						</div>
					</div>
				</div>
			</div>

			<%
			}
			%>


		</div>
		<div class="text-center mt-1">
			<a href="all_new_book.jsp"
				class="btn btn-outline-success btn-sm mt-5">View All</a>
		</div>
	</div>


	<!-- End Of  New Book Cards -->




	<!-- Start Old Book Cards -->
	<hr>
	<div class="container ">
		<h1 class="text-center m-5 text-success">Second Hand Collection</h1>
		<div class="row g-5">

			<%
			BookDaoImpl dao3 = new BookDaoImpl(DbConnect.getConn());
			List<BookDtls> list3 = dao3.getoldBooks();
			for (BookDtls b : list3) {
			%>
			<div class="col-md-3">
				<div class="card border-success">
					<div class="card-body text-center ">
						<p>
							Book Name: <b><%=b.getBookname()%></b>
						</p>


						<img src="img/<%=b.getPhoto()%>"
							style="width: 150px; height: 200px" class="img-thumblin">
						<p>
							Writer: <i><%=b.getAuthor()%></i>
						</p>
						<p>
							Categories:
							<%=b.getCategory()%></p>
						<div class="row">
							<div class="col">
								<a href="#" class=" btn btn-success btn-sm ">Buy In $ <%=b.getPrice()%>
								</a> <a href="view_books.jsp?id=<%=b.getId()%>"
									class=" btn btn-success btn-sm">View</a>
							</div>
						</div>
					</div>
				</div>
			</div>
			<%
			}
			%>


		</div>
		<div class="text-center mt-1">
			<a href="all_old_book.jsp"
				class="btn btn-outline-success btn-sm mt-5">View All</a>
		</div>
	</div>
	<hr>

	<!-- End Of  Old Book Cards -->

	<%@include file="AllComponents/Footer.jsp"%>
</body>
</html>