<%@page import="com.entity.User"%>
<%@page import="com.entity.BookDtls"%>
<%@page import="java.util.List"%>
<%@page import="com.db.DbConnect"%>
<%@page import="com.dao.BookDaoImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Books You Added For Sell</title>
<%@include file="AllComponents/AllCss.jsp"%>
</head>
<body>
	<%@include file="AllComponents/NavBar.jsp"%>
	<div class="container p-5">
		<table
			class="table table-success table-hover my-5 border border-success  shadow-lg">
			<thead>
				<tr>
					<th scope="col">Book Name</th>
					<th scope="col">Author</th>
					<th scope="col">Price</th>
					<th scope="col">Category</th>
					<th scope="col">Action</th>
				</tr>
			</thead>
			<tbody>

				<%
				
				BookDaoImpl dao = new BookDaoImpl(DbConnect.getConn());
				List<BookDtls> list7 = dao.getBookByold( "Old");
				for (BookDtls b : list7) {
				%>

				<tr>
					<td><%=b.getBookname()%></td>
					<td><%=b.getAuthor()%></td>
					<td><%=b.getPrice() %></td>
					<td><%=b.getCategory() %></td>
					<td><a href="delete_old_book?id=<%=b.getId()%>" class="btn btn-sm btn-outline-danger">Remove</a></td>
				</tr>

				<%
				}
				%>

			</tbody>
		</table>
	</div>
	<%@include file="AllComponents/Footer.jsp"%>

</body>
</html>