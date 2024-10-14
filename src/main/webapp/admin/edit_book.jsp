<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       <%@ page import="com.ebook.daoImpl.BookDAOImpl, com.ebook.model.BookDetails" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Books</title>
<%@ include file="allcss.jsp"%>
</head>
<body>
	
	<%@ include file="navbar.jsp"%>
	
	<c:if test="${empty user }">
		<c:redirect url="../login.jsp"></c:redirect>		
	</c:if>
	
	<div class="container">
		<div class="row p-5">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<h4 class="text-center">Update Book</h4>
						
						<%
							int id= Integer.parseInt(request.getParameter("id"));
							BookDAOImpl dao = new BookDAOImpl();
							BookDetails b= dao.getBookById(id);
						%>
												
						<form action="<%= request.getContextPath() %>/updateBook" method="post">
							<input type="hidden" name="id" value="<%= b.getBookId() %>">
						    <div class="form-group p-2">
						        <label for="exampleInputEmail1">Book Name*</label> 
						        <input name="bname" type="text" class="form-control"
						            id="exampleInputEmail1" value="<%= b.getBookName() %>" aria-describedby="emailHelp" required="required">
						    </div>
						
						    <div class="form-group p-2">
						        <label for="exampleInputEmail1">Author Name*</label> 
						        <input name="author" type="text" class="form-control"
						            id="exampleInputEmail1" value="<%= b.getAuthorName() %>" aria-describedby="emailHelp" required="required">
						    </div>
						    
						    <div class="form-group p-2">
						        <label for="exampleInputPassword1">Price*</label> 
						        <input name="price" type="text" class="form-control"
						            id="exampleInputPassword1" value="<%= b.getPrice() %>" required="required">
						    </div>
						    
						    <div class="form-group p-2">
						        <label for="inputState">Book Status*</label> 
						        <select id="inputState" name="status" class="form-control">
						        	<% if("Active".equals(b.getStatus())) {
						        	%>
							            <option value="Active">Active</option>
							            <option value="Inactive">Inactive</option>
						        	<%
						        	} else {
						        	%>
							            <option value="Inactive">Inactive</option>
							            <option value="Active">Active</option>
						        	<%
						        	}
						        	%>
						        </select>
						    </div>
						    
						    <button type="submit" class="btn btn-primary mt-3">Update book</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<%@ include file="footer.jsp"%>
</body>
</html>