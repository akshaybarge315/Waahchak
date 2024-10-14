<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page
	import="com.ebook.daoImpl.BookDAOImpl, java.util.List, com.ebook.model.BookDetails, com.ebook.model.User"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>profile</title>
	<%@ include file="component/allcss.jsp"%>
	<link href="component/css/user.css" rel="stylesheet">
</head>
<body>
	<%@ include file="component/navbar.jsp"%>
	
	<c:if test="${empty user }">
		<c:redirect url="login.jsp"></c:redirect>
	</c:if>
	
	<%
		User u = (User)session.getAttribute("user");
	%>
	
	<div class="container">
		<h3 class="text-center m-3">Hello <%= u.getName() %></h3>
		<div class="row p-5">
		
			<div class="col-md-4">
				<a href="sell_book.jsp">
					<div class="card">
						<div class="card-body text-center">
							<div class="text-primary pb-3">
								<i class="fa-solid fa-book-open-reader fa-3x"></i>
							</div>
							<h3>Sell Old Book</h3>						
						</div>
					</div>
				</a>
			</div>
			
			<div class="col-md-4">
				<a href="edit_old_book.jsp">
					<div class="card">
						<div class="card-body text-center">
							<div class="text-primary pb-3">
								<i class="fa-solid fa-book-open fa-3x"></i>
							</div>
							<h3>Edit Old Book</h3>						
						</div>
					</div>
				</a>
			</div>
			
			<div class="col-md-4">
				<a href="editProfile.jsp">
					<div class="card">
						<div class="card-body text-center">
							<div class="text-primary pb-3">
								<i class="fa-solid fa-pen-to-square fa-3x"></i>
							</div>
							<h3>Edit Profile</h3>						
						</div>
					</div>
				</a>
			</div>
			
			<div class="col-md-4 mt-4">
				<a href="editAddress.jsp">
					<div class="card">
						<div class="card-body text-center">
							<div class="text-warning pb-3">
								<i class="fa-solid fa-location-dot fa-3x"></i>
							</div>
							<h3>Your Address</h3>	
							<p>Edit Address</p>					
						</div>
					</div>
				</a>
			</div>
			<div class="col-md-4 mt-4">
				<a href="orders.jsp">
					<div class="card">
						<div class="card-body text-center">
							<div class="text-danger pb-3">
								<i class="fa-solid fa-box-open fa-3x"></i>
							</div>
							<h3>My Orders</h3>	
							<p>Track your Order</p>					
						</div>
					</div>
				</a>
			</div>
			<div class="col-md-4 mt-4">
				<a href="helpline.jsp">
					<div class="card">
						<div class="card-body text-center">
							<div class="text-primary pb-3">
								<i class="fa-regular fa-circle-question fa-3x"></i>
							</div>
							<h3>Help Center</h3>
							<p>24*7 Service</p>						
						</div>
					</div>
				</a>
			</div>
		</div>
	</div>
	
	<div style="margin-top: 70px;">
		<%@ include file="component/footer.jsp"%>
	</div>
</body>
</html>