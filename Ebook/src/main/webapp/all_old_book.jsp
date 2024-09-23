<%@page import="com.entity.BookDtls"%>
<%@page import="java.util.List"%>
<%@page import="com.db.DbConnect"%>
<%@page import="com.dao.BookDaoImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Old Books</title>
<%@include file="AllComponents/AllCss.jsp" %>
</head>
<body>
<%@include file="AllComponents/NavBar.jsp" %>
<div class="container ">
		<h1 class="text-center m-5 text-success">Second Hand Collection</h1>
		<div class="row g-5">
		
		<%
		BookDaoImpl dao3 = new BookDaoImpl(DbConnect.getConn());
		List<BookDtls>  list3  = dao3.getAlloldBooks();
		for (BookDtls b : list3) {
		%>
			<div class="col-md-3">
				<div class="card border-success">
					<div class="card-body text-center ">
						

						<img src="img/<%=b.getPhoto() %>" style="width: 150px; height: 200px"
							class="img-thumblin">
							<p>
							Book Name: <b><%=b.getBookname() %></b>
						</p>
						<p>
							Writer: <i><%=b.getAuthor() %></i>
						</p>
						<p>
							Categories: <%=b.getCategory()%></p>
						<div class="row">
							<div class="col">
								<a href="#" class=" btn btn-success btn-sm ">Buy In $ <%=b.getPrice()%> </a> 
								<a href="#" class=" btn btn-success btn-sm">View</a>
							</div>
						</div>
					</div>
				</div>
			</div>
			<%
				}
				%>


		</div>
	</div>

</body>
</html>