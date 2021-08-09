<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>


	<ul>				
		<li>
				<div class="c_list update">
					<a href="/bsite/camp/info/read.do?c_no=3042&amp;viewType=read01&amp;listOrdrTrget=last_updusr_pnttm&amp;searchDo=,17,&amp;c_signgu=234" class="dc_none"><span class="skip">캠핑장정보 더보기</span>
						<div class="img_box">
							<img src="/upload/camp/3042/thumb/thumb_720_4186d51wn0EevJTyGUCBMuSO.jpg" alt="캠파제주 ">
<!-- 								<div class="clist_icon">
								<ul>
									<li><i class="con_tip c03"><span class="skip">산</span></i></li>
									</ul>
							</div> -->
						</div> 
					</a>
					
					<div class="camp_cont">
<!-- 						<p class="item_group">
							<span class="item_t01">관광사업자 등록업체</span>
							<span class="item_t02">리뷰수 0</span> 
							<span class="item_t03">조회수 8122</span> 
							<span class="item_t04">추천수 2</span>
						</p> -->
						<h2 class="camp_tt">
							<a href="/bsite/camp/info/read.do?c_no=3042&amp;viewType=read01&amp;listOrdrTrget=last_updusr_pnttm&amp;searchDo=,17,&amp;c_signgu=234">[제주도 서귀포시] 캠파제주 </a>
						</h2>
						<span class="camp_stt">창이 넓은 카라반에서 일출과 노을을 감상할 수 있는 캠파제주</span> 
						<span class="camp_txt"> 
						<a href="/bsite/camp/info/read.do?c_no=3042&amp;viewType=read01&amp;listOrdrTrget=last_updusr_pnttm&amp;searchDo=,17,&amp;c_signgu=234"><span class="skip">캠핑장정보 더보기</span> 캠파제주는 제주의 368개의 오름 중 하나인 영천오름에 위치하고 있으며, 산책로와 오름을 트레킹하면서 제주도 최고의 ...</a>
						</span>
						<ul class="camp_info01">
							<li class="addr">제주특별자치도 서귀포시 상효동  1116-1 </li>
							<li class="call_num">064-767-1253</li>
						</ul>
							
						<!--아이콘모음-->
						<div class="camp_item_box">
								<ul>
									<li><i class="ico_volt"><span>전기</span></i></li>
									<li><i class="ico_wifi"><span>와이파이</span></i></li>
									<li><i class="ico_hotwater"><span>온수</span></i></li>
									<li><i class="ico_playzone"><span>놀이터</span></i></li>
									<li><i class="ico_walk"><span>산책로</span></i></li>
									<li><i class="ico_ico_sports"><span>운동시설</span></i></li>
									<li><i class="ico_mart"><span>마트.편의점</span></i></li>
								</ul>
						</div>
						<!--//아이콘모음-->
						
					</div>
					
					
				</div>
				
				
			</li>			
		</ul>

























<title>댓글</title>
<link type="text/css" href="<c:url value='/css/comment.css'/>" rel="stylesheet">
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>

<script type="text/javascript">
$(function(){
	$('.comadd').click(function(){
		if($('#sessionId').val()== ""){
			alert('로그인 이후 이용 가능합니다.');
			$("#comment").val("");
		}else{
			fn_comment(code);
		}
	});
});
/*
 * 댓글 등록하기(Ajax)
 */
function fn_comment(code){
    
    $.ajax({
        type:'POST',
        url : "<c:url value='/comment.do'/>",
        data:$("#commentForm").serialize(),
        success : function(data){
        	console.log(data);
            if(data=="success")
            {
                getCommentList();
                $("#comment").val("");
            }
        },
        error:function(request,status,error){
       }
        
    });
}

/**
 * 초기 페이지 로딩시 댓글 불러오기
 */
$(function(){
    getCommentList();
});   


function delcom(comNo){

	var paramData = {"comNo": comNo};
	$.ajax({

		url: "<c:url value='/deleteComment.do'/>"

		, data : paramData

		, type : 'GET'

		, dataType : 'text'

		, success: function(result){
			if(result == "Y"){
				
			getCommentList();
			
			}
		}

		,error:function(request,status,error){
            //alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	       }
	});

}

/**
 * 댓글 불러오기(Ajax)
 */
function getCommentList(){
    var rvNo = $("#rvNo").val();
	
    $.ajax({
        type:'GET',
        url : "<c:url value='/commentList.do'/>",
        dataType : "json",
        data:{"rvNo":rvNo},
        contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
        success : function(data){
            console.log(data);
            var html = "";
            var cCnt = data.length;
            
            if(data.length > 0){
                
                for(i=0; i<data.length; i++){
                    html += "<div>";
                    html += "<div><table class='comtable'><h4><strong>"+data[i].memId+"</strong></h4>";
                    html += "<div class='comcontent'>"+data[i].comContent +"</div><div class='comdate'>"+data[i].comDate+"</div><a href='#' onclick='delcom("+data[i].comNo+")' class='combtn' name='delete'>삭제</a><tr><td></td></tr>";
                    html += "</table></div>";
                    html += "</div>";
                }
                
            } else {
                
                html += "<div>";
                html += "<div><table ><h6><strong>등록된 댓글이 없습니다.</strong></h6>";
                html += "</table></div>";
                html += "</div>";
                
            }
            

            $("#cCnt").html(cCnt);
            $("#commentList").html(html);


            
        },
        error:function(request,status,error){
            
       }
        
    });
       	
}


 
</script>

<!-- <c:url value='/deleteComment.do?comNo="+data[i].comNo+"&memNo="+data[i].memNo+"'/> -->

<div class="container">
    <form id="commentForm" name="commentForm" method="post">
    			
		 		 <input type="hidden" id="sessionId" name="memId" value="${memId}">
		 		 <input type="hidden" id="sessionNo" name="memNo" value="${memNo}">
    			 <input type="hidden" id="rvNo" name="rvNo" value="${review.rvNo }">
    <br><br>
        <div>
            <div>
                <span><strong>Comments</strong></span> <span id="cCnt"></span>
            </div>
            <div>
                <table class="table">                    
                    <tr>
                        <td>
                            <textarea style="width: 1100px" rows="3" cols="30" id="comment" name="comContent" placeholder="댓글을 입력하세요"></textarea>
                            <br> 
                            <div class="add">
                                <a href='#' onClick="fn_comment('${review.rvNo }')" class="comadd">등록</a>
                            </div>
                        </td>
                    </tr>
                </table>
            </div>
        </div>       
    </form>
</div>
<div class="container_com">
    <form id="commentListForm" name="commentListForm" method="post">
        <div id="commentList" class="comment">
        </div>
    </form>
</div>


</html>