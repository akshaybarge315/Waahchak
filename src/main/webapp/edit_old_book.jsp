<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ page import="com.ebook.daoImpl.BookDAOImpl, java.util.List, com.ebook.model.BookDetails, com.ebook.model.User" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Old Book</title>
<%@ include file="component/allcss.jsp"%>

<link href="component/css/book.css" rel="stylesheet">
</head>
<body>
	<%@ include file="component/navbar.jsp"%>
	
	<c:if test="${empty user }">
		<c:redirect url="login.jsp"></c:redirect>
	</c:if>
	
	<c:if test="${not empty successMsg }">
		<div class="alert alert-success text-center" role="alert">
			${ successMsg }
		</div>
		<c:remove var="successMsg" scope="session" />
	</c:if>
	
	<c:if test="${not empty failedMsg }">
		<div class="alert alert-success text-center" role="alert">
			${ failedMsg }
		</div>
		<c:remove var="failedMsg" scope="session" />
	</c:if>

	<div class="container p-3">
		<h3 class="text-center">Old Book</h3>
		
		<table class="table table-striped text-center mt-5">
				<thead class="bg-primary text-white">
					<tr>
						  <th scope="col">Image</th>
						  <th scope="col">Book Name</th>
					      <th scope="col">Author Name</th>
					      <th scope="col">Price</th>
					      <th scope="col">Action</th>
					</tr>
				</thead>
				<tbody>
					<%
						User u = (User)session.getAttribute("user");
						String email = u.getEmail();
						
					  	BookDAOImpl dao = new BookDAOImpl();
					  	List<BookDetails> list = dao.getAllBooksByEmail(email);
					  	for(BookDetails b : list){
					  %>
					  
				    	<tr>
				    	  <td><img src="assets/book/<%= b.getPhoto() %>" style="height:60px; width:60px;"></td>
					      <td><%= b.getBookName() %></td>
					      <td><%= b.getAuthorName() %></td>
					      <td><%= b.getPrice() %></td>
					      <td>
					      	<a href="<%= request.getContextPath() %>/deleteOldBook?id=<%= b.getBookId() %>" class="btn btn-sm btn-danger"><i class="fa-solid fa-trash-can"></i> Delete</a>
					      </td>
					    </tr>
					  
					  <%
					  	}
					  %>
				</tbody>
		</table>
	</div>
	
	<%@ include file="component/footer.jsp"%>
</body>
</html>