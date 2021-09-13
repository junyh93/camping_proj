<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>3
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="../common/header.jsp" %>

<title>회원가입 완료</title>
<link type="text/css" href="/camping/css/joinChk.css"  rel="stylesheet" >

<div id="sp-content">
			

<!--타이틀-->
<div class="sp-title">
	<div class="sp-title--box" scope="sub">
		<p class="sp-title--text">CONGRATULATIONS</p>
<!-- 		<p class="sp-title--subtext">회원가입이 완료되었습니다 !!</p> -->
	</div>
</div>
  	<div style='padding-bottom:50px; position: relative; margin-left: 640px; '>
      	<img src='https://ci6.googleusercontent.com/proxy/s46U_aQJwL_VZiRsVQJcnsYQ8RJgD1Zh6GPrZAGXOFpM2MSW9gt_HXX4OIxN4h7lUSmkiQtBZAao-_Pj7zKjZba3CXXDqmfLvFoG=s0-d-e1-ft#http://www.webjangi.com/assets/img/common/mail_img06.png' class='CToWUd'>
    </div>
<div class="board_list">

	<table class="table_list">
		<tbody>
			<tr>
				<th>이름</th>
				<td class="board_tit">${mem.memName }</td>
			</tr>
			<tr>
				<th>아이디</th>
				<td class="board_tit">${mem.memId }</td>
			</tr>
			<tr>
				<th>이메일</th>
				<td class="board_tit">${mem.memEmail }</td>
			</tr>
		</tbody>
	</table>
</div>
	<p class="find_idBtn">
			<button type="submit" class="btn_black_L"><a href="<c:url value='login.do'/>" >로그인</a></button>
			<button type="submit" class="btn_black_L"><a href="<c:url value='main.do'/>">홈</a></button>
	</p>

</div>

<%@include file="../common/footer.jsp" %>