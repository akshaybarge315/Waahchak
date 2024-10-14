<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>

<%@ include file="component/allcss.jsp"%>

<link rel="stylesheet" href="component/css/login-reg.css">

</head>
<body>
	<%@ include file="component/navbar.jsp"%>
	
	<div class="container p-3">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
					
					<form onsubmit="return validate()" action="login" class="form" method="POST">
		                <h1 class="head">Login</h1>
						
						<c:if test="${not empty failedMsg }">
							<p class="text-center text-danger">${ failedMsg }</p>
							<c:remove var="failedMsg" scope="session"/>
						</c:if>
						<c:if test="${not empty sucsessMsg }">
							<p class="text-center text-success">${ sucsessMsg }</p>
							<c:remove var="sucsessMsg" scope="session"/>
						</c:if>
						
		                <div class="content">
		                    
		                    <div class="box">
		                        <i class="ri-mail-open-line login__icon"></i>
		
		                        <div class="box-input">
		                            <input type="email" name="email" class="input" id="email" placeholder=" " />
		                            <label for="email" class="login__label">Email <span>*</span></label>
		                        </div>
		                    </div>
		                    <span id="emailError" class="error"></span>
		
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
		
		                </div>
						<div class="tick">
		                    <div class="tick-group">
		                        <input type="checkbox" class="tick-input" id="login-check" />
		                        <label for="login-check" class="tick-label">Remember me</label>
		                    </div>
		
		                </div>
		                    <a href="#" class="forgot">Forgot Password?</a>
			             
			            <button type="submit" class="button login-btn">Login</button>
		
		                <p class="register">Don't have an account? <a href="register.jsp">Register</a></p>
		            </form>
					
					
				</div>
			</div>
		</div>
	</div>
	
	<%@ include file="component/footer.jsp"%>
	
	<script src="component/js/login.js"></script>
     <script src="component/js/loginValidation.js"></script>
</body>
</html>