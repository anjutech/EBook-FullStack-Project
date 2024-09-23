<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>


<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Order Successfull</title>
<%@include file="AllComponents/AllCss.jsp"%>

</head>
<body>
	<%@include file="AllComponents/NavBar.jsp"%>

	<div class="container">
		<div class="row">
			<div class="col-md-6 offset-md-3">
				<div class="card m-5 shadow-lg">
				<i
							class="fa-solid fa-circle-check fa-4x text-warning position-absolute "
							style="margin-top:-30px;margin-left:40%"></i>
					<div class="card-body text-center text-success m-3">
						
						<h1>Thank you</h1>
						<h3>Your Order Placed Successfuly!</h3>
						<p>With in 7 days , Your product will be delivered In your
							Address!</p>
						<a href="index.jsp" class="btn btn-outline-warning">Home</a> <a
							href="order.jsp" class="btn btn-outline-warning">View Order
							List!</a>

					</div>
				</div>
			</div>
		</div>
	</div>


	<%@include file="AllComponents/Footer.jsp"%>

</body>
</html>