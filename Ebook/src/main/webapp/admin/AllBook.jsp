<%@page import="com.entity.BookDtls"%>
<%@page import="com.db.DbConnect"%>
<%@page import="com.dao.BookDaoImpl"%>
<%@page import="java.awt.print.Book"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>All Books</title>
<%@include file="AllCss.jsp"%>
</head>
<body>
	<%@include file="NavBar.jsp"%>
		<c:if test="${empty userobj }">
	   <c:redirect url="../Login.jsp"/>
	</c:if>
	<c:if test="${not empty succMsg }">
		<p class="text-center text-success">${succMsg}</p>
		<c:remove var="succMsg" scope="session" />
	</c:if>

	<c:if test="${not empty failedMsg }">
		<p class="text-center text-danger">${failedMsg}</p>
		<c:remove var="failedMsg" scope="session" />
	</c:if>
	<h3 class="text-center text-success m-5">Hello Admin</h3>

	<div class="table-responsive-lg">

		<table class="table table-striped  table-hover ">
			<thead class="bg-success text-white">
				<tr>
					<th scope="col">Id</th>
					<th scope="col">Cover Image</th>
					<th scope="col">Book Name</th>
					<th scope="col">Author</th>
					<th scope="col">Price</th>
					<th scope="col">Categories</th>
					<th scope="col">Status</th>
					<th scope="col">Action</th>

				</tr>
			</thead>
			<tbody>
				<%
			    BookDaoImpl dao = new BookDaoImpl(DbConnect.getConn());
				List<BookDtls> list = dao.getAllBook();
				for (BookDtls b:list){
			%>
				<tr>
					<td><%=b.getId() %></td>
					<td><img src="../img/<%=b.getPhoto()%>"
						style="width: 50px;height=50px;"></td>
					<td><%=b.getBookname()%></td>
					<td><%=b.getAuthor()%></td>
					<td><%=b.getPrice()%></td>
					<td><%=b.getCategory()%></td>
					<td><%=b.getStatus()%></td>

					<td><a href="edit_books.jsp?id=<%=b.getId()%>"
						class="btn btn-sm btn-outline-success">Edit</a> 
						<a href="../delete?id=<%=b.getId()%>"
						class="btn btn-sm btn-outline-danger">Delete</a></td>
				</tr>
				<%
				}%>

			</tbody>
		</table>
	</div>
</body>
</html>