<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Waahchak: Admin</title>
<%@ include file="allcss.jsp"%>
<style type="text/css">
	a{
	text-decoration: none;
	color : black;
	}
	
	a:hover{
		text-decoration: none;
		color : black;
	}
</style>
</head>
<body>
	<%@ include file="navbar.jsp"%>
	
	<c:if test="${empty user }">
		<c:redirect url="../login.jsp"></c:redirect>		
	</c:if>
	
	<div class="container">
		<div class="row p-5">
		
			<div class="col-md-3">
				<a href="add_books.jsp">
					<div class="card">
						<div class="card-body text-center">
							<i class="fa-solid fa-square-plus text-primary fa-3x"></i>
							<h4>Add Books</h4>
							------------
						</div>
					</div>
				</a>
			</div>
			
			<div class="col-md-3">
				<a href="all_books.jsp">
					<div class="card">
						<div class="card-body text-center">
							<i class="fa-solid fa-book-open text-danger fa-3x"></i>
							<h4>All Books</h4>
							------------
						</div>
					</div>
				</a>
			</div>
			
			<div class="col-md-3">
				<a href="orders.jsp">
					<div class="card">
						<div class="card-body text-center">
							<i class="fa-solid fa-box-open text-warning fa-3x"></i>
							<h4>Order</h4>
							------------
						</div>
					</div>
				</a>
			</div>
			
			<div class="col-md-3">
				<a href="orders.jsp" data-bs-toggle="modal" data-bs-target="#exampleModal">
					<div class="card">
						<div class="card-body text-center">
							<i class="fa-solid fa-arrow-right-from-bracket text-primary fa-3x"></i>
							<h4>Logout</h4>
							------------
						</div>
					</div>
				</a>
			</div>
		</div>
	</div>
	
	<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body text-center">
        <h5>Do you want to logout?</h5>
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <a href="<%= request.getContextPath() %>/logout" type="button" class="btn btn-primary">logout</a>
      </div>
      <div class="modal-footer"></div>
    </div>
  </div>
</div>
	
	<div style="margin-top: 340px;">
	<%@ include file="footer.jsp"%>
	</div>
	
</body>
</html>