<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ include file="/WEB-INF/view/admin/include/headHtml.jsp" %>
<script>
function goDelete(){
	if (confirm('정말로 삭제하시겠습니까?')) {
		location.href='delete.do?no=${data.no }';
	}
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
					<h2>1:1문의게시판 관리 [내용]</h2>
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
								</div>
								<div class="btnRight">
									<a class="btns" style="cursor:pointer;" href="edit.do?sudano=${data.no }"><strong>수정</strong></a>
									<a class="btns" style="cursor:pointer;" href="javascript:goDelete();"><strong>삭제</strong></a>
								</div>
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