<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="com.ebook.daoImpl.BookDAOImpl, java.util.List, com.ebook.model.BookDetails, com.ebook.model.User, com.ebook.daoImpl.CartDAOImpl, com.ebook.model.Cart"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Cart</title>
<%@ include file="component/allcss.jsp"%>

<link href="component/css/book.css" rel="stylesheet">
</head>
<body>
	
	<c:if test="${empty user }">
		<c:redirect url="login.jsp"></c:redirect>
	</c:if>
	
	<%@ include file="component/navbar.jsp"%>
	
	<c:if test="${not empty successMsg }">
		<div class="alert alert-success text-center" role="alert">
		  ${successMsg}
		</div>
		<c:remove var="successMsg" scope="session"/>
	</c:if>
	
	<c:if test="${not empty failed }">
		<div class="alert alert-danger text-center" role="alert">
		  ${failed }
		</div>
		<c:remove var="failed" scope="session"/>
	</c:if>

	<div class="container">
		<div class="row">
			<div class="col-md-6">
				<div class="card mt-5">
					<h3 class="text-center text-success m-3">Your Selected Items</h3>
					<div class="card-body">
						<table class="table">
							<thead>
								<tr>
									<th>Sr No</th>
									<th scope="col">Book Name</th>
									<th scope="col">Author</th>
									<th scope="col">Price</th>
									<th scope="col">Action</th>
								</tr>
							</thead>
							<tbody>
								<%
									User user =(User)session.getAttribute("user");
									int totalPrice=0, i=1;
									CartDAOImpl cdao = new CartDAOImpl();
									List<Cart> cart = cdao.getCartByUser(user.getId());
									for(Cart c : cart){
										totalPrice += c.getPrice();
								%>
									<tr>
										<td><%=i++ %></td>
										<td><%=c.getBname() %></td>
										<td><%=c.getAuthor() %></td>
										<td><%=c.getPrice() %></td>
										<td>
											<a href="removeBook?cid=<%=c.getCid() %>" class="btn btn-danger">remove</a>
										</td>
									</tr>
								<%
									}
								%>
								<tr>
									<td colspan="3" class="text-center"><b>Total Price</b></td>
									<td><b><%= totalPrice %></b></td>
								</tr>
							</tbody>
						</table>
						<div class="text-center">
						  <a href="all_new_book.jsp" class="btn btn-success">Continue Shopping</a>
						</div>
					</div>
				</div>
			</div>

			<div class="col-md-6">
				<div class="card m-5">
					<div class="card-body">
						<h3 class="text-center text-success m-3">Your Details for Order</h3>
						
						<form action="confirmOrder" class="row g-3" method="POST">
								<input type="hidden" value="<%= user.getId() %>" name="userId">
							  <div class="col-md-6">
							    <label for="inputName" class="form-label">Name</label>
							    <input type="text" name="name" class="form-control" id="inputName" value="<%= user.getName() %>" required="required">
							  </div>
							  <div class="col-md-6">
							    <label for="inputEmail" class="form-label">Email</label>
							    <input type="email" name="email" class="form-control" id="inputEmail" value="<%= user.getEmail() %>" readonly="readonly" required="required">
							  </div>
							  <div class="col-md-6">
							    <label for="inputMobile" class="form-label">Mobile No</label>
							    <input type="text" name="mobile" class="form-control" id="inputMobile" value="<%= user.getPhNumber() %>" required="required">
							  </div>
							  <div class="col-md-6">
							    <label for="inputAddress" class="form-label">Address</label>
							    <input type="text" name="address" class="form-control" id="inputAddress" value="<%= user.getAddress() %>" required="required">
							  </div>
							  <div class="col-md-6">
							    <label for="inputLandmark" class="form-label">Landmark</label>
							    <input type="text" name="landmark" class="form-control" id="inputLandmark" value="<%= user.getLandmark() %>" required="required">
							  </div>
							  <div class="col-md-6">
							    <label for="inputCity" class="form-label">City</label>
							    <input type="text" name="city" class="form-control" id="inputCity" value="<%= user.getCity() %>" required="required">
							  </div>
							  <div class="col-md-6">
							    <label for="inputState" class="form-label">State</label>
							    <input type="text" name="state" class="form-control" id="inputState" value="<%= user.getState() %>" required="required">
							  </div>
							  <div class="col-md-6">
							    <label for="inputZip" class="form-label">Zip</label>
							    <input type="text" name="zip" class="form-control" id="inputZip" value="<%= user.getPincode() %>" required="required">
							  </div>
							  <div class="col-md-12">
							    <label for="inputPayment" class="form-label">Payment Type <span class="text-danger">*</span></label>
							    <select id="inputPayment" class="form-select" name="payment">
							      <option value="noSelect" selected>---Select---</option>
							      <option value="COD">Cash</option>
							      <option value="UPI">UPI</option>
							      <option value="Debit Card">Debit card</option>
							      <option value="Credit Card">Credit card</option>
							    </select>
							  </div>
							  	<div class="text-center">
								  <button type="submit" class="btn btn-warning">Order Now</button>
								</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>


	<%@ include file="component/footer.jsp"%>

</body>
</html>