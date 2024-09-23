<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!------ JStl--------------------- -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ page isELIgnored="false"%>
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
		<c:redirect url="../Login.jsp" />
	</c:if>
	<div class="container-fluid">
		<div class="row m-5">
			<div class="col-md-6    offset-md-3">
				<div class="card shadow-lg">
					<div class="card-body">

						<c:if test="${not empty succMsg }">
							<p class="text-center text-success">${succMsg}</p>
							<c:remove var="succMsg" scope="session" />
						</c:if>

						<c:if test="${not empty failedMsg }">
							<p class="text-center text-danger">${failedMsg}</p>
							<c:remove var="failedMsg" scope="session" />
						</c:if>

						<h4 class="text-center text-success m-5">Add Books</h4>
						
					</div>
				</div>
			</div>
		</div>
		<div></div>
	</div>
</body>
</html>