<%@page import="com.ebook.daoImpl.OrderDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="com.ebook.model.User, com.ebook.daoImpl.OrderDAOImpl, com.ebook.model.Order, com.ebook.model.BookDetails, java.util.List,com.ebook.daoImpl.CartDAOImpl, com.ebook.model.Cart"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Order Confirmation</title>
<%@ include file="component/allcss.jsp"%>

<link href="component/css/order.css" rel="stylesheet">

</head>
<body>

	<c:if test="${empty user }">
		<c:redirect url="login.jsp"></c:redirect>
	</c:if>

	<%@ include file="component/navbar.jsp"%>

	<section>
		<div class="container mt-5 mb-5">
			<div class="row d-flex justify-content-center">
				<div class="col-md-8">
					<div class="card">
						<div class="text-left logo p-2 px-5">
							<img alt="Image" src="assets/img/Waahchak-Logo-300x69.png" height="40" width="160">
						</div>
						<div class="invoice p-5">

							<%
							User user = (User) session.getAttribute("user");
							%>

							<h5>Your order Confirmed!</h5>
							<span class="font-weight-bold d-block mt-4">Hello, <%=user.getName()%>
							</span> <span>You order has been confirmed and will be delivered
								in few days!</span>
							<div
								class="payment border-top mt-3 mb-3 border-bottom table-responsive">
								<table class="table table-borderless">
									<tbody>

										<%
										String email = user.getEmail();
										OrderDAOImpl dao = new OrderDAOImpl();

										List<Order> o = dao.getAllOrderByEmail(email);
										for (Order order : o) {
										%>

										<tr>
											<td>
												<div class="py-2">
													<span class="d-block text-muted">Email</span> <span>
														<%=order.getEmail()%></span>
												</div>
											</td>
											<td>
												<div class="py-2">
													<span class="d-block text-muted">Payment Mode</span> <span><%=order.getPaymentMode()%></span>
												</div>
											</td>
											<td>
												<div class="py-2">
													<span class="d-block text-muted">Shipping Address</span> <span><%=order.getAddress()%></span>
												</div>
											</td>
										</tr>
										<%
										break;
										}
										%>
									</tbody>
								</table>
							</div>
							<div class="product border-bottom table-responsive">
								<table class="table table-borderless">
									<thead class="bg-primary text-white">
										<tr>
											<th scope="col">Book Name</th>
											<th scope="col">Author</th>
											<th scope="col">Price</th>
										</tr>
									</thead>
									<tbody>

										<%
										int totalPrice = 0, i = 1;
										CartDAOImpl cdao = new CartDAOImpl();
										List<Cart> cart = cdao.getCartByUser(user.getId());
										if (cart != null && !cart.isEmpty()) {
											for (Cart item : cart) {
												totalPrice += item.getPrice();
										%>

										<tr>
											<td width="38%"><%=item.getBname()%></td>
											<td width="38%"><%=item.getAuthor()%></td>
											<td width="33%">₹<%=item.getTotal_price()%></td>
										</tr>

										<%
										}
										} else {
										response.sendRedirect("index.jsp");
										}
										%>
									</tbody>
								</table>
							</div>
							<div class="row d-flex justify-content-end">
								<div class="col-md-5">
									<table class="table table-borderless">
										<tbody class="totals">
											<tr>
												<td>
													<div class="text-left">
														<span class="text-muted">SubTotal</span>
													</div>
												</td>
												<td>
													<div class="text-right">
														<span>₹<%=totalPrice%></span>
													</div>
												</td>
											</tr>
											<tr>
												<td>
													<div class="text-left">
														<span class="text-muted">Delivery Charges</span>
													</div>
												</td>
												<td>
													<div class="text-right">
														<span>₹25</span>
													</div>
												</td>
											</tr>
											<tr class="border-top border-bottom">
												<td>
													<div class="text-left">
														<span class="font-weight-bold">Total</span>
													</div>
												</td>
												<td>
													<div class="text-right">
														<span class="font-weight-bold">₹<%=totalPrice + 25%></span>
													</div>
												</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
							<p>Thank you for your order! We'll send you a confirmation
								email once your book is ready for delivery.</p>

							<p class="font-weight-bold mb-0">Thanks for Ordering Book!</p>
							<span>EBook</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<div class="text-center  mb-5">
		<a href="all_new_book.jsp" class="btn btn-success">Continue
			Shopping</a> <a href="orders.jsp" class="btn btn-primary">View All
			Orders</a>
	</div>


	<%@ include file="component/footer.jsp"%>
</body>
</html>