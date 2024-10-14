<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page
	import="com.ebook.daoImpl.OrderDAOImpl, com.ebook.model.User, com.ebook.model.Order, java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Orders</title>
<%@ include file="component/allcss.jsp"%>

<link href="component/css/book.css" rel="stylesheet">
</head>
<body>
	<%@ include file="component/navbar.jsp"%>

	<c:if test="${empty user }">
		<c:redirect url="login.jsp"></c:redirect>
	</c:if>

	<div class="container p-3">
		<%
		User user = (User) session.getAttribute("user");

		String email = user.getEmail();
		OrderDAOImpl dao = new OrderDAOImpl();

		List<Order> o = dao.getAllOrderByEmail(email);
		if (o != null && !o.isEmpty()) {
		%>
		<h3 class="text-center">Your Orders</h3>
		<table class="table table-striped text-center mt-5">
			<thead class="bg-primary text-white">

				<tr>
					<th scope="col">Order Id</th>
					<th scope="col">Name</th>
					<th scope="col">Book Name</th>
					<th scope="col">Author</th>
					<th scope="col">Price</th>
					<th scope="col">Payment Type</th>
				</tr>
			</thead>
			<tbody>
				<%
				for (Order order : o) {
				%>
				<tr>
					<th><%=order.getOrderId()%></th>
					<td><%=order.getUserName()%></td>
					<td><%=order.getBook_name()%></td>
					<td><%=order.getAuthor()%></td>
					<td><%=order.getPrice()%></td>
					<td><%=order.getPaymentMode()%></td>
				</tr>
				<%
				}
				%>
			</tbody>
		</table>
		<%
		} else {
		%>
		<h5 class="text-center p-5">You do not have Order History!</h5>
		<%
		}
		%>
	</div>

	<%@ include file="component/footer.jsp"%>

</body>
</html>