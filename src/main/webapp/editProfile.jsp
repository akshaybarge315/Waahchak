<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ page import="com.ebook.model.User" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Profile</title>
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
						<h4 class="text-center">Edit Profile</h4>
						
						<form action="<%= request.getContextPath() %>/editProfile" class="form" method="POST">
			
							<c:if test="${not empty successMsg }">
								<p class="text-center text-success">${ successMsg }</p>
								<c:remove var="successMsg" scope="session" />
							</c:if>
							
							<c:if test="${not empty failedMsg }">
								<p class="text-center text-danger">${ failedMsg }</p>
								<c:remove var="failedMsg" scope="session"/>
							</c:if>
								
								<input name="uid" type="hidden" value="<%= u.getId() %>">
								
								<div class="form-group p-2">
							        <label for="login-fname">Name</label> 
							        <input name="fname" type="text" class="form-control"
							            id="login-fname" value="<%= u.getName() %>">
							    </div>
			                    
								<div class="form-group p-2">
							        <label for="email">Email</label> 
							        <input type="email" name="email" class="form-control"
							            id="email" value="<%= u.getEmail() %>">
							    </div>
			
								<div class="form-group p-2">
							        <label for="phone">Phone</label> 
							        <input type="text" name="phone" class="form-control"
							            id="phone" value="<%= u.getPhNumber() %>">
							    </div>
			                    
			                    <div class="form-group p-2">
							        <label for="login-pass">Password</label> 
							        <input name="password" type="password" required="required" class="form-control"
							            id="login-fname">
							    </div>

			                <button type="submit" class="btn btn-success m-2">Update</button>
			
		            </form>
					
					</div>
				</div>
			</div>
		</div>
	</div>
	
	
	<%@ include file="component/footer.jsp"%>
	
</body>
</html>