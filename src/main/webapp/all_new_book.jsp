<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="com.ebook.daoImpl.BookDAOImpl, java.util.List, com.ebook.model.BookDetails, com.ebook.model.User"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All New Book</title>
<%@ include file="component/allcss.jsp"%>

<link href="component/css/book.css" rel="stylesheet">
</head>

<body>

	<c:if test="${not empty addCart }">
		<div id="toast">${ addCart }</div>

		<script type="text/javascript">
				showToast();
				function showToast(content)
				{
				    $('#toast').addClass("display");
				    $('#toast').html(content);
				    setTimeout(()=>{
				        $("#toast").removeClass("display");
				    },2000)
				}	
		</script>

		<c:remove var="addCart" scope="session" />

	</c:if>
	<c:if test="${not empty failed }">
		<div id="toast">${ failed }</div>

		<script type="text/javascript">
				showToast("${ failed }");
				function showToast(content)
				{
				    $('#toast').addClass("display");
				    $('#toast').html(content);
				    setTimeout(()=>{
				        $("#toast").removeClass("display");
				    },2000)
				}	
		</script>

		<c:remove var="failed" scope="session" />

	</c:if>

	<%@ include file="component/navbar.jsp"%>

	<div class="container">
		<h3 class="text-center mt-4">New Books</h3>
		<div class="row">

			<%
			User u = (User) session.getAttribute("user");
			BookDAOImpl book = new BookDAOImpl();
			List<BookDetails> nList = book.getAllNewBooks();
			for (BookDetails nb : nList) {
			%>
			<div class="col-md-3 mt-4">
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
			%>

		</div>
	</div>

	<%@ include file="component/footer.jsp"%>
</body>
</html>