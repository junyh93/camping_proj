<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

	
<%@include file="../common/header.jsp" %>

<title>후기 작성</title>
<link type="text/css" href="<c:url value='/css/addReview.css'/>"  rel="stylesheet" >
<%-- 
<c:set var="today" value="<%=new java.util.Date()%>" />

<c:set var="date"><fmt:formatDate value="${today}" pattern="yyyy-MM-dd" /></c:set> 

<c:set var="year"><fmt:formatDate value="${today}" pattern="yyyy" /></c:set> 

<c:set var="month"><fmt:formatDate value="${today}" pattern="MM" /></c:set> 
 --%>
<script type="text/javascript">
 
    $(document).ready(function() {
        $('#test').on('keyup', function() {
            $('#test_cnt').html("("+$(this).val().length+" / 500)");
 
            if($(this).val().length > 500) {
                $(this).val($(this).val().substring(0, 100));
                $('#test_cnt').html("(500 / 500)");
            }
        });
    });
        

  </script>

<script type="text/javascript">
//별점 후기
	$(function(){
		$('.starRev span').click(function(){
			$(this).parent().children('span').removeClass('on');
			$(this).addClass('on').prevAll('span').addClass('on');
				return false;
		});
	});
</script>
<script type="text/javascript">
	$(function(){
		$('#stohf').click(function(){
			$('#stcnt').val(1);
		});
		$('#stone').click(function(){
			$('#stcnt').val(2);
		});
		$('#stonehf').click(function(){
			$('#stcnt').val(3);
		});
		$('#sttwo').click(function(){
			$('#stcnt').val(4);
		});
		$('#sttwohf').click(function(){
			$('#stcnt').val(5);
		});
		$('#stth').click(function(){
			$('#stcnt').val(6);
		});
		$('#stthhf').click(function(){
			$('#stcnt').val(7);
		});
		$('#stfour').click(function(){
			$('#stcnt').val(8);
		});
		$('#stfourhf').click(function(){
			$('#stcnt').val(9);
		});
		$('#stfive').click(function(){
			$('#stcnt').val(10);
		});
		
	});
</script>
<script type="text/javascript">
//캠핑장 검색을 위한 팝업창 띄우기
	$(function(){
		$('#popup').click(function(){  
			openChild();
		});
		
		var openWin;
		
	    function openChild() {
	        // window.open("open할 window", "자식창 이름", "팝업창 옵션");
	        openWin = window.open("popUp.do",
	        		"", "width=1000, height=600");    
	    }
	});
</script>
<script type="text/javascript">
//사진 추가
var gfv_count = 1;
	$(document).ready(function(){
		
		$('#addFile').on("click",function(e){
			e.preventDefault();
			fn_addFile();
		});
		
		$('a[name="delete"]').on('click',function(e){
			e.preventDefault();
			fn_deleteFile($(this));
		});
	});

		function fn_addFile(){
			var str = "<span class='box'><input type='file' name='rvFolder"+(gfv_count++)+"'><a href='#this' class='imgbtn' name='delete'>삭제</a></span>";
			
			$('.rvImg').append(str);
			$('a[name="delete"]').on('click',function(e){
				e.preventDefault();
				fn_deleteFile($(this));
			
			});
			
			if(gfv_count > 4){
				alert('최대 5장까지만 가능합니다.');
			}
			
		}
		

		function fn_deleteFile(obj){
			obj.parent().remove();
		}

</script>
<section>
<!--  -->
        <!-- wrapper -->
        <h2 id="header">후기작성</h2>
       <form  action="addreview.do" id="wrapper" method="post"  enctype="multipart/form-data">
       <!-- 데이터 뿌릴때 
<input type="hidden" name="rvDate" value="<c:out value="${date}" />">
<input type="hidden" value="<c:out value="${year}" />">
<input type="hidden" value="<c:out value="${month}" />">
-->
		 <input type="hidden" id="sessionNo" name="memNo" value="${memNo}">
		 <input type="hidden" id="sessionId" name="memId" value="${memId}">
		 
		 
		 <input type="hidden" id="addr" name="addr">
		 <input type="hidden" id="contentId" name="contentId">
     	 <input type="hidden" id="lineIntro" name="lineIntro">
		 <input type="hidden" id="tel" name="tel">
     	 <input type="hidden" id="homePage" name="homePage">
     	 <input type="hidden" id="imgUrl" name="imgUrl">
		 <input type="hidden" id="mapX" name="mapX">
     	 <input type="hidden" id="mapY" name="mapY">
     	
            <!-- content start-->
            <div id="content">
                <!-- NAME -->
                <div class="title">
                	<label>제목</label>
                    <span class="box">
                        <input type="text" id="name" name="rvTitle" class="int" maxlength="20">
                    </span>
                </div>
                <br>
             
             <!-- 캠핑장 검색 -->
             <div class="camsearch">
             	<label>예약한 캠핑장명을 검색하세요.</label>
             	<button type="button" id="popup">검색하기</button>
         		<div class="form1_1">
						<!-- <input type="text" class="keyword2" id="searchKrwd_f" name="searchKrwd" placeholder="캠핑장을 입력하세요."> -->
						<input type="text" id="facltNm"  name="facltNm" class="facltNm"  style="border:none; font-size: 20px;">
						
				</div> 
             </div>
                  
                <!-- STAR -->
                 <div class="rvStar">
                 <label>별점</label>
					<div class="starRev">
					  <span id="stohf" class="starR1 on" >별1_왼쪽</span>
					  <span id="stone" class="starR2" >별1_오른쪽</span>
					  <span id="stonehf" class="starR1" >별2_왼쪽</span>
					  <span id="sttwo" class="starR2" >별2_오른쪽</span>
					  <span id="sttwohf" class="starR1" >별3_왼쪽</span>
					  <span id="stth" class="starR2" >별3_오른쪽</span>
					  <span id="stthhf" class="starR1" >별4_왼쪽</span>
					  <span id="stfour" class="starR2" >별4_오른쪽</span>
					  <span id="stfourhf" class="starR1" >별5_왼쪽</span>
					  <span id="stfive" class="starR2" >별5_오른쪽</span>
					  <input type="hidden" id="stcnt" name="rvStar" value="1">
					</div>
                </div>
				<br>
				<br>
                <!-- CONTENT -->
                <div class="rvContent">
                    <h2>캠핑장에 대한 후기를 남겨주세요.</h2>
                    <span class="box" style="width: auto; height: auto;">
                    	<textarea   id="test" name="rvContent" rows="20" cols="58"></textarea> 
                    </span>
                    <div align="right" id="test_cnt">(0 / 500)</div>
                </div>

                <!-- IMAGE -->
                <div class="rvImg">
                    <label>사진</label>
                    <div style="text-align: right;">
                    	<a href="#this" class="imgbtn" id="addFile" >파일 추가</a>
                    	<input type="text" placeholder="최대 5장까지만 가능합니다." style="border: none;" disabled>
                    </div>
                    <span class="box">
                        <input  type="file" id="image" name="rvFolder"  >
                    	<a href="#this" class="imgbtn" name="delete">삭제</a>
                    </span>
                </div>
                <br>
  
                <!-- JOIN BTN-->
                <div class="btn_area">
                    <button type="submit" id="btnJoin">
                        <span>후기작성</span></button>
                </div>
           
            </div>
            <!-- content end-->
               
</form> 
</section>



<%@include file="../common/footer.jsp" %>