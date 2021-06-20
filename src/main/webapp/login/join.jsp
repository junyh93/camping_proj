<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<!-- 폰트 - 배민(주아)  -->
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
<link type="text/css" href="${pageContext.request.contextPath}/css/join.css" rel="stylesheet" >

<script src="${pageContext.request.contextPath}/js/jquery-3.5.1.min.js"></script>
<script src="${pageContext.request.contextPath}/js/join.js"></script>

<script type="text/javascript">
$(function(){
	//전화번호 인증
    $('#sendTelNumBtn').click(function(){
       var phoneNumber = $('#members_tel').val();
       phoneNumber = phoneNumber.replace(/\-/g,''); //변경작업
       
       if(!numReg.test(phoneNumber) || phoneNumber.length != 11){
          alert('전화번호를 확인하세요');
          $('#members_tel2').focus();
          
       }else{
          alert(phoneNumber + ' 인증번호를 전송합니다');
       
          $.ajax({
             url : "<c:url value='/members/sendSMS.do' />",
             type : "get",
             data : "phoneNumber=" + phoneNumber,
             dataType : "json",
             success : function(data) {
                $('#certNumBtn').click(function(){
                   if (data == $('#certNum').val()) {
                      alert('휴대폰 인증 성공');
                      $('#certFlag').val('Y');
                   } else {
                      alert('휴대폰 인증 실패');
                      $('#members_tel2').val('');
                      $('#members_tel3').val('');                     
                   }
                });
             },
             error : function(xhr, status, error) {
                alert(status + ", " + error);
             }
          }); //ajax
       }   
    });
	

});

</script>
</head>

<body>
	<section>
        <!-- wrapper -->
        <h2 id="header">회원가입</h2>
       <form  action="../join.do" id="wrapper" method="post">
            <!-- content-->
            <div id="content">

                 <!-- ID -->
                <div>
                    <h3 class="join_title">
                        <label for="id">아이디</label>
                    </h3>
                    <span class="box int_id">
                        <input type="text" id="id" name="id" class="int" maxlength="20">
                    </span>
                    <span class="error_next_box"></span>
                </div>

                <!-- PW1 -->
                <div>
                    <h3 class="join_title"><label for="pswd1">비밀번호</label></h3>
                    <span class="box int_pass">
                        <input type="password" id="pswd1" name="pswd1" class="int" maxlength="20">
                        <span id="alertTxt">사용불가</span>
                        <img src="${pageContext.request.contextPath}/img/m_icon_pass.png" id="pswd1_img1" class="pswdImg">
                    </span>
                    <span class="error_next_box"></span>
                </div>

                <!-- PW2 -->
                <div>
                    <h3 class="join_title"><label for="pswd2">비밀번호 재확인</label></h3>
                    <span class="box int_pass_check">
                        <input type="password" id="pswd2" class="int" maxlength="20">
                        <img src="${pageContext.request.contextPath}/img/m_icon_check_disable.png" id="pswd2_img1" class="pswdImg">
                    </span>
                    <span class="error_next_box"></span>
                </div>

                <!-- NAME -->
                <div>
                    <h3 class="join_title"><label for="name">이름</label></h3>
                    <span class="box int_name">
                        <input type="text" id="name" name="name" class="int" maxlength="20">
                    </span>
                    <span class="error_next_box"></span>
                </div>
                
                <!-- EMAIL -->
                <div>
                    <h3 class="join_title"><label for="email">본인확인 이메일<span class="optional">(선택)</span></label></h3>
                    <span class="box int_email">
                        <input type="text" id="email" class="int" maxlength="100" placeholder="선택입력">
                    </span>
                    <span class="error_next_box">이메일 주소를 다시 확인해주세요.</span>    
                </div>

                <!-- MOBILE -->
                <div>
                    <h3 class="join_title"><label for="phoneNo">휴대전화</label></h3>
                    <span class="box int_mobile">
                        <input type="text" id="mobile" name="mobile" class="int" maxlength="16" placeholder="전화번호 입력">
                    	<input  type="button" id="sendTelNumBtn" value="인증번호">
                    </span>
                      <span class="box int_mobile">
                        <input type="text" id="certNum" name="sms" class="int" maxlength="16" placeholder="인증번호 입력">
						<input  type="button" id="certNumBtn" value="입력하기">
                    </span>
                    <span class="error_next_box"></span>    
                </div>
				
                <!-- JOIN BTN-->
                <div class="btn_area">
                    <button type="submit" id="btnJoin">
                        <span>가입하기</span>
                    </button>
                </div>
                </div>
               
</form> 
   </section>   


</body>
</html>