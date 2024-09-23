<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Profile</title>
<%@include file="AllComponents/AllCss.jsp"%>

</head>
<body>
	<%@include file="AllComponents/NavBar.jsp"%>

	<div class="container">
	
		<div class="row p-5 m-5 g-3">
			<div class="col-md-6 offset-md-3">
			<c:if test="${not empty failedMsg }">
					
					  <h3 class="text-center text-danger">${failedMsg}</h3>
					  
					  <c:remove var="failedMsg" scope="session"/>
					</c:if>
					
					
					<c:if test="${not empty succMsg }">
					
					  <h3 class="text-center text-success">${succMsg}</h3>
					  
					  <c:remove var="succMsg" scope="session"/>
					  
					</c:if>
				<div class="card shadow-lg ">
					<div class="card-body">
					<h2 class="text-center text-success my-5">Edit Profile</h2>
					
					
			
					
					
					
					<form action="edit_profile" method="post" >
								
					<input type="hidden" value="${userobj.id}" name="id">
					
								<div class="form-group">
									<label for="exampleInputEmail1">Email Address</label> <input
										type="email" class="form-control" id="exampleInputEmail1"
										aria-describedby="emailHelp" placeholder="Enter email" name="email" 
										value="${userobj.email}"
										>
									
								</div>
								<div class="form-group">
									<label for="exampleInputPassword1">Password</label> <input
										type="password" class="form-control"
										id="exampleInputPassword1" placeholder="Create Your New Password" name="password"
										value="${userobj.password}"	>
								</div>
								
								<button type="submit"
									class="btn  btn-sm mt-2 btn-outline-success ">Submit Update </button>
							</form>
					</div>
				</div>
			</div>
		</div>
	</div>




	<%@include file="AllComponents/Footer.jsp"%>
</body>
</html>