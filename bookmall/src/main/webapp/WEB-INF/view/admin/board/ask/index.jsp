<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="bookmall.util.*" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ include file="/WEB-INF/view/admin/include/headHtml.jsp" %>
<script>

$(function(){
	$(".board_tr").click(function(){
		location.href='view.do?askno='+$(this).data("askno");
		//console.log($(this).data("boardno"));
	});

$(".deleteClick").on('click', function() {
	if (confirm('선택하신 문의사항을 삭제하시겠습니까?')) {
		$.ajax({
			type : 'post',
			url : '/bookmall/ask/deleteAjax.do', // <<-- 처리 요청 URL
			data : $("#askspace").serialize(),
			success : function(res) { // 비동기요청  성공시
				alert('총 '+res.trim()+"건이 삭제되었습니다.");
				location.reload(); // 페이지 새로고침
			}
		});
	}
});

	function checkAll(){
		if ($("#allChk").prop('checked')) {
			$("input[name='check']").each(function(idx){
				$("input[name='check']").eq(idx).prop("checked",true);
			})
		} else {
			$("input[name='check']").each(function(idx){
				$("input[name='check']").eq(idx).prop("checked",false);
			})
		}
	}
})

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
                <div class="bbs">				
					<h2>1:1문의게시판 관리</h2>
				<!-- //con_tit -->
				<div class="con">
					<!-- 내용 : s -->
					<div id="bbs">
						<div id="blist">
						<p><span><strong>총 ${totCount }</strong>  |  ${AskVo.page }/${totPage }페이지</span>
								<div class="search">
									<select name="searchType" title="검색을 선택해주세요">
										<option value="">전체</option>
										<option value="title" <c:if test="${param.searchType=='title'}">selected</c:if>>제목</option>
										<option value="content" <c:if test="${param.searchType=='content'}">selected</c:if>>내용</option>
									</select>
								</div>
						</p>
							<table width="100%" border="0" cellspacing="0" cellpadding="0" summary="관리자 관리목록입니다.">
								<colgroup>
									<col class="w5" />
									<col class="w5" />
									<col class="w10" />
									<col class="w50" />
									<col class="w10" />
									<col class="w10" />
									<col class="*" />
								</colgroup>
								<thead>
									<tr>
										<th scope="col" class="first"><input type="checkbox" name="allChk" id="allChk" onClick="checkAll()"/></th>
										<th scope="col">번호</th>
										<th scope="col">문의사항</th>
										<th scope="col">제목</th> 
										<th scope="col">작성자</th>
										<th scope="col">작성일</th> 
										<th scope="col">답변상태</th> 
									</tr>
								</thead>
                        <tbody>
	                  		<c:if test="${empty askList }">
	                            <tr>
	                                <td class="first" colspan="6">등록된 글이 없습니다.</td>
	                            </tr> 
	                        </c:if>
	                        <form name="askspace" id="askspace">
		                        <c:if test="${!empty askList }">
			                           <c:forEach var="ask" items="${askList }" varStatus="status">
				                          	<tr style="font-size: 15px">
				                          		<td class="first"><input type="checkbox" name="askno" id="check" value="${ask.askno }"></td>       
				                                <td>${ask.askno }</td>
				                                <td>${ask.subject }</td>
				                                <td class="txt_l" style="text-align:left;">
				                                    <a href="view.do?askno=${ask.askno }" >${ask.title } </a>
				                                </td>
				                                <td class="name">${ask.userno }</td>
				                                <td class="date"><fmt:formatDate value="${ask.regdate}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
				                                <td>
				                              	  ${ask.status }
				                                </td>
				                            </tr>
			                            </c:forEach>
		                        </c:if>    
	                        </form>
                        </tbody>								
					</table>
							<!--//btn-->
							<div class="btn">
								<div class="btnLeft">
									<a href="javascript:;" class="deleteClick" style="cursor: pointer; font-weight: bold;"><strong>삭제</strong> </a>
								</div>
								<div class="btnRight">
									<a class="wbtn" href="write.do"><strong>새 글 작성</strong> </a>
								</div>
							</div>
							
							<!-- 페이징 처리 -->
							${pageArea }
							<!-- //페이징 처리 -->
							
							<!-- //search --> 
						</div>
						<!-- //blist -->
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