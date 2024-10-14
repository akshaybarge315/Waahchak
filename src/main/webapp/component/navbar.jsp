
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<div class="container-fluid"
	style="height: 5px; background-color: #b86111"></div>

<div class="container-fluid p-3 bg-light">
	<div class="row">
		<div class="col-md-3">
			<img alt="Image" src="assets/img/Waahchak-Logo-300x69.png"
				height="40" width="160">
			<!-- <h3><i class="fa-solid fa-book"></i> Waahchak</h3> -->
		</div>

		<div class="col-md-6">
			<form class="d-flex" action="serachBook.jsp" method="post">
				<input class="form-control me-2" type="search" placeholder="Search"
					aria-label="Search" name="ch">
				<button class="btn btn-primary" type="submit">Search</button>
			</form>
		</div>

		<c:if test="${not empty user }">
			<div class="col-md-3">
				<a href="cart.jsp" class="btn btn-black"><i
					class="fa-solid fa-cart-plus fa-2x"></i></a> <a href="user.jsp"
					class="btn btn-success"><i class="fa-solid fa-user"></i>
					${user.name}</a> <a href="logout" class="btn btn-primary"><i
					class="fa-solid fa-arrow-right-to-bracket"></i> Logout</a>
			</div>
		</c:if>

		<c:if test="${empty user }">
			<div class="col-md-3">
				<a href="login.jsp" class="btn btn-success"><i
					class="fa-solid fa-user-plus"></i> Login</a> 
				<a href="register.jsp"
					class="btn btn-primary"><i
					class="fa-solid fa-arrow-right-to-bracket"></i> SignUp</a>
			</div>
		</c:if>

	</div>
</div>


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
					aria-current="page" href="index.jsp">Home</a></li>
				<li class="nav-item"><a class="nav-link active"
					href="all_recent_book.jsp"><i class="fa-solid fa-book-open"></i>
						Recent Book</a></li>
				<li class="nav-item"><a class="nav-link active"
					href="all_new_book.jsp"><i class="fa-solid fa-book-open"></i>
						New Book</a></li>
				<li class="nav-item"><a class="nav-link active"
					href="all_old_book.jsp"><i class="fa-solid fa-book"></i> Old
						Book</a></li>

			</ul>
		</div>
	</div>
</nav>