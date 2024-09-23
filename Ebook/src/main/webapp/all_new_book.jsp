<%@page import="com.entity.BookDtls"%>
<%@page import="java.util.List"%>
<%@page import="com.db.DbConnect"%>
<%@page import="com.dao.BookDaoImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!------ JStl--------------------- -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>New Books</title>
<%@include file="AllComponents/AllCss.jsp"%>
<style type="text/css">
#toast {
	min-width: 300px;
	position: fixed;
	bottom: 30px;
	left: 50%;
	margin-left: -125px;
	background: #333;
	padding: 10px;
	color: white;
	text-align: center;
	z-index: 1;
	font-size: 18px;
	visibility: hidden;
	box-shadow: 0px 0px 100px #000;
}

#toast.display {
	visibility: visible;
	animation: fadeIn 0.5, fadeOut 0.5s 2.5s;
}

@
keyframes fadeIn {from { bottom:0;
	opacity: 0;
}

to {
	bottom: 30px;
	opacity: 1;
}

}
@
keyframes fadeOut {form { bottom:30px;
	opacity: 1;
}

to {
	bottom: 0;
	opacity: 0;
}
}
</style>
</head>
<body>

	<c:if test="${not empty addCart}">
	
		<div id="toast">${addCart}</div>

		<script type="text/javascript">
		showToast();
		function showToast(content)
		{
		    $('#toast').addClass("display");
		    $('#toast').html(content);
		    setTimeout(()=>{
		        $("#toast").removeClass("display");
		    },2000)
		}	
</script>
		<c:remove var="addCart" scope="session" />
	</c:if>


	<%@include file="AllComponents/NavBar.jsp"%>
	<div class="container ">
		<h1 class="text-center m-5 text-success">New Arrivals</h1>
		<div class="row g-5">


			<%
			BookDaoImpl dao = new BookDaoImpl(DbConnect.getConn());
			List<BookDtls> list = dao.getAllNewBook();
			for (BookDtls b : list) {
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