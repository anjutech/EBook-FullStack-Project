<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Sell Book</title>
<%@include file="AllComponents/AllCss.jsp"%>

</head>
<body>
	<%@include file="AllComponents/NavBar.jsp"%>


	<c:if test="${empty userobj }">
		<c:redirect url="Login.jsp" />
	</c:if>

	<div class="container">
		<div class="row  p-5 g-5">
			<div class="col-md-6 offset-md-3">
				<div class="card">
					<div class="card-body">
					
					<c:if test="${not empty succMsg }">
							<p class="text-center text-success">${succMsg}</p>
							<c:remove var="succMsg" scope="session" />
						</c:if>

						<c:if test="${not empty failedMsg }">
							<p class="text-center text-danger">${failedMsg}</p>
							<c:remove var="failedMsg" scope="session" />
						</c:if>
								
					<h2 class="text-center text-success p-1" >Sell Old Book</h2>
						<form action="SellOldBook" method="post" enctype="multipart/form-data">
							<div class="form-group">							
							
								<label for="exampleInputEmail1">Book Name*</label> <input
									type="text" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" placeholder="Book Name" required
									name="BookName">

							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Author Name*</label> <input
									type="text" class="form-control" id="exampleInputPassword1"
									placeholder="AuthorName" required name="AuthorName">
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Price*</label> <input
									type="text" class="form-control" id="exampleInputPassword1"
									placeholder="Price" required name="price">
							</div>



							<div class="form-group">
								<label for="exampleFormControlFile1">Upload Photo</label> <input
									type="file" class="form-control-file mt-2"
									id="exampleFormControlFile1" name="bimg">
							</div>
							<button type="submit" class="  btn btn-success mt-2">
								Sell</button>
								
								
								
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>



















	<%@include file="AllComponents/Footer.jsp"%>

</body>
</html>