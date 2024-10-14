<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="com.ebook.daoImpl.BookDAOImpl, java.util.List, com.ebook.model.BookDetails, com.ebook.model.User"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Waahchak</title>

<%@ include file="component/allcss.jsp"%>

<style type="text/css">
.crd-ho:hover {
	background-color: #faf7f7;
}
</style>

<link rel="stylesheet" href="component/css/style.css">

</head>
<body style="background-color: #f5f0f0;">
	<%@ include file="component/navbar.jsp"%>

	<div class="container-flid back-img">
		<!-- <h2 class="text-center text-dark">EBook Management System</h2> -->
		<div id="carouselExampleIndicators" class="carousel slide"
			data-bs-ride="carousel">
			<ol class="carousel-indicators">
				<li data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0"
					class="active"></li>
				<li data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1"></li>
				<li data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2"></li>
			</ol>
			<div class="carousel-inner">
				<div class="carousel-item active">
					<img class="d-block w-100" src="assets/img/cartoon-little-boy.jpg"
						alt="First slide">
				</div>
				<div class="carousel-item">
					<img class="d-block w-100"
						src="assets/img/cartoon-little-girl-.jpg" alt="Second slide">
				</div>
				<div class="carousel-item">
					<img class="d-block w-100"
						src="assets/img/happy-cartoon-students.jpg" alt="Third slide">
				</div>
			</div>
		</div>

	</div>

	<!-- Start Recent book -->

	<div class="container">
		<h3 class="text-center mt-4 mb-4">Recent Book</h3>
		<div class="row">
			<%
			User u = (User) session.getAttribute("user");
			BookDAOImpl book = new BookDAOImpl();
			List<BookDetails> list = book.getAllRecentBooks();
			int i = 1;
			for (BookDetails b : list) {
				if (i++ <= 4) {
			%>

			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body">
						<div class="text-center">
							<img alt="" src="assets/book/<%=b.getPhoto()%>"
								style="width: 150px; height: 200px" class="img-thumblin">
						</div>
						<p class="mt-3 mb-0">
							<b>Book : </b><%=b.getBookName()%></p>
						<p class="mb-0">
							<b>Author : </b><%=b.getAuthorName()%></p>
						<p class="mb-0">
							<b>Categories : </b><%=b.getbCategeory()%></p>
						<p>
							<b>Price : ₹</b><%=b.getPrice()%></p>
						<div class="row">
							<%
							if (b.getbCategeory().equals("New")) {
							%>
							<%
							if (u == null) {
							%>
							<a href="login.jsp" class="btn btn-danger btn-sm"><i
								class="fa-solid fa-cart-plus"></i> Add to Cart</a>
							<%
							} else {
							%>
							<a href="cart?bid=<%=b.getBookId()%>&&uid=<%=u.getId()%>"
								class="btn btn-danger btn-sm"><i
								class="fa-solid fa-cart-plus"></i> Add to Cart</a>
							<%
							}
							%>
							<a href="view_books.jsp?bid=<%=b.getBookId()%>"
								class="btn btn-success btn-sm mt-2">View Details</a>
							<%
							} else {
							%>
							<a href="view_books.jsp?bid=<%=b.getBookId()%>"
								class="btn btn-success btn-md mt-2 mb-4">View Details</a>
							<%
							}
							%>
						</div>
					</div>
				</div>
			</div>

			<%
			}
			}
			%>
		</div>

		<div class="text-center mt-4">
			<a href="all_recent_book.jsp" class="btn btn-sm btn-danger">View
				All</a>
		</div>
	</div>

	<!-- End Recent book -->
	<hr>

	<!-- Start new book -->

	<div class="container">
		<h3 class="text-center mt-4 mb-4">New Book</h3>
		<div class="row">

			<%
			List<BookDetails> nList = book.getAllNewBooks();
			int i1 = 1;
			for (BookDetails nb : nList) {
				if (i1++ <= 4) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body">
						<div class="text-center">
							<img alt="" src="assets/book/<%=nb.getPhoto()%>"
								style="width: 150px; height: 200px" class="img-thumblin">
						</div>
						<p class="mt-3 mb-0">
							<b>Book : </b><%=nb.getBookName()%></p>
						<p class="mb-0">
							<b>Author : </b><%=nb.getAuthorName()%></p>
						<p class="mb-0">
							<b>Categories : </b><%=nb.getbCategeory()%></p>
						<p>
							<b>Price : ₹</b><%=nb.getPrice()%></p>
						<div class="row">
							<%
							if (u == null) {
							%>
							<a href="login.jsp" class="btn btn-danger btn-sm"><i
								class="fa-solid fa-cart-plus"></i> Add to Cart</a>
							<%
							} else {
							%>
							<a href="cart?bid=<%=nb.getBookId()%>&&uid=<%=u.getId()%>"
								class="btn btn-danger btn-sm"><i
								class="fa-solid fa-cart-plus"></i> Add to Cart</a>
							<%
							}
							%>
							<a href="view_books.jsp?bid=<%=nb.getBookId()%>"
								class="btn btn-success btn-sm mt-2">View Details</a>
						</div>
					</div>
				</div>
			</div>

			<%
			}
			}
			%>

		</div>

		<div class="text-center mt-4">
			<a href="all_new_book.jsp" class="btn btn-sm btn-danger">View All</a>
		</div>
	</div>

	<!-- End New book -->
	<hr>

	<!-- Start old book -->

	<div class="container">
		<h3 class="text-center mt-4 mb-4">Old Book</h3>
		<div class="row">

			<%
			List<BookDetails> oList = book.getAllOldBooks();
			int i2 = 1;
			for (BookDetails ob : oList) {
				if (i2++ <= 4) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body">
						<div class="text-center">
							<img alt="" src="assets/book/<%=ob.getPhoto()%>"
								style="width: 150px; height: 200px" class="img-thumblin">
						</div>
						<p class="mt-3 mb-0">
							<b>Book : </b><%=ob.getBookName()%></p>
						<p class="mb-0">
							<b>Author : </b><%=ob.getAuthorName()%></p>
						<p class="mb-0">
							<b>Categories : </b><%=ob.getbCategeory()%></p>
						<p>
							<b>Price : ₹</b><%=ob.getPrice()%></p>
						<div class="row">
							<a href="view_books.jsp?bid=<%=ob.getBookId()%>"
								class="btn btn-success btn-md mt-2 mb-4">View Details</a>
						</div>
					</div>
				</div>
			</div>

			<%
			}
			}
			%>
		</div>

		<div class="text-center mt-4">
			<a href="all_old_book.jsp" class="btn btn-sm btn-danger">View All</a>
		</div>
	</div>

	<!-- End old book -->

	<%@ include file="component/footer.jsp"%>

</body>
</html>