<%@page import="com.entity.BookDtls"%>
<%@page import="java.util.List"%>
<%@page import="com.db.DbConnect"%>
<%@page import="com.dao.BookDaoImpl"%>
<%@page import="java.awt.print.Book"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Recent Books</title>
<%@include file="AllComponents/AllCss.jsp"%>
</head>
<body>
	<%@include file="AllComponents/NavBar.jsp"%>

	<div class="container-fluid">
		<div class="row g-5 m-5">
		<%
		BookDaoImpl dao2 = new BookDaoImpl(DbConnect.getConn());
		List<BookDtls> list2 = dao2.getAllRecentBooks();
		for(BookDtls b:list2){
		%>
			<div class="col-md-3 ">
				<div class="card border-success">
					<div class="card-body text-center ">
						<p>
							Book Name: <b><%=b.getBookname()%></b>
						</p>

						<img src="img/<%=b.getPhoto()%>" style="width: 150px; height: 200px"
							class="img-thumblin">
						<p>
							Writer: <i><%=b.getAuthor()%></i>
						</p>
						<p>
							Categories: <%=b.getCategory()%></p>
						<div class="row">
							<div class="col">
								<a href="#" class=" btn btn-success btn-sm ">Buy In $<%=b.getPrice() %></a> <a
									href="#" class=" btn btn-success btn-sm">View</a>
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