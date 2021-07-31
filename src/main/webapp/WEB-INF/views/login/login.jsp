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
	</div>
<section class="form-container">
<form action="<c:url value='findid.do'/>" method="get" class="formid">
			<div class="login-button-wrap-id">
				<button type="submit" class="findid">아이디 찾기</button>
			</div>
		</form>
		<form action="<c:url value='findpw.do'/>" method="get" class="formpw">
			<div class="login-button-wrap-pw">
				<button type="submit" class="findpw">비밀번호 찾기</button>
			</div>
		</form>
</section>


<%@include file="../common/footer.jsp" %>