<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<!-- 폰트 - 배민(주아)  -->
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
<link type="text/css" href="${pageContext.request.contextPath}/css/login.css" rel="stylesheet" >

<script src="${pageContext.request.contextPath}/js/jquery-3.5.1.min.js"></script>
</head>

<body>
<div class="main-container">
		<div class="main-wrap">

		<section class="login-input-section-wrap">
			<div class="login-input-wrap">	
				<input placeholder="Username" type="text"></input>
			</div>
			<div class="login-input-wrap password-wrap">	
				<input placeholder="Password" type="password"></input>
			</div>
			<div class="login-button-wrap">
				<button>Sign in</button>
			</div>

		</section>


		</div>
	</div>
</body>
</html>