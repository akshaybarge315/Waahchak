<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<div class="container-fluid"
	style="height: 5px; background-color: #b86111"></div>

<div class="container-fluid p-3 bg-light">
	<div class="row">
		<div class="col-md-9">
			<img alt="Image" src="../assets/img/Waahchak-Logo-300x69.png"
				height="40" width="160">
			<!-- <h3><i class="fa-solid fa-book"></i> Waahchak</h3> -->
		</div>

		<div class="col-md-3">
			<c:if test="${not empty user}">
				<a class="btn btn-success"><i class="fa-solid fa-user"></i> ${ user.name}
				</a>
				<a data-bs-toggle="modal" data-bs-target="#exampleModal"
					class="btn btn-primary"><i
					class="fa-solid fa-arrow-right-to-bracket"></i> Logout</a>
			</c:if>

			<c:if test="${empty user}">
				<a href="login.jsp" class="btn btn-success"><i
					class="fa-solid fa-user-plus"></i> Login</a>
				<a href="register.jsp" class="btn btn-primary"><i
					class="fa-solid fa-arrow-right-to-bracket"></i> SignUp</a>
			</c:if>
		</div>


	</div>
</div>


<!-- Logout -->

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div class="modal-body text-center">
				<h5>Do you want to logout?</h5>
				<button type="button" class="btn btn-secondary"
					data-bs-dismiss="modal">Close</button>
				<a href="<%=request.getContextPath()%>/logout" type="button"
					class="btn btn-primary">logout</a>
			</div>
			<div class="modal-footer"></div>
		</div>
	</div>
</div>
<!-- end logout -->

<nav class="navbar navbar-expand-lg navbar-dark bg-custom">
	<div class="container-fluid">
		<a class="navbar-brand" href="#"><i class="fa-solid fa-house"></i></a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav me-auto mb-2 mb-lg-0">
				<li class="nav-item"><a class="nav-link active"
					aria-current="page" href="home.jsp">Home</a></li>
			</ul>
		</div>
	</div>
</nav>