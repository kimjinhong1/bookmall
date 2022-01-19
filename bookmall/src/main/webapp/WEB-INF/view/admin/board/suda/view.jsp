<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>수다게시판 관리 [내용]</title>
<%@ include file="/WEB-INF/view/admin/include/headHtml.jsp" %>
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
       url:'/bookmall/admin/comment/reply.do', 
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
       url : '/bookmall/admin/comment/list.do', 
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
			 	url:"/bookmall/admin/comment/delete.do", 
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
<div id="wrap">
	<!-- canvas -->
	<div id="canvas">
		<!-- S T A R T :: headerArea-->
		<%@ include file="/WEB-INF/view/admin/include/top.jsp" %>
		<!-- E N D :: headerArea--> 
		
		<!-- S T A R T :: containerArea-->
		<div id="container">
			<div id="content">
				<div class="con_tit">
					<h2>수다게시판 관리 [내용]</h2>
				</div>
				<!-- //con_tit -->
				<div class="con">
					<!-- 내용 : s -->
					<div id="bbs">
						<div id="bread">
							<table width="100%" border="0" cellspacing="0" cellpadding="0" summary="관리자 관리 기본내용입니다.">
								<colgroup>
									<col width="10%" />
									<col width="15%" />
									<col width="10%" />
									<col width="15%" />
									<col width="25%" />
									<col width="25%" />
								</colgroup>
								<tbody>
									<tr>
										<th scope="row"><label for="">제목</label></th>
										<td colspan="2">
											${data.title }
										</td>
										<th scope="row"><label for="">작성자</label></th>
										<td colspan="2">
											${data.userno }
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="">TOP 공지</label></th>
										<td colspan="2">
											<c:if test="${data.top_notice == 1 }">공지</c:if>
											<c:if test="${data.top_notice == 0 }">공지안함</c:if>
										</td>
										<th scope="row"><label for="">NEW 아이콘</label></th>
										<td colspan="2">
											<c:if test="${data.new_icon == 1 }">항상</c:if>
											<c:if test="${data.new_icon == 2 }">7일</c:if>
											<c:if test="${data.new_icon == 3 }">표기안함</c:if>
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="">공개여부</label></th>
										<td colspan="2">
											<c:if test="${data.secret == 1 }">공개</c:if>
											<c:if test="${data.secret == 2 }">비공개</c:if>
										</td>
										<th scope="row"><label for="">게시일</label></th>
										<td colspan="2">
											<fmt:formatDate value="${data.regdate}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="">내용</label></th>
										<td colspan="10">
											${data.content }
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="">첨부파일</label></th>
										<td colspan="10">
										<c:if test="${!empty data.filename_org}">
												<div class="weidtFile">
													<p><a href="/bookmall/common/download.jsp?path=/upload/&org=${data.filename_org }&real=${data.filename_real}" target="_blank">${data.filename_org }</a></p>
												</div>
										</c:if>
										</td>
									</tr>
								</tbody>
							</table>
							<div class="btn">
								<div class="btnLeft">
									<a class="btns" href="index.do"><strong>목록</strong></a>
									<a class="btns" href="reply.do?sudano=${data.no }"><strong>답글</strong></a>
								</div>
								<div class="btnRight">
									<a class="btns" style="cursor:pointer;" href="edit.do?sudano=${data.no }"><strong>수정</strong></a>
									<a class="btns" style="cursor:pointer;" href="javascript:goDelete();"><strong>삭제</strong></a>
								</div>
							</div>
                    	<div>
                     <form method="post" name="frm" id="frm" action="" enctype="multipart/form-data" >
	                       <input type="hidden" name="tablename" value="board"> 
	                       <input type="hidden" name="postno" value="${data.no }">  
	                       <input type="hidden" name="userno" value="0"> 
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
	                                <a class="btns" href="javascript:goSave();" style='width:50px;'>저장 </a>
	                            </div>
	                        </td>
	                    </tr>
                     </tbody>
                     </table>  
                    </form>
                       <div id="commentArea"></div>
                    </div>
							<!--//btn-->
						</div>
						<!-- //bread -->
					</div>
					<!-- //bbs --> 
					<!-- 내용 : e -->
				</div>
				<!--//con -->
			</div>
			<!--//content -->
		</div>
		<!--//container --> 
		<!-- E N D :: containerArea-->
	</div>
	<!--//canvas -->
</div>
<!--//wrap -->

</body>
</html>