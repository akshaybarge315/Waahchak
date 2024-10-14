<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register</title>

<%@ include file="component/allcss.jsp"%>

<link rel="stylesheet" href="component/css/login-reg.css">

</head>
<body>
	<%@ include file="component/navbar.jsp"%>
	
	<div class="container p-3">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
					
					<form onsubmit="return validate()" action="<%= request.getContextPath() %>/register" class="form" method="POST">
		                <h1 class="head">Registration</h1>
		
						<c:if test="${not empty successMsg }">
							<p class="text-center text-success">${ successMsg }</p>
							<c:remove var="successMsg" scope="session" />
						</c:if>
						
						<c:if test="${not empty failedMsg }">
							<p class="text-center text-danger">${ failedMsg }</p>
							<c:remove var="failedMsg" scope="session"/>
						</c:if>
							
		                <div class="content">
		                    <div class="box">
		                        <i class="ri-user-3-line login__icon"></i>
		
		                        <div class="box-input">
		                            <input type="text" name="fname" class="input" id="login-fname"
		                                placeholder=" " value="${param.fname != null ? param.fname : ''}"/>
		                            <label for="login-fname" class="login__label">Full Name <span>*</span></label>
		                        </div>
		                    </div>
		                    <span id="nameError" class="error"></span>
		
		                    <div class="box">
		                        <i class="ri-lock-2-line login__icon"></i>
		
		                        <div class="box-input">
		                            <input type="password" name="password" class="input" id="login-pass"
		                                placeholder=" " />
		                            <label for="login-pass" class="login__label">Password <span>*</span></label>
		                            <i class="ri-eye-off-line login__eye" id="login-eye"></i>
		                        </div>
		                    </div>
		                    <span id="passwordError" class="error"></span>
		
		                    <div class="box">
		                        <i class="ri-mail-open-line login__icon"></i>
		
		                        <div class="box-input">
		                            <input type="email" name="email" class="input" id="email" placeholder=" " value="${param.email != null ? param.email : ''}"/>
		                            <label for="email" class="login__label">Email <span>*</span></label>
		                        </div>
		                    </div>
		                    <span id="emailError" class="error"></span>
		
		                    <div class="box">
		                        <i class="ri-phone-line login__icon"></i>
		
		                        <div class="box-input">
		                            <input type="text" name="phone" class="input" id="phone" placeholder=" " value="${param.phone != null ? param.phone : ''}"/>
		                            <label for="phone" class="login__label">Phone <span>*</span></label>
		                        </div>
		                    </div>
		                     <span id="phoneError" class="error"></span>
		                     
		                     <div class="form-check">
							    <input type="checkbox" class="form-check-input" id="Checkbox" name="check">
							    <label class="form-check-label" for="Checkbox">Agree terms & conditions</label>
							  </div>
		                </div>

		                <button type="submit" class="button reg-btn">SignUp</button>
		
		                <p class="register">Already have an account? <a href="login.jsp">Login</a></p>
		            </form>
					
					
					</div>
				</div>
			</div>
	</div>
	
	<%@ include file="component/footer.jsp"%>
	
	<script src="component/js/login.js"></script>
    <script src="component/js/validation.js"></script>
</body>
</html>