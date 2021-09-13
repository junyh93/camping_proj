<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<title>관리자 페이지</title>
<link type="text/css" href="<c:url value='/css/admin.css'/>"  rel="stylesheet" >

<script type="text/javascript">
$(function(){
	console.log($("td[name=qnaR]").text());
	
	var qnaR = $("td[name=qnaR]").text();
	
	console.log(qnaR);
	if(qnaR == 0){
		$('.qnaR').html("미답변");
		$('.qnaR').css({"color" : "red"});
	}else if(qnaR == 1){
		$('.qnaR').html("답변완료");
		$('.qnaR').css({"color" : "blue"});
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
function adminqna(qnaNo){
	$.ajax({
		url:"<c:url value='/adminQna.do'/>",
		type:"POST",
		data:{"qnaNo" : qnaNo},
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


	<ul class="tab_list tab_5">
		<li class="on"><a href="<c:url value='admin.do'/>" ><span>1:1문의</span></a></li>
		<li class="off"><a href="<c:url value='getMem.do'/>" ><span>회원목록</span></a></li>
		<li class="off"><a href="<c:url value='getCom.do'/>" ><span>댓글목록</span></a></li>
		<li class="off"><a href="<c:url value='getBoard.do'/>"><span>게시글관리</span></a></li>
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
</form>
		<p class="bbs_total">
			<span>전체게시물 <strong class="totalcnt"><fmt:formatNumber />${fn:length(qna)}</strong></span>
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
						<c:when test="${empty qna }">
							<tr>
								<td class="t_c" colspan="5">등록된 게시글이 없습니다.</td>
							</tr>
						</c:when>
						<c:when test="${!empty qna }">
							<c:forEach var="qna" items="${qna }">
								<tr class="list">
									<td class="t_c" ><a href="#" onclick="adminqna('${qna.qnaNo}')">${qna.qnaNo }</a></td>
									<td class="t_c" ><a href="#" onclick="adminqna('${qna.qnaNo}')">${qna.qnaTitle }</a></td>
									<td class="t_c" ><a href="#" onclick="adminqna('${qna.qnaNo}')">${qna.memId }</a></td>
									<td class="t_c" ><a href="#" onclick="adminqna('${qna.qnaNo}')">${qna.qnaDate }</a></td>
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