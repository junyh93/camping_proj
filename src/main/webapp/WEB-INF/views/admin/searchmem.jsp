<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<title>회원 검색</title>
<link type="text/css" href="<c:url value='/css/admin.css'/>"  rel="stylesheet" >

<script type="text/javascript">
$(function(){
	
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
function getmem(memNo){
	$.ajax({
		url:"<c:url value='/getMem.do'/>",
		type:"POST",
		data:{"memNo" : memNo},
		dataType: "text",
		success:function(data){
			$('#contents').html(data);
		}
	});

};
</script>
<script type="text/javascript">

function search(){
	var keyword = document.getElementById("searchKeyword").value;
	$.ajax({
		url: "<c:url value='/searchMem.do'/>",
		type:"POST",
		data:{"searchKeyword" : keyword},
		dataType:"text",
		success:function(data){
			$('#contents').html(data);
		}
	});
};
</script>


	<ul class="tab_list tab_5">
		<li class="off"><a href="<c:url value='admin.do'/>" ><span>1:1문의</span></a></li>
		<li class="on"><a href="<c:url value='getMem.do'/>" ><span>회원목록</span></a></li>
		<li class="off"><a href="<c:url value='getCom.do'/>" ><span>댓글목록</span></a></li>
		<li class="off"><a href="<c:url value='getBoard.do'/>"><span>게시글관리</span></a></li>
	</ul>
<h3 class="icon_h3">회원 목록</h3>
<section class="mypage_g1">
<form onsubmit="return false;">
<table> 	
<tr>
	<td scope="col" class="gray w20"><label>회원 검색</label></td>
	<td class="w80"><input type="text" id="searchKeyword" name="searchKeyword" class="txt"></td>
	<td class="w80"><button type="submit" class="b_btn_blue" onclick="search();">검색하기</button></td> 
</tr>
</table>

		<p class="bbs_total">
			<span>전체게시물 <strong class="totalcnt"><fmt:formatNumber />${fn:length(member)}</strong></span>
			<span><strong></strong></span>
		</p>
		<div class="board_list">
			<table class="table_list">
				<thead>
					<tr>
						<th scope="col">회원번호</th>
						<th scope="col">이름</th>
						<th scope="col">아이디</th>
						<th scope="col">이메일</th>
						<th scope="col">휴대폰번호</th>
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${empty member }">
							<tr>
								<td class="t_c" colspan="5">등록된 게시글이 없습니다.</td>
							</tr>
						</c:when>
						<c:when test="${!empty member }">
							<c:forEach var="member" items="${member }">
								<tr class="list">
									<td class="t_c" ><a href="#" onclick="getmem('${member.memNo}')">${member.memNo}</a></td>
									<td class="t_c" ><a href="#" onclick="getmem('${member.memNo}')">${member.memName }</a></td>
									<td class="t_c" ><a href="#" onclick="getmem('${member.memNo}')">${member.memId }</a></td>
									<td class="t_c" ><a href="#" onclick="getmem('${member.memNo}')">${member.memEmail}</a></td>
									<td class="t_c" ><a href="#" onclick="getmem('${member.memNo}')">${member.memPhone}</a></td>
								</tr>
							</c:forEach>
						</c:when>
					</c:choose>
				</tbody>
			</table>
		</div>
		</form>
</section>
</div>

				<!--//내용종료-->
			</div>
		</div>
		<!--//콘텐츠박스-->
	</section>
 
	</div>

<%@include file="../common/footer.jsp" %>