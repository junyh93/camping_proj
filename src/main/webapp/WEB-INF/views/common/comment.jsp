<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>

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
/* 댓글 등록하기(Ajax)*/
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
<section class="commentcon">
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
                        <td>                          <div class="add">
                                <a href='#' onClick="fn_comment('${review.rvNo }')" class="comadd">등록</a>
                            </div>
                            <textarea style="width: 100%" rows="3" cols="30" id="comment" name="comContent" placeholder="댓글을 입력하세요"></textarea>
                            <br> 
  
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

</section>
</html>