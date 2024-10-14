<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.ebook.model.User"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sell Book</title>
<%@ include file="component/allcss.jsp"%>

<link href="component/css/book.css" rel="stylesheet">
</head>

<body>
	<%@ include file="component/navbar.jsp"%>

	<c:if test="${empty user }">
		<c:redirect url="login.jsp"></c:redirect>
	</c:if>

	<%
	User u = (User) session.getAttribute("user");
	%>

	<div class="container">
		<div class="row p-5">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<h4 class="text-center">Sell Book</h4>

						<c:if test="${not empty successMsg }">
							<p class="text-center text-success">${ successMsg }</p>
							<c:remove var="successMsg" scope="session" />
						</c:if>

						<c:if test="${not empty failedMsg }">
							<p class="text-center text-danger">${ failedMsg }</p>
							<c:remove var="failedMsg" scope="session" />
						</c:if>

						<form
							action="<%=request.getContextPath()%>/sellBook?uemail=<%=u.getEmail()%>"
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

							<input id="inputState" name="category" class="form-control"
								type="hidden" value="Old"> <input id="inputState"
								name="status" class="form-control" type="hidden" value="Active">

							<div class="form-group p-2">
								<label for="exampleFormControlFile1">Upload Photo</label> <input
									name="bookImg" type="file" class="form-control-file"
									id="exampleFormControlFile1" required="required">
							</div>

							<button type="submit" class="btn btn-primary mt-3">Upload
								book</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>


	<%@ include file="component/footer.jsp"%>

</body>
</html>