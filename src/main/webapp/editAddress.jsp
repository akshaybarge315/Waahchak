<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ page import="com.ebook.model.User" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Address</title>
<%@ include file="component/allcss.jsp"%>

<link href="component/css/book.css" rel="stylesheet">
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
		<div class="row p-5">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<h4 class="text-center">Add Address</h4>
						
						<form action="<%= request.getContextPath() %>/addAddress" class="row g-3" method="POST">
			
							<c:if test="${not empty successMsg }">
								<p class="text-center text-success">${ successMsg }</p>
								<c:remove var="successMsg" scope="session" />
							</c:if>
							
							<c:if test="${not empty failedMsg }">
								<p class="text-center text-danger">${ failedMsg }</p>
								<c:remove var="failedMsg" scope="session"/>
							</c:if>
								
								<input name="uid" type="hidden" value="<%= u.getId() %>">
								
								<div class="col-md-12 form-group">
							        <label for="address">Address</label> 
							        <input name="address" type="text" class="form-control"
							            id="address" value="<%= u.getAddress() %>">
							    </div>
			                    
								<div class="col-md-6 form-group">
							        <label for="landmark">Landmark</label> 
							        <input type="text" name="landmark" class="form-control"
							            id="landmark" value="<%= u.getLandmark() %>">
							    </div>
			
								<div class="col-md-6 form-group">
							        <label for="city">City</label> 
							        <input type="text" name="city" class="form-control"
							            id="city" value="<%= u.getCity() %>">
							    </div>
			                    
			                    <div class="form-group">
							        <label for="state">State</label> 
							        <input name="state" type="text" class="form-control"
							            id="state" value="<%= u.getState() %>">
							    </div>

			                    <div class="form-group pb-2">
							        <label for="zip">Zip</label> 
							        <input name="zip" type="text" class="form-control"
							            id="zip" value="<%= u.getPincode() %>">
							    </div>

			                <button type="submit" class="btn btn-warning">Upload</button>
			
		            </form>
					
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<%@ include file="component/footer.jsp"%>

</body>
</html>