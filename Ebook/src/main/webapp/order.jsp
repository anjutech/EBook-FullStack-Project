<%@page import="com.entity.Book_Order"%>
<%@page import="java.awt.print.Book"%>
<%@page import="java.util.List"%>
<%@page import="com.db.DbConnect"%>
<%@page import="com.dao.BookOrderImpl"%>
<%@page import="com.entity.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>


<!-- Jstl -->
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Order's</title>
<%@include file="AllComponents/AllCss.jsp"%>

</head>
<body>
	<%@include file="AllComponents/NavBar.jsp"%>

	<div class="container">
      <h2 class="text-center border  rounded-pill mt-5 shadow-lg" >Your Order details</h2>
		<table
			class="table table-success table-hover   shadow-lg my-5 ">
			<thead >
				<tr>
					<th scope="col">OrderId</th>
					<th scope="col">Name</th>
					<th scope="col">Book Name</th>
					<th scope="col">Author</th>
					<th scope="col">Price</th>

				</tr>
			</thead>
			<tbody>
			<%
			BookOrderImpl dao=new BookOrderImpl(DbConnect.getConn());
			List<Book_Order> blist = dao.getBook();
			for(Book_Order b:blist){
				%>
				<tr>
					<th scope="row"><%=b.getOrder_id()%></th>
					<td><%=b.getName()%></td>
					<td><%=b.getAuthor()%></td>
					<td><%=b.getPrice()%></td>
					<td><%=b.getPaymentType()%></td>
				</tr>
				
			<%}
			%>
				
			</tbody>
		</table>

	</div>




	<%@include file="AllComponents/Footer.jsp"%>

</body>
</html>