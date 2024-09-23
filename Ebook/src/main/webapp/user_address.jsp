<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!-- Jstl -->
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Address</title>
<%@include file="AllComponents/AllCss.jsp"%>

</head>
<body>
	<%@include file="AllComponents/NavBar.jsp"%>

	<div class="container">
		<div class="row p-5 m-5 g-3">
			<div class="col-md-10 offset-md-1">
				<div class="card shadow-lg ">
					<div class="card-body">
						<h2 class="text-center text-success my-5">User Address</h2>
						
						<form action="">
						<div class="row">
						<div class="form-group col-md-6">
								<label for="inputAddress" class="form-label">Address</label> <input
									type="text" class="form-control" id="inputAddress"
									placeholder="1234 Main St">
							</div>
							
							<div class="form-group col-md-6">
								<label for="inputCity" class="form-label">Landmark</label> <input
									type="text" class="form-control" id="inputCity">
							</div>
							</div>
							<div class="row">
							<div class="form-group col-md-4">
								<label for="inputZip" class="form-label">State</label> <input
									type="text" class="form-control" id="inputZip">
							</div>
							<div class="form-group col-md-4">
								<label for="inputZip" class="form-label">State</label> <input
									type="text" class="form-control" id="inputZip">
							</div>
							<div class="form-group col-md-4">
								<label for="inputZip" class="form-label">Pin</label> <input
									type="text" class="form-control" id="inputZip">
							</div>
						</div>
						<div class="text-center m-4">
						<button class="btn btn-outline-warning">Update Address</button>
						</div>
						</form>
						
						
					</div>
				</div>
			</div>
		</div>
	</div>





	<%@include file="AllComponents/Footer.jsp"%>

</body>
</html>