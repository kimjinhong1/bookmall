<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">    
    <title>수다게시판 내용</title>
    <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css"/>
    <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>    
    <link rel="stylesheet" href="/bookmall/css/reset.css"/>
    <link rel="stylesheet" href="/bookmall/css/common.css"/>
    <link rel="stylesheet" href="/bookmall/css/contents.css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
    <script src="/bookmall/js/common.js"></script>
<script>
function goDelete(){
	if (confirm('정말로 삭제하시겠습니까?')) {
		location.href='delete.do?no=${data.no }';
	}
}

function goSave() {
    $.ajax({ 
       url:'/bookmall/center/comment/insert.do', 
       type:'post', 
       data:$("#frm").serialize(), 
       success:function(res) {
          if (res.trim() == 1) { 
             alert('댓글이 등록되었습니다.');
             $("#content").val("");
             commentList('board', ${data.no}); 
          } else { 
             alert("댓글 등록 오류");
          }
       }
    })
 }
 // 답변댓글 등록
function goReply(no) {
    $.ajax({ 
       url:'/bookmall/center/comment/reply.do', 
       type:'post', 
       data:$("#frm"+no).serialize(), 
       success:function(res) {
          if (res.trim() == 1) { 
             alert('댓글이 등록되었습니다.');
             $("#content").val("");
             commentList('board', ${data.no}); 
          } else { 
             alert("댓글 등록 오류");
          }
       }
    })
 }
 function commentList(tablename, postno) {
    $.ajax({
       url : '/bookmall/center/comment/list.do', 
       data : {tablename:tablename, postno:postno},  
       success : function(res) { 
          $("#commentArea").html(res);
       }
    })
 }
 $(function() { 
    commentList('board', ${data.no}); 
 })
 function goDel(no) {  
	   if (confirm('댓글을 삭제하시겠습니까?')) { 
		   $.ajax ({
			 	url:"/bookmall/center/comment/delete.do", 
			 	data: {no : no}, 
			 	success: function(res){
			 		if(res.trim() =='1') {  
			 			commentList('board',${data.no}); 
			 		} else {
			 			alert('삭제오류');
			 		}
			 	}
		   })
	   }
 }
 // 클릭한 댓글답변 tr이 나오게
 function showTr(no){
	 $(".replyTr").hide();
	 $("#tr"+no).show();
 }
</script>  
</head>
<body>
    <div class="wrap">
       <%@ include file="/WEB-INF/view/include/header.jsp" %>
          <div class="sub">
            <div class="size">
                <h3 class="sub_title">수다게시판</h3>
                <div class="bbs">
                    <div class="view">
                        <div class="title">
                            <dl>
                            	<c:if test="${data.category == 1 }">도서서평</c:if>
                            	<c:if test="${data.category == 2 }">도서이벤트</c:if>
                            	<c:if test="${data.category == 3 }">도서명언</c:if>
                            	<c:if test="${data.category == 4 }">도서추천</c:if>
                            	<c:if test="${data.category == 5 }">도서모임</c:if>
                            	<c:if test="${data.category == 6 }">도서나눔</c:if>
                            	<c:if test="${data.category == 7 }">도서찾기</c:if>
                            	<c:if test="${data.category == 8 }">기타</c:if>                            	

                                <dt>${data.title } </dt>
                                <dd class="date">작성일 : <fmt:formatDate value="${data.regdate}" pattern="yyyy-MM-dd HH:mm:ss" /> </dd>
                            </dl>
                        </div>
                        <div class="content"><p>${data.content }</p> </div>
                        <dl class="file">
                            <dt>첨부파일 </dt>
                            <dd>
                            <a href="/bookmall/common/download.jsp?path=/upload/&org=${data.filename_org }&real=${data.filename_real}" 
                            target="_blank">${data.filename_org } </a></dd>
                        </dl>
                                    
                        <div class="btnSet clear">
                            <div class="fl_l">
                               <a href="index.do" class="btn2">목록으로</a>
                               <c:if test="${!empty userInfo }">
                               		<a href="reply.do?sudano=${data.no }" class="btn5">답글쓰기</a>
                               </c:if>
                               <c:if test="${data.userno == userInfo.userno}">
	                               <a href="edit.do?sudano=${data.no }" class="btn3">수정하기</a>  
	                               <a href="javascript:goDelete(${data.no });" class="btn4">삭제하기</a>
                               </c:if> 
                            </div>
                        </div>
                    </div>
                    <div>
                    <c:if test="${!empty userInfo }">
                    <form method="post" name="frm" id="frm" action="" enctype="multipart/form-data" >
                       <input type="hidden" name="tablename" value="board"> 
                       <input type="hidden" name="postno" value="${data.no }">  
                       <input type="hidden" name="userno" value="${userInfo.userno }"> 
                        <table class="board_write">
                            <colgroup>
                                <col width="*" />
                                <col width="100px" />
                            </colgroup>
                            <tbody>
                            <tr>
                                <td>
                                    <textarea name="content" id="content" style="height:50px;"></textarea> <!-- 서버로 전송 댓글내-->
                                </td>
                                <td>
                                    <div class="btnSet"  style="text-align:right;">
                                        <a class="btn2" href="javascript:goSave();">저장 </a>
                                    </div>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                        </form>
                  </c:if>
                       <div id="commentArea"></div>
                    
                    </div>
                </div>
            </div>
        </div>
        <%@ include file="/WEB-INF/view/include/footer.jsp" %>     
    </div>
</body>
</html>