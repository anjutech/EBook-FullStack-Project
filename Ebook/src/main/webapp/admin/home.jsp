<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!------ JStl--------------------- -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin:Home</title>
<%@include file="AllCss.jsp"%>
</head>
<body>
	<%@include file="NavBar.jsp"%>
	
	<c:if test="${empty userobj }">
	   <c:redirect url="../Login.jsp"/>
	</c:if>
		
<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title text-center " id="exampleModalLabel">Confirmation Massage !</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
      <h4 class="text-center text-danger">Are You Sure want to logout?</h4>
      </div>
      <div class="modal-footer">
      <button type="button" class="btn btn-outline-success " data-bs-dismiss="modal">Close</button>
        <a href="../logout" type="button" class="btn btn-outline-danger ">Logout</a>
      </div>
    </div>
  </div>
</div>


	<div class="container mt-5">
		<div class="row  g-2 p-2 m-2 shadow-lg  rounded">
			<div class="col-md-3 ">
				<div class="card shadow-lg text-success">
					<div class=" card-body text-center">
		 				<a href="AddBook.jsp"
							class="link-offset-2 link-underline link-underline-opacity-0">

							<i class="fas fa-plus-square fa-3x p-2"></i>
						</a> <br>
						<h4>Add Books</h4>
						-----------------
					</div>
				</div>

			</div>


			<div class="col-md-3">

				<div class="card shadow-lg text-success ">
					<div class=" card-body text-center">
					<a href="AllBook.jsp"
							class="link-offset-2 link-underline link-underline-opacity-0">
					
						<i class="fas fa-book-open fa-3x p-2"></i>
						</a>
						<br>
						<h4>All Books</h4>
						-----------------
					</div>
				</div>
			</div>

			<div class="col-md-3">

				<div class="card shadow-lg text-success ">
					<div class=" card-body text-center">
					<a href="Orders.jsp"
							class="  link-offset-2 link-underline link-underline-opacity-0">
					
						<i class="fas fa-box-open fa-3x p-2"></i>
						</a>
						<br>
						<h4>Orders</h4>
						-----------------
					</div>
				</div>
			</div>

			<div class="col-md-3">

				<div class="card shadow-lg text-success ">
					<div class=" card-body text-center" data-bs-toggle="modal" data-bs-target="#exampleModal">
						<i class="fas fa-sign-out-alt fa-3x p-2"></i><br>
						<h4>Log Out</h4>
						-----------------
					</div>
				</div>
			</div>



		</div>
	</div>


</body>
</html>