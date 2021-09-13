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
				<input name="id"  placeholder="ID" type="text"></input>
			</div>
			<div class="login-input-wrap password-wrap">	
				<input name="pw"  placeholder="Password" type="password"></input>
			</div>
			<div class="login-button-wrap">
				<button type="submit" >로그인</button>
			</div>
		</form>		
		<form action="<c:url value='join.do'/>" method="get">
			<div class="login-button-wrap">
				<button type="submit" class="join">회원가입</button>
			</div>
		</form>
		
		</section>
		</div>
		<p class="find_idBtn">
			<button type="submit" class="btn_black_L"><a href="<c:url value='findid.do'/>" >아이디 찾기</a></button>
			<button type="submit" class="btn_black_L"><a href="<c:url value='findpw.do'/>">비번 찾기</a></button>
		</p>
	</div>



<%@include file="../common/footer.jsp" %>