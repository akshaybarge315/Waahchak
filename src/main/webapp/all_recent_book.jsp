<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="com.ebook.daoImpl.BookDAOImpl, java.util.List, com.ebook.model.BookDetails, com.ebook.model.User"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All Recent Book</title>
<%@ include file="component/allcss.jsp"%>

<link href="component/css/book.css" rel="stylesheet">
</head>

<body>

	<%@ include file="component/navbar.jsp"%>

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

	<div class="container">
		<h3 class="text-center mt-4">Recent Books</h3>
		<div class="row">
			<%
			User u = (User) session.getAttribute("user");
			BookDAOImpl book = new BookDAOImpl();
			List<BookDetails> list = book.getAllRecentBooks();
			for (BookDetails b : list) {
			%>

			<div class="col-md-3 mt-4">
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
			%>
		</div>
	</div>

	<%@ include file="component/footer.jsp"%>
</body>
</html>