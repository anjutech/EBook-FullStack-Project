<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Setting</title>
<%@include file="AllComponents/AllCss.jsp"%>
<style type="text/css">
</style>

</head>
<body>
	<%@include file="AllComponents/NavBar.jsp"%>

	<c:if test="${empty userobj }">
		<c:redirect url="Login.jsp" />
	</c:if>

	<div class="container">
		<div class="row p-5 g-5">

			<c:if test="${not empty userobj}">
				<h3 class="text-center shadow-lg">
					Hello, <i class="text-success">${userobj.email}</i>
				</h3>

			</c:if>
			<div class="col-md-4">
				<div class="card shadow-lg">
					<div class="card-body text-center">
						<div class="text-secondary">
							<a href="sell_book.jsp"> <i
								class="fas fa-book-open fa-3x text-info"></i></a>
						</div>
						<h3>Sell Old Book</h3>
						<p>You can Add Your Old Books For Sell!</p>

					</div>
				</div>

			</div>

			<div class="col-md-4">
				<div class="card shadow-lg">
					<div class="card-body text-center">
						<div class="text-secondary">
							<a href="ListOfSell_book.jsp"> <i
								class="fas fa-list fa-3x text-secondary"></i></a>
						</div>
						<h3>Books You Add</h3>
						<p>List of Books That You Have Added To The Site!</p>
					</div>
				</div>

			</div>

			<div class="col-md-4">
				<div class="card shadow-lg">
					<div class="card-body text-center">
						<div class="text-primary">
							<a href="edit_profile.jsp"> <i class="fas fa-edit fa-3x"></i></a>
						</div>
						<h3>Login &amp; Security </h3>
						<p>Edit Your Profile Here!</p>
					</div>
				</div>
			</div>


			<div class="col-md-4 mt-3">
				<div class="card shadow-lg">
					<div class="card-body text-center">
						<div class="text-warning">
							<a href="user_address.jsp"><i
								class="fas fa-map-marker fa-3x text-warning"></i></a>
						</div>
						<h3>Your Address</h3>
						<p>Edit Addresss</p>
					</div>
				</div>
			</div>



			<div class="col-md-4 mt-3">
				<div class="card shadow-lg">
					<div class="card-body text-center">
						<div class="text-danger">
							<a href="order.jsp"> <i
								class="fas fa-box-open fa-3x text-danger"></i></a>
						</div>
						<h3>My Order</h3>
						<p>Track Your Order</p>
					</div>
				</div>
			</div>



			<div class="col-md-4 mt-3 ">
				<div class="card shadow-lg">
					<div class="card-body text-center">
						<div class="text-success">
							<a href="helpline.jsp"> <i
								class="fas fa-user-circle fa-3x text-success"></i></a>
						</div>
						<h3>Help Center</h3>
						<p>24*7</p>
					</div>
				</div>
			</div>



		</div>
	</div>


	<%@include file="AllComponents/Footer.jsp"%>
</body>
</html>