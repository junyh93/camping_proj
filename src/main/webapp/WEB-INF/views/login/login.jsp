<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include  file='../common/header.jsp' %>

<title>로그인</title>
<link type="text/css" href="<c:url value='/css/login.css'/>"  rel="stylesheet" >

<div class="main-container">
		<div class="main-wrap">
		<section class="login-input-section-wrap">
		<form action="<c:url value='login.do'/>" method="post">
			<div class="login-input-wrap">	
				<input name="id"  placeholder="Username" type="text"></input>
			</div>
			<div class="login-input-wrap password-wrap">	
				<input name="pw"  placeholder="Password" type="password"></input>
			</div>
			<div class="login-button-wrap">
				<button type="submit" >Sign in</button>
			</div>
		</form>
		</section>
		</div>
	</div>
	
<%@include file="../common/footer.jsp" %>