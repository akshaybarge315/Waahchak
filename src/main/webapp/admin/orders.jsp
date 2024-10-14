<%@page import="java.util.List, com.ebook.daoImpl.OrderDAOImpl, com.ebook.model.Order"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Orders</title>
<%@ include file="allcss.jsp"%>
</head>
<body>
	<%@ include file="navbar.jsp"%>
	
	<c:if test="${empty user }">
		<c:redirect url="../login.jsp"></c:redirect>		
	</c:if>
	
	<h2 class="text-center p-2">Hello Bhava</h2>
	
	<div class="container p-4">
		<table class="table text-center">
		  <thead class="table-dark">
		    	<tr>
			      <th scope="col">Order Id</th>
			      <th scope="col">Name</th>
			      <th scope="col">Email</th>
			      <th scope="col">Address</th>
			      <th scope="col">Phone Num</th>
			      <th scope="col">Book Name</th>
			      <th scope="col">Author</th>
			      <th scope="col">Price</th>
			      <th scope="col">Payment type</th>
			    </tr>
		  </thead>
		  <tbody class="text-danger">
		  <%
				OrderDAOImpl dao = new OrderDAOImpl();
				
				List<Order> o = dao.getAllOrder();
				for(Order order : o){
				%>
	    	<tr>
		      <td><%= order.getOrderId() %></td>
		      <td><%= order.getUserName() %></td>
		      <td><%= order.getEmail() %></td>
		      <td><%= order.getAddress() %></td>
		      <td><%= order.getPhone() %></td>
		      <td><%= order.getBook_name() %></td>
		      <td><%= order.getAuthor() %></td>
		      <td><%= order.getPrice() %></td>
		      <td><%= order.getPaymentMode() %></td>
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