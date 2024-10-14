<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.ebook.daoImpl.BookDAOImpl, java.util.List, com.ebook.model.BookDetails" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All Old Book</title>
<%@ include file="component/allcss.jsp"%>

<link href="component/css/book.css" rel="stylesheet">
</head>
<body>

	<%@ include file="component/navbar.jsp"%>
	
	<div class="container">
		<h3 class="text-center mt-4">Old Books</h3>
		<div class="row">
		
		<%
			BookDAOImpl book = new BookDAOImpl();
			List<BookDetails> oList = book.getAllOldBooks();
			for(BookDetails ob : oList){	
		%>
			<div class="col-md-3 mt-4">
				<div class="card crd-ho">
					<div class="card-body">
						<div class="text-center">
							<img alt="" src="assets/book/<%= ob.getPhoto() %>"  style="width: 150px; height:200px" class="img-thumblin">
						</div>
						<p class="mt-3 mb-0"><b>Book : </b><%= ob.getBookName() %></p>
						<p class="mb-0"><b>Author : </b><%= ob.getAuthorName() %></p>
						<p class="mb-0"><b>Categories : </b><%= ob.getbCategeory() %></p>
						<p><b>Price : ₹</b><%= ob.getPrice() %></p>
						<div class="row">
							<a href="view_books.jsp?bid=<%= ob.getBookId() %>" class="btn btn-success btn-md mt-2 mb-4">View Details</a>
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