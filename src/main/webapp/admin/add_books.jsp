<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
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
						<h4 class="text-center">Add Book</h4>

						<c:if test="${not empty successMsg }">
							<p class="text-center text-success">${ successMsg }</p>
							<c:remove var="successMsg" scope="session" />
						</c:if>

						<c:if test="${not empty failedMsg }">
							<p class="text-center text-danger">${ failedMsg }</p>
							<c:remove var="failedMsg" scope="session" />
						</c:if>

						<form action="<%=request.getContextPath()%>/addBook"
							method="post" enctype="multipart/form-data">
							<div class="form-group p-2">
								<label for="exampleInputEmail1">Book Name*</label> <input
									name="bname" type="text" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp"
									required="required">
							</div>

							<div class="form-group p-2">
								<label for="exampleInputEmail1">Author Name*</label> <input
									name="author" type="text" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp"
									required="required">
							</div>

							<div class="form-group p-2">
								<label for="exampleInputPassword1">Price*</label> <input
									name="price" type="text" class="form-control"
									id="exampleInputPassword1" required="required">
							</div>


							<div class="form-group p-2">
								<label for="inputState">Book Categories*</label> <select
									id="inputState" name="category" class="form-control">
									<option selected value="New">New Book</option>
									<option value="Old">Old Book</option>
								</select>
							</div>

							<div class="form-group p-2">
								<label for="inputState">Book Status*</label> <select
									id="inputState" name="status" class="form-control">
									<option selected value="Active">Active</option>
									<option value="Inactive">Inactive</option>
								</select>
							</div>

							<div class="form-group p-2">
								<label for="exampleFormControlFile1">Upload Photo</label> <input
									name="bookImg" type="file" class="form-control-file"
									id="exampleFormControlFile1" required="required">
							</div>

							<button type="submit" class="btn btn-primary mt-3">Add
								book</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<%@ include file="footer.jsp"%>
</body>
</html>