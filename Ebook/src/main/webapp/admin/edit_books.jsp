<%@page import="com.entity.BookDtls"%>
<%@page import="com.db.DbConnect"%>
<%@page import="com.dao.BookDaoImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
		<!------ JStl--------------------- -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ page isELIgnored = "false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add books</title>
<%@include file="AllCss.jsp"%>
</head>
<body>
	<%@include file="NavBar.jsp"%>
		<c:if test="${empty userobj }">
	   <c:redirect url="../Login.jsp"/>
	</c:if>
	<div class="container-fluid">
		<div class="row m-5">
			<div class="col-md-6    offset-md-3">
				<div class="card shadow-lg">
					<div class="card-body">
					
				
					
						<h4 class="text-center text-success m-5">Edit Books</h4>
						
						
						<%
						 int id =Integer.parseInt(request.getParameter("id"));
						BookDaoImpl dao = new BookDaoImpl(DbConnect.getConn());
						BookDtls b = dao.getBookById(id);
						%>
						
						<form action="../edit_books" method="post" >
						<input type="hidden" name="Id" value="<%=b.getId()%>">
						
							<div class="form-group">
								<label for="exampleInputEmail1">Book Name*</label> <input
									type="text" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" placeholder="Book Name" required name="BookName"
									value="<%=b.getBookname()%>">

							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Author Name*</label> <input
									type="text" class="form-control" id="exampleInputPassword1"
									placeholder="Author Name" required name="AuthorName" value="<%=b.getAuthor()%>">
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Price*</label> <input
									type="text" class="form-control" id="exampleInputPassword1"
									placeholder="Price" required name="price" value="<%=b.getPrice()%>">
							</div>
							

							<div class="form-group ">
								<label for="inputState">Book status</label> <select
									id="inputState" class="form-control" name="bStatus">
									<% if("Active".equals(b.getStatus())) {
									%>
								
										<option>Active</option>
										<option>InActive</option>
										
									<%
									}else{%>
									
										<option>InActive</option>
										<option>Active</option>
										
									<% }%>
									
								</select>
							</div>
							
							<button type="submit" class="  btn btn-success mt-2">
								Update</button>
						</form>
					</div>
				</div>
			</div>
		</div>
		<div></div>
	</div>
</body>
</html>