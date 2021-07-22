<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include  file='../common/header.jsp' %>

<title>로그인</title>
<link type="text/css" href="<c:url value='/css/login.css'/>"  rel="stylesheet" >

<script type="text/javascript">
$(function(){
    
    $('button').click(function(){
    	  var memId = $('#memId').val();
    	  var memPw = $('#memPw').val();
    	  alert('버튼 작동');
      	$.ajax({
    		url:'login.do',
    		type:'post',
    		data:{'memId':memId, 'memPw':memPw},
    		dataType:'json',
    		success:function(data){
    			if(data == false){
    				alert('잘못된 아이디이거나, 비밀번호가 틀렸습니다.');
    				location.href='login.do';
    			}else{
    				location.href='main.do';
    			}
    		 }
    	});
    });
});

</script>

<div class="main-container">
		<div class="main-wrap">
		<section class="login-input-section-wrap">
		<form >
			<div class="login-input-wrap">	
				<input name="memId" id="memId" placeholder="Username" type="text"></input>
			</div>
			<div class="login-input-wrap password-wrap">	
				<input name="memPw" id="memPw" placeholder="Password" type="password"></input>
			</div>
			<div class="login-button-wrap">
				<button type="submit" >Sign in</button>
			</div>
		</form>
		</section>
		</div>
	</div>
	
<%@include file="../common/footer.jsp" %>