<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<title>캠핑 팁 상세보기</title>
<link type="text/css" href="<c:url value='/css/getnotice.css'/>"  rel="stylesheet" >
<link rel="stylesheet" type="text/css" href="<c:url value='/css/fontawesome.min.css'/> ">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">

<script src="<c:url value='/js/jquery-3.5.1.min.js'/>" ></script>

<script type="text/javascript">
function updatetip(tipNo){
	var page = $('#page').val();
	var range = $('#range').val();
	var rangeSize = $('#rangeSize').val();
	
	$.ajax({
		url:"<c:url value='/updateTip.do'/>",
		type:"GET",
		data:{"tipNo": tipNo,
			"page" : page,
			"range" : range,
			"rangeSize" : rangeSize		
		},
		dataType:"text",
		success:function(data){
			$('#section1').html(data);
		}
	});
}

function deletetip(tipNo){
	var page = $('#page').val();
	var range = $('#range').val();
	var rangeSize = $('#rangeSize').val();
	
	if(confirm("캠핑 팁을 삭제하시겠습니까?")){
		$.ajax({
			url:"<c:url value='/deleteTip.do'/>",
			type:"GET",
			data:{"tipNo" : tipNo,
				"page" : page,
				"range" : range,
				"rangeSize" : rangeSize		
			},
			dataType:"text",
			success:function(data){
				if(data == "success"){
					list();
				}
			}
		});
	}
};

function list(){
	location.href="<c:url value='/tip.do?page="+${page}+"&range="+${range}+"&rangeSize="+${rangeSize}+"'/>";
};

</script>

<input type="hidden" id="tipNo" name="tipNo" value="${tip.tipNo }">
<div id="cont_inner">
			<div class="sub_layout layout">
				<article>
						<header class="title_w">
							<h2 class="title"><span class="skip">타이틀영역입니다.</span>
								캠핑 팁</h2>
						</header>
					</article>
					 
				<!--내용시작-->
<div id="contents">
<h3 class="icon_h3">캠핑 팁</h3>
<div class="board_view">
	<div class="board_view_head">
		<h3 class="title">
			${tip.tipTitle } </h3>
		<ul class="meta-info">
			<li class="date">${tip.memId }</li>
			<li class="date">${tip.tipDate }</li>
			<li class="date">조회수 ${tip.tipHit}</li>
			<li class="date"><button type="button" class="like" onclick="tipLike('${tip.tipNo}');"><i class="far fa-thumbs-up"></i><span class="likcount"></span></button></li>
			<li class="date"><button type="button" class="hate" onclick="tipHate('${tip.tipNo}');"><i class="far fa-thumbs-down"></i><span class="hatcount"></span></button></li>
		</ul>
	</div>
	<div class="file_down">
		<span>첨부파일 </span>	
	</div>
	<div class="board_cont">
		<div class="board_cont_inner">
			<p></p>
			<p><span style="font-size: 12pt;"><b>${tip.tipContent }&nbsp;</b></span></p><p>&nbsp;</p>
			<p>출처 및 원문 보기 &gt;&gt;<a href="${tip.tipLink }">${tip.tipLink }</a></p><p></p>
		</div>
	</div>

	</div>

<div class="board_btn_w">
	<div class="board_btn">
		<button title="수정" class="b_btn_gray" onclick="updatetip('${tip.tipNo}');" type="button">
				<span>수정</span>
		</button>
		<button title="삭제" class="b_btn_gray" onclick="deletetip('${tip.tipNo}');" type="button">
				<span>삭제</span>
		</button>
		<button title="목록" class="b_btn_gray" onclick="list();" type="button">
				<span>목록</span>
		</button>
		</div>
</div></div>
				<!--//내용종료-->
			</div>
		</div>
		<!--//콘텐츠박스-->
	</section>
	</div>
<%@include file="../common/footer.jsp" %>