<%@page import="com.dao.BookOrderDAo"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@page import="com.entity.Book_Order"%>
<%@page import="java.awt.print.Book"%>
<%@page import="java.util.List"%>
<%@page import="com.db.DbConnect"%>
<%@page import="com.dao.BookOrderImpl"%>
<%@page import="com.entity.User"%>

<!-- Jstl -->
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>All Orders</title>
<%@include file="AllCss.jsp"%>
</head>
<body>
	<%@include file="NavBar.jsp"%>
	<c:if test="${empty userobj }">
	   <c:redirect url="../Login.jsp"/>
	</c:if>
	<h3 class="text-center text-success m-5">Hello Admin</h3>

	<div class="table-responsive-lg">

		<table class="table table-striped  table-hover ">
			<thead class="bg-success text-white">
				<tr >
					<th scope="col">Odr. Id</th>
					<th scope="col">Name</th>
					<th scope="col">Email</th>
					<th scope="col">Address</th>
					<th scope="col">Phone</th>
					<th scope="col">Book </th>
					<th scope="col">Author</th>
					<th scope="col">Price</th>
					<th scope="col">Payment Mode</th>

				</tr>
			</thead>
			<tbody>
			<%
		BookOrderImpl dao=new BookOrderImpl(DbConnect.getConn());
			List<Book_Order> blist=dao.getBook();
			for(Book_Order b:blist){
				%>
				<tr>
					<th scope="row"><%=b.getOrder_id()%></th>
					<td><%=b.getName()%></td>
					<td><%=b.getEmail()%></td>
					<td><%=b.getAddress()%></td>
					<td><%=b.getPhone()%></td>
					<td><%=b.getBookName()%></td>
					<td><%=b.getAuthor()%></td>
					<td><%=b.getPrice()%></td>
					<td><%=b.getPaymentType()%></td>
					
				</tr>
				<%} %>
			</tbody>
		</table>
	</div>
</body>
</html>