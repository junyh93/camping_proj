	<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<title>캠핑장 헤더</title>
<link type="text/css" href="<c:url value='/css/camheader.css'/>"  rel="stylesheet" >


<script type="text/javascript">
$(function(){
	var contentId = Number($('#contentId').val());
	var memNo = $('#sessionNo').val();
	
	//추천 버튼 클릭시 (추천 추가 또는 추천 제거)
	$('#btnRecommend').click(function(){
		if($('#memNo').val() == null){
			alert("로그인 이후 이용가능합니다.");
		}
		$.ajax({
			url: "<c:url value='/recommend.do'/>",
			type: "GET",
			data:{"contentId" : contentId,
					"memNo" : memNo	
			},
			dataType:"text",
			success:function(data){
				if(data == "success"){
					recCount();				
					}
			}
		});
	});
	
	function recCount(){
		
		$.ajax({
			url:"<c:url value='/reccount.do'/>",
			type:"GET",
			data:{"contentId" : contentId},
			dataType:"text",
			success: function(count){
				console.log(count);
				$('.rec_count').html(count);
			}
		});
	};
	
	recCount();
	
	$('.zzim').click(function(){
		if($('#memNo').val() == null){
			alert('로그인 이후 이용가능합니다.');
		}
			
		$.ajax({
			url:"<c:url value='/keep.do'/>",
			type:"GET",
			data:{
				"contentId" : contentId,
				"memNo" : memNo,
				"facltNm" : $('#facltNm').val(),
				"addr" : $('#addr').val(),
				"book" : $('#book').val(),
				"homepage" : $('#homepage').val(),
				"imgUrl" : $('#imgUrl').val(),
				"tel" : $('#tel').val()
			},
			dataType:"text",
			success: function(data){
				console.log(data);
				if(data == "Y"){
					alert("해당 캠핑장을 찜 목록에 추가하였습니다.");
				}else if(data == "N"){
					alert("해당 캠핑장을 찜 목록에서 삭제하였습니다.");
				}
			}
		});
	});
	
	


});

	

function camMap(contentId){
	$.ajax({
		url: "<c:url value='/camMap.do'/>",
		type:"GET",
		data:{
			"contentId" : contentId,
			"mapX" : $('#mapX').val(),
			"mapY" : $('#mapY').val(),
			"facltNm" : $('#facltNm').val(),
			"addr" : $('#addr').val(),
			"imgUrl" : $('#imgUrl').val()
		},
		success:function(data){
			$('#contents').html(data);
		}
	});
};

function camReview(contentId){
	$.ajax({
		url:"<c:url value='/camReview.do'/>",
		type:"GET",
		data:{"contentId" : contentId},
		dataType:"text",
		success:function(data){
			$('#contents').html(data);
		}
	});
};

</script>


<input type="hidden" id="contentId" name="contentId" value="${contentId }">
<input type="hidden" id="mapX" name="mapX">
<input type="hidden" id="mapY" name="mapY">
<input type="hidden" id="facltNm" name="facltNm">
<input type="hidden" id="addr" name="addr" >
<input type="hidden" id="book" name="book">
<input type="hidden" id="homepage" name="homepage">
<input type="hidden" id="imgUrl" name="imgUrl">
<input type="hidden" id="tel" name="tel">
<!-- <input type="hidden" id="kpNo" value=0 > -->
<section class="content">
<!--  -->
<div id="sub_title_wrap2">
			<div class="layout">
				<h2>
					<span class="skip"></span>
				</h2>
				<!--타이틀-->
				<div class="s_title2">
					<p class="camp_name"></p>
					<p class="camp_s_tt"></p>
				</div>
				<!--//타이틀-->
				<!--태그영역 테마환경 + 입지구분-->
				<div class="camp_tag">
					<p class="tag_tt">태그</p>
					<ul class="tag_list">

					</ul>
				</div>
				<!--//태그영역-->
			</div>
			<div class="sub_bg_w">
				<div class="camp_bg_01"></div>
			</div>
		</div>
		<div class="gray_bar">
			<span class="skip">공백영역입니다.</span>
		</div>
	<div class="imageUrl">
	</div>
	
<!--  -->
<div class="cont_tb">
	<table class="table">
		<colgroup>
			<col style="width: 30%;">
			<col style="width: 70%;">
		</colgroup>
		<tbody>
			<tr>
				<th scope="col">주소</th>
				<td id="addr1"></td>
			</tr>
			<tr class="camp_call_pcVer">
				<th scope="col">문의처</th>
				<td id="tel"></td>
			</tr>
			<tr>
				<th scope="col">캠핑장 환경</th>
				<td id="lctCl"></td>
			</tr>
			<tr>
				<th scope="col">캠핑장 유형</th>
				<td id="induty"></td>
			</tr>
			<tr>
				<th scope="col">운영기간</th>
				<td id="operPdCl"></td>
			</tr>
			<tr>
				<th scope="col">운영일</th>
				<td id="operDeCl"></td>
			</tr>
			<tr>
				<th scope="col">홈페이지</th>
				<td id="homepage">
				<i class="ico_link"><span class="skip">새창으로</span></i>
				</td>
			</tr>
			<tr>
				<th scope="col">예약방법</th>
				<td id="resveCl"></td>
			</tr>
		</tbody>
	</table>
	<div class="btn_w">
			<button type="button" id="btnRecommend" class="btn_bB1 best" >추천하기 <span class="rec_count"></span></button>
			<button type="button" class="btn_rB1 zzim" >찜하기</button>
			<button type="button" class="btn_gB1 btn_modify" onclick="location.href='/zboard/createForm.do?lmCode=campRequest&amp;c_no=7638'; return false;">정보수정요청</button>
	</div>
			
</div>


<!--  -->		
<div id="contents">