<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ page isELIgnored="false"%>
<div class="container-fluid p-3">
	<div class="row mt-3 ">

		<div class="col-md-4">
			<h3 class="text text-success">
				<i class="fas fa-book"></i> E-Book
			</h3>
		</div>

		<div class="col-md-4 ">
			<form class="d-flex">
				<input class="form-control me-2" type="search" placeholder="Search"
					aria-label="Search">
				<button class="btn btn-outline-success" type="submit">Search</button>
			</form>
		</div>


		<div class="col-md-4 ">
			<c:if test="${not empty userobj }">
				<a href="Login.jsp" class="btn btn-success float-end m-1"> <i
					class="fas fa-user"></i> ${userobj.email}
				</a>

				<a data-bs-toggle="modal" data-bs-target="#exampleModal" class="btn btn-success float-end m-1"> <i
					class="fas fa-sign-in-alt"></i> Logout
				</a>

			</c:if>
			<c:if test="${empty userobj }">
				<a href="../Login.jsp" class="btn btn-success float-end m-1"> <i
					class="fas fa-sign-in-alt"></i> Login
				</a>
				<a href="../Register.jsp" class="btn btn-success float-end m-1">
					<i class="fas fa-user-plus"></i> SignUp
				</a>
			</c:if>
		</div>
	</div>
</div>



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




<nav
	class="container-fluid navbar navbar-expand-lg navbar-dark bg-success text-light">
	<div class="container-fluid">
		<a class="navbar-brand " href="home.jsp"><i class="fas fa-home "></i>
			<span class="btn-sm btn-light ">Home</span> </a>


	</div>
</nav>