<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ page import="com.ebook.daoImpl.BookDAOImpl, com.ebook.model.BookDetails, com.ebook.model.User" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Details</title>
	<%@ include file="component/allcss.jsp"%>
</head>
<body style="background-color: #f5f0f0;">
	<%@ include file="component/navbar.jsp"%>
	
	<%
		User u = (User)session.getAttribute("user");
		int bookId = Integer.parseInt(request.getParameter("bid"));
		BookDAOImpl book = new BookDAOImpl();
		BookDetails b =  book.getBookById(bookId);
	%>
	<div class="container p-3 mt-5">
		<div class="row">
		
			<div class="col-md-6 p-5 border bg-white">
				<div class="text-center">
					<img src="assets/book/<%= b.getPhoto() %>" style="height: 150px; width: 150px"><br>
				</div>
				<div class="text-center">
					<p class="mt-3 mb-0"><b>Book : </b><%= b.getBookName() %></p>
					<p class="mb-0"><b>Author : </b><%= b.getAuthorName() %></p>
					<p class="mb-0"><b>Categories : </b><%= b.getbCategeory() %></p>
					<p><b>Price : ₹</b><%= b.getPrice() %></p>
				</div>
			</div>
			
			<div class="col-md-6 text-center p-5 border bg-white">
				<h2><%= b.getBookName() %></h2>
				
				<%
					if(b.getbCategeory().equals("Old")){
				%>
					<h6>Contact to seller</h6>
					<a href="mailto:akshaybarge315@gmail.com" style="text-decoration: none;"><i class="fa-solid fa-envelope"></i> Email : <%= b.getUser_email() %></a>
				<%		
					}
				%>
				
				<div class="row mt-5">
					<div class="col-md-4 text-danger text-center p-2">
						<i class="fas fa-money-bill-wave fa-2x"></i>
						<p>Cash On Delivery</p>
					</div>
					
					<div class="col-md-4 text-danger text-center p-2">
						<i class="fas fa-undo-alt fa-2x"></i>
						<p>Return Available</p>
					</div>
					
					<div class="col-md-4 text-danger text-center p-2">
						<i class="fas fa-truck-moving fa-2x"></i>
						<p>Free Shipping</p>
					</div>
				</div>
				
				<%
					if(b.getbCategeory().equals("Old")){
				%>
					<div class=" text-center p-3">
						<a href="index.jsp" class="btn btn-success"><i class="fa-solid fa-arrow-right-to-bracket"></i> Continue Shopping</a> 
					</div>
				<%
					}else{
				%>
					<div class=" text-center p-3">
						<%
							if(u == null){
						%>
							<a href="login.jsp" class="btn btn-primary"> <i class="fas fa-cart-plus"></i> Add to Cart</a> 
						<%
							}else{
						%>
							<a href="cart?bid=<%= b.getBookId() %>&&uid=<%= u.getId() %>" class="btn btn-danger btn-sm"><i class="fa-solid fa-cart-plus"></i> Add to Cart</a>
						<%
							}
						%>
					</div>
				<%
					}
				%>
			</div>
		</div>
	</div>
	<div style="margin-top: 120px;">
		<%@ include file="component/footer.jsp"%>
	</div>
</body>
</html>