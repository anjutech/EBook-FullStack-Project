
<%@page import="java.util.List"%>
<%@page import="com.entity.User"%>
<%@page import="com.db.DbConnect"%>
<%@page import="com.dao.CartDAOImpl"%>
<%@page import="com.entity.Cart"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!------ JStl--------------------- -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Cart</title>
<%@include file="AllComponents/AllCss.jsp"%>
</head>
<body>
	<%@include file="AllComponents/NavBar.jsp"%>

	<c:if test="${empty userobj}">
		<c:redirect url="Login.jsp"></c:redirect>
	</c:if>



	<div class="container">
		<c:if test="${not empty succMsg }">
			<div class="alert alert-success text-center mt-1" role="alert">${succMsg}</div>
			<c:remove var="succMsg" scope="session" />
		</c:if>

		<c:if test="${not  empty failedMsg }">
			<div class="alert alert-danger text-center mt-1" role="alert">${failedMsg}</div>
			<c:remove var="failedMsg" scope="session" />
		</c:if>
		<div class="row  p-5 g-5">
			<div class="col-md-6">
				<div class="card  shadow-lg">
					<div class="card-body">
						<h3 class="text-center text-success">Your selected items</h3>

						<table class="table table-success table-hover border-success ">
							<thead>
								<tr>
									<th scope="col">Book Name</th>
									<th scope="col">Author</th>
									<th scope="col">Price</th>
									<th scope="col">Action</th>
								</tr>
							</thead>
							<tbody>
								<%
								User u = (User) session.getAttribute("userobj");

								CartDAOImpl dao = new CartDAOImpl(DbConnect.getConn());
								List<Cart> cart = dao.getBookByUser(u.getId());
								Double totalprice = 0.00;
								for (Cart c : cart) {
									totalprice = c.getTotalPrice();
								%>
								<tr>
									<th scope="row"><%=c.getBookName()%></th>
									<td><%=c.getAuthor()%></td>
									<td><%=c.getPrice()%></td>
									<td><a
										href="remove_book?bid=<%=c.getBid()%>&&uid=<%=c.getUid()%>&&cid=<%=c.getCid()%>"
										class="btn btn-sm btn-danger">Remove</a></td>
								</tr>
								<%
								}
								%>

								<tr class="text-danger">
									<th>Total Price:</th>
									<td></td>
									<td><%=totalprice%>
									<td></td>


								</tr>
							</tbody>
						</table>

					</div>
				</div>
			</div>




			<div class="col-md-6">
				<div class="card">
					<div class="card-body  shadow-lg text-success">
						<h3 class="text-center text-success">Your Order details</h3>


						<form action="order" method="post" >
							<input type="hidden" value="${userobj.id}" name="id" required>

							<div class="row">
								<div class="col-md-6">
									<label for="inputName" class="form-label">Name</label> <input
										type="text" class="form-control" id="inputName" name="name" required>
								</div>
								<div class="col-md-6">
									<label for="inputEmail4" class="form-label">Email</label> <input
										type="email" class="form-control" id="inputEmail4"
										value="<%=u.getEmail()%>" readonly="readonly" name="email" required>

								</div>

								<div class="col-md-6">
									<label for="inputPhone" class="form-label">Phone</label> <input
										type="text" class="form-control" id="inputPhone" name="phone" required>
								</div>
								
								<div class="col-md-6">
									<label for="inputCity" class="form-label">City</label> <input
										type="text" class="form-control" id="inputCity" name="city" required>
								</div>
								<div class="col-12">
									<label for="inputAddress" class="form-label">Address</label> <input
										type="text" class="form-control" id="inputAddress"
										placeholder="1234 Main St" name="address" required>
								</div>

								<div class="col-md-6">
									<label for="inputState" class="form-label">State</label> <select
										id="inputState" class="form-select" name="state" required>
										<option selected>----Select---</option>
										<option>Hrayana</option>
										<option>Delhi</option>
										<option>Kerala</option>
										<option>Odisha</option>
										<option>Punjab</option>
										<option>Himachal</option>
										<option>Uttrakhand</option>

									</select>
								</div>
								<div class="col-md-6">
									<label for="inputZip" class="form-label">Zip</label> <input
										type="text" class="form-control" id="inputZip" name="zip" required>
								</div>
								<div class="col-md-12">
									<label for="inputState" class="form-label">Payment Type</label>
									<select id="inputState" class="form-select" name="paymentmode" required>
										<option value="noselect">----Select---</option>
										<option value="cod">Cash On Delivery</option>
									</select>
								</div>


								<div class="text-center m-4">
									<button class="btn btn-warning text-white">Order Now</button>
									<a href="index.jsp" class="btn btn-outline-success">Continue
										Shopping</a>
								</div>
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