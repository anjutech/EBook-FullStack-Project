
<!------ JStl--------------------- -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ page isELIgnored="false"%>

<%@include file="AllCss.jsp" %>

<div class="container-fluid p-3">
	<div class="row mt-3 g-1">

		<div class="col-md-3">
			<h3 class="text text-success">
				<i class="fas fa-book"></i> E-Book
			</h3>
		</div>



		<div class="col-md-4">
		<form class="form-inline " action="Search.jsp" method="post">
		<input class="form-control " type=search
		name="ch" placeholder="Enter for Search Your Book!" aria-label="Search">
		</form>
		</div>






		<c:if test="${not empty userobj}">
			<div class="col-md-5 ">

				<a href="cart.jsp"> <i
					class="fas fa-cart-plus fa-2x float-end text-white"></i></a> <a href=""
					class="btn btn-success  float-end mx-1"> <i
					class="fas fa-user-plus"></i> ${userobj.password}
				</a> <a href="logout" class="btn btn-success  float-end"> <i
					class="fas fa-sign-in-alt"></i> Logout
				</a>
			</div>
		</c:if>

		<c:if test="${ empty userobj}">
			<div class="col-md-5">
				<a href="Login.jsp" class="btn btn-success float-end m-1"> <i
					class="fas fa-sign-in-alt"></i> Login
				</a> <a href="Register.jsp" class="btn btn-success float-end m-1"> <i
					class="fas fa-user-plus"></i> SignUp
				</a>
			</div>
		</c:if>

	</div>
</div>


<nav
	class="container-fluid navbar navbar-expand-lg navbar-dark bg-success rounded-pill">
	<div class="container-fluid">
		<a class="navbar-brand" href="index.jsp"><i class="fas fa-home"></i>
		</a>
		<button class="navbar-toggler border " type="button"
			data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon "></span>
		</button>
		<div class="collapse navbar-collapse " id="navbarSupportedContent">
			<ul class="navbar-nav me-auto mb-2 mb-lg-0">


				<li class="nav-item "><a class="nav-link text-light "
					href="all_recent_book.jsp"><i class="fas fa-book-open"></i>
						Recent Book</a></li>

				<li class="nav-item "><a class="nav-link text-light"
					href="all_new_book.jsp" tabindex="-1" aria-disabled="true"><i
						class="fas fa-book-open"></i> New Book</a></li>

				<li class="nav-item "><a class="nav-link text-light"
					href="all_old_book.jsp" tabindex="-1" aria-disabled="true"><i
						class="fas fa-book-open"></i> Old Book</a></li>
			</ul>
			<form class="form-inline ">
				<a href="setting.jsp"
					class="  btn btn-light btn-sm border rounded-3 text-success"> <i
					class="fas fa-cog"></i> Setting
				</a>
				<button class="btn btn-light btn-sm border rounded-3 text-success">
					<i class="fas fa-phone"></i> Contact Us
				</button>
			</form>
		</div>
	</div>
</nav>