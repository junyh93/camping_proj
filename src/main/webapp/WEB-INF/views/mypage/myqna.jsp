<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<title>1:1문의</title>
<link type="text/css" href="<c:url value='/css/reviewCam.css'/>"  rel="stylesheet" >
<link rel="stylesheet" type="text/css" href="<c:url value='/css/fontawesome.min.css'/> ">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">
<script src="<c:url value='/js/jquery-3.5.1.min.js'/>" ></script>


<script type="text/javascript">
function addqna(memNo){
	$.ajax({
		url:"<c:url value='/qna.do'/>",
		type:"GET",
		success:function(data){
			$('#contents').html(data);
		} 
	
	});
}
$(function(){
	console.log($("td[name=qnaR]").text());
	var qnaR = $('td[name=qnaR]').text();
	
	if(qnaR != null){
		var R = qnaR.split("",qnaR.length);
		console.log(R);
		$.each(R,function(i){
			if(R[i] == 0){
				$('.qnaR').eq(i).html("미답변");
				$('.qnaR').eq(i).css({"color" : "red"});
			}else if(R[i] == 1){
				$('.qnaR').eq(i).html("답변완료");
				$('.qnaR').eq(i).css({"color" : "blue"});
			}
		});

	}
	
	$('.list').hover(function(){
		$(this).children().eq(0).css('color','gray'); 
		$(this).children().eq(1).css('color','gray'); 
		$(this).children().eq(2).css('color','gray');
		$(this).children().eq(3).css('color','gray');
    		}, function() {
		$(this).children().eq(0).css('color','#777');
		$(this).children().eq(1).css('color','#777');
		$(this).children().eq(2).css('color','#777');
		$(this).children().eq(3).css('color','#777');

		
	});
	
});



</script>
<script type="text/javascript">
function getqna(qnaNo){
	$.ajax({
		url:"<c:url value='/getQna.do'/>",
		type:"POST",
		data:{"qnaNo" : qnaNo},
		dataType: "text",
		success:function(data){
			$('#contents').html(data);
		}
	});

};
</script>


	<ul class="tab_list tab_5">
		<li class="off"><a href="#" onclick="zzim_cam('${memNo}')"><span>내가 찜한 캠핑장</span></a></li>
		<li class="off"><a href="#" onclick="review_cam('${memNo}')"><span>내가 작성한 후기</span></a></li>
		<li class="on"><a href="#" onclick="qna('${memNo}')"><span>1:1 문의</span></a></li>
		<li class="off"><a href="<c:url value='mypage.do?memNo=${memNo }'/>"><span>회원정보</span></a></li>
	</ul>
<h3 class="icon_h3">나의 1:1문의</h3>
<section class="mypage_g1">
		<p class="bbs_total">
			<span>전체게시물 <strong class="totalcnt"><fmt:formatNumber />${fn:length(qna)}</strong></span>
			<span>1:1문의하기<a href="#" onclick="addqna('${memNo}')"><strong><i class="fas fa-plus-circle" ></i></strong></a></span>
		</p>
		<div class="board_list">
			<table class="table_list">
				<thead>
					<tr>
						<th scope="col">번호</th>
						<th scope="col">제목</th>
						<th scope="col">작성자</th>
						<th scope="col">등록일</th>
						<th scope="col">답변</th>
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${empty qna }">
							<tr>
								<td class="t_c" colspan="5">등록된 게시글이 없습니다.</td>
							</tr>
						</c:when>
						<c:when test="${!empty qna }">
							<c:forEach var="qna" items="${qna }">
							
								<tr class="list">
									<td class="t_c qnaNo" ><a href="#" onclick="getqna('${qna.qnaNo}')" >${qna.qnaNo }</a></td>
									<td class="t_c qnaTitle" ><a href="#" onclick="getqna('${qna.qnaNo}')" >${qna.qnaTitle }</a></td>
									<td class="t_c id" ><a href="#" onclick="getqna('${qna.qnaNo}')" >${qna.memId }</a></td>
									<td class="t_c date" ><a href="#" onclick="getqna('${qna.qnaNo}')" >${qna.qnaDate }</a></td>
									<td class="t_c qnaR" name="qnaR">${qna.adNo }</td>
								</tr>
							
							</c:forEach>
						</c:when>
					</c:choose>
				</tbody>
			</table>
		</div>
</section>
</div>

				<!--//내용종료-->
			</div>
		</div>
		<!--//콘텐츠박스-->
	</section>
 
	</div>
<%@include file="../common/footer.jsp" %>