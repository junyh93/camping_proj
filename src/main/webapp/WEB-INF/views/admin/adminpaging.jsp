<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@include file="../common/header.jsp" %>
<%@include file="../common/adminheader.jsp" %>

<title>관리자 페이지</title>
<link type="text/css" href="<c:url value='/css/adminpaging.css'/>"  rel="stylesheet" >
<script src="<c:url value='/js/jquery-3.5.1.min.js'/>" ></script>

<script type="text/javascript">
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
	
	
	
	
	console.log(qnaR);



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

function adminqna(qnaNo){
	var page = $('#page').val();
	var range = $('#range').val();
	var rangeSize = $('#rangeSize').val();
	$.ajax({
		url:"<c:url value='/getAdminQna.do'/>",
		type:"POST",
		data:{"qnaNo" : qnaNo,
			"page" : page,
			"range" : range,
			"rangeSize" : rangeSize
		},
		dataType: "text",
		success:function(data){
			$('#contents').html(data);
		}
	});

};
</script>
<script type="text/javascript">
function search(){
	var condition = document.getElementById("condition").options[document.getElementById("condition").selectedIndex].value;
	$.ajax({
		url: "<c:url value='/searchQna.do'/>",
		type:"GET",
		data:{"condition" : condition},
		dataType:"text",
		success:function(data){
			$('#contents').html(data);
		}
	});
};
</script>
<script type="text/javascript">
//이전 버튼 이벤트

function fn_prev(page, range, rangeSize) {

		var page = ((range - 2) * rangeSize) + 1;

		var range = range - 1;

		

		var url = "<c:url value='/admin.do'/>";

		url = url + "?page=" + page;

		url = url + "&range=" + range;

		

		location.href = url;

	}



  //페이지 번호 클릭

	function fn_pagination(page, range, rangeSize, searchType, keyword) {

		var url = "<c:url value='/admin.do'/>";

		url = url + "?page=" + page;

		url = url + "&range=" + range;



		location.href = url;	

	}



	//다음 버튼 이벤트

	function fn_next(page, range, rangeSize) {

		var page = parseInt((range * rangeSize)) + 1;

		var range = parseInt(range) + 1;

		

		var url = "<c:url value='/admin.do'/>";

		url = url + "?page=" + page;

		url = url + "&range=" + range;

		

		location.href = url;

	}
</script>

	<ul class="tab_list tab_5">
		<li class="on"><a href="<c:url value='admin.do'/>" ><span>1:1문의</span></a></li>
		<li class="off"><a href="<c:url value='getMem.do'/>" ><span>회원목록</span></a></li>
		<li class="off"><a href="<c:url value='getCom.do'/>" ><span>댓글목록</span></a></li>
		<li class="off"><a href="<c:url value='getNotice.do'/>"><span>공지사항 목록</span></a></li>
	</ul>
<h3 class="icon_h3">1:1문의 목록</h3>
<section class="mypage_g1">
<form onsubmit="return false;">
<table>
<tr>
	<td scope="col" class="gray w20"><label>문의사항</label></td>
	<td class="w80">
		<select  class="search sch"  style="margin: 5px; " name="condition" id="condition" var="option" onchange="search();">
           <c:forEach items="${conditionMap }" var="option">
             <option value="${option.value }">${option.key }
       	   </c:forEach>
        </select>
    </td> 
</tr>
</table>

		<p class="bbs_total">
			<span>전체게시물 <strong class="totalcnt"><fmt:formatNumber />${fn:length(qnaList)}</strong></span>
			<span><strong></strong></span>
			
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
						<c:when test="${empty qnaList }">
							<tr>
								<td class="t_c" colspan="5">등록된 게시글이 없습니다.</td>
							</tr>
						</c:when>
						<c:when test="${!empty qnaList }">
							<c:forEach var="list" items="${qnaList }">
								<tr class="list">
									<td class="t_c" ><a href="#" onclick="adminqna('${list.qnaNo}')">${list.qnaNo }</a></td>
									<td class="t_c" ><a href="#" onclick="adminqna('${list.qnaNo}')">${list.qnaTitle }</a></td>
									<td class="t_c" ><a href="#" onclick="adminqna('${list.qnaNo}')">${list.memId }</a></td>
									<td class="t_c" ><a href="#" onclick="adminqna('${list.qnaNo}')">${list.qnaDate }</a></td>
									<td class="t_c qnaR" name="qnaR">${list.adNo }</td>
								</tr>
							</c:forEach>
						</c:when>
					</c:choose>
				</tbody>
			</table>
		</div>
	</form>
</section>
	
    <div class="pageInfo_wrap" >
        <div class="pageInfo_area">
 			<ul id="pageInfo" class="pageInfo">
 			
			<c:if test="${pagination.prev}">

				<li class="page-item"><a class="page-link" href="#" onClick="fn_prev('${pagination.page}', '${pagination.range}', '${pagination.rangeSize}')"><img src="<c:url value='/img/btn_pre01.png'/>">Previous</a></li>

			</c:if>

				

			<c:forEach begin="${pagination.startPage}" end="${pagination.endPage}" var="idx">

				<li class="page-item ${pagination.page == idx ? 'active' : ''} "><a class="page-link" href="#" onClick="fn_pagination('${idx}', '${pagination.range}', '${pagination.rangeSize}')"> ${idx} </a></li>

			</c:forEach>

				

			<c:if test="${pagination.next}">

				<li class="page-item"><a class="page-link" href="#" onClick="fn_next('${pagination.page}', 

'${pagination.range}', '${pagination.rangeSize}')" ><img src="<c:url value='img/btn_next01.png'/>">Next</a></li>

			</c:if>

              
 			</ul>
        </div>
    </div>
<input type="hidden" id="page" name="page" value="${pagination.page }">
<input type="hidden" id="range" name="range" value="${pagination.range }">
<input type="hidden" id="rangeSize" name="rangeSize" value="${pagination.rangeSize }">
</div>

				<!--//내용종료-->
			</div>
		</div>
		<!--//콘텐츠박스-->
	</section>
 
	</div>

<%@include file="../common/footer.jsp" %>