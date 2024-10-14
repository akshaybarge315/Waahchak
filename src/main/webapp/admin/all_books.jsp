<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ page import="com.ebook.daoImpl.BookDAOImpl, java.util.List, com.ebook.model.BookDetails" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Books</title>
<%@ include file="allcss.jsp"%>
</head>
<body>
	<%@ include file="navbar.jsp"%>
	
	<c:if test="${empty user }">
		<c:redirect url="../login.jsp"></c:redirect>		
	</c:if>
	
	<h2 class="text-center p-2">Hello Bhava</h2>
	
	<c:if test="${not empty successMsg }">
		<h5 class="text-center text-success">${ successMsg }</h5>
		<c:remove var="successMsg" scope="session" />
	</c:if>
	
	<c:if test="${not empty failedMsg }">
		<h5 class="text-center text-danger">${ failedMsg }</h5>
		<c:remove var="failedMsg" scope="session" />
	</c:if>
	
	<div class="container p-4">
		<table class="table text-center">
		  <thead class="table-dark">
		    	<tr>
			      <th scope="col">Id</th>
			      <th scope="col">Image</th>
			      <th scope="col">Book Name</th>
			      <th scope="col">Author Name</th>
			      <th scope="col">Price</th>
			      <th scope="col">Book Categories</th>
			      <th scope="col">Status</th>
			      <th scope="col">Action</th>
			    </tr>
		  </thead>
		  <tbody>
		  <%
		  	BookDAOImpl dao = new BookDAOImpl();
		  	List<BookDetails> list = dao.getAllBooks();
		  	for(BookDetails b : list){
		  %>
		  
	    	<tr>
		      <td><%= b.getBookId() %></td>
		      <td><img src="../assets/book/<%= b.getPhoto() %>" style="height:60px; width:60px;"></td>
		      <td><%= b.getBookName() %></td>
		      <td><%= b.getAuthorName() %></td>
		      <td><%= b.getPrice() %></td>
		      <td><%= b.getbCategeory() %></td>
		      <td><%= b.getStatus() %></td>
		      <td>
		      	<a href="edit_book.jsp?id=<%= b.getBookId() %>" class="btn btn-sm btn-primary"><i class="fa-solid fa-pen-to-square"></i> Edit</a>
		      	<a href="<%= request.getContextPath() %>/deleteBook?id=<%= b.getBookId() %>" class="btn btn-sm btn-danger"><i class="fa-solid fa-trash-can"></i> Delete</a>
		      </td>
		    </tr>
		  
		  <%
		  	}
		  %>
		    
		  </tbody>
		</table>
	</div>
		
	<%@ include file="footer.jsp"%>
</body>
</html>