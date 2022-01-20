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
$(".deleteClick").on('click', function() {
	if (confirm('선택한 문의사항을 삭제하시겠습니까?')) {
		$.ajax({
			type : 'post',
			url : '/bookmall/ask/askdelete.do', // <<-- 처리 요청 URL
			data : $("#frm").serialize(),
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
	
	$(function(){
		$(".board_tr").click(function(){
			location.href='view.do?askno='+$(this).data("askno");
			//console.log($(this).data("boardno"));
		});
	});
	
});
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
							<form name="searchForm" id="searchForm" action="index.do"  method="get">
								<div class="search">
									<select name="searchType" title="검색을 선택해주세요">
										<option value="">전체</option>
										<option value="title" <c:if test="${param.searchType=='title'}">selected</c:if>>제목</option>
										<option value="content" <c:if test="${param.searchType=='content'}">selected</c:if>>내용</option>
									</select>
								</div>
							</form>
						</p>
							<form name="frm" id="frm" action="deleteAll.do" method="post">
							<table width="100%" border="0" cellspacing="0" cellpadding="0" summary="관리자 관리목록입니다.">
								<colgroup>
									<col class="w3" />
									<col class="w4" />
									<col class="" />
									<col class="w10" />
									<col class="w10" />
									<col class="w6" />
								</colgroup>
								<thead>
									<tr>
										<th scope="col" class="first"><input type="checkbox" name="allChk" id="allChk" onClick="checkAll()"/></th>
										<th scope="col">번호</th>
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
                        <c:if test="${!empty askList }">
                           <c:forEach var="ask" items="${askList }" varStatus="status">
                          	<tr class="board_tr" style="font-size: 15px">
                          		<td class="first"><input type="checkbox" name="check" id="check" value="${ask.askno }"/></td>       
                                <td>${ask.askno }</td>
                                <td class="txt_l" style="text-align:left;">
                                    <a href="view.do?askno=${ask.askno }" >${ask.title }  
                                    </a>
                                </td>
                                <td class="name">${ask.userno }</td>
                                <td class="date"><fmt:formatDate value="${ask.regdate}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
                                <td>
                                <c:if test="${ask.status == '대기중' }">대기중</c:if>
                                <c:if test="${ask.status == '답변완료' }">답변완료</c:if>
                                </td>
                            </tr>
                            </c:forEach>
                        </c:if>    
                        </tbody>								
							</table>
							</form>
							<!--//btn-->
							<div class="btn">
								<div class="btnLeft">
									<a href="javascript:;" class="btn deleteClick""><strong>삭제</strong> </a>
								</div>
								<div class="btnRight">
									<a class="wbtn" href="write.do"><strong>답변등록</strong> </a>
								</div>
							</div>
							
							<!-- 페이징 처리 -->
							${pageArea }
							<!-- //페이징 처리 -->
							
							
							<form name="searchForm" id="searchForm" action="index.do"  method="get">
								<div class="search">
									<select name="searchType" title="검색을 선택해주세요">
										<option value="">전체</option>
										<option value="title" <c:if test="${param.searchType=='title'}">selected</c:if>>제목</option>
										<option value="content" <c:if test="${param.searchType=='content'}">selected</c:if>>내용</option>
									</select>
									<input type="text" name="searchWord" value="${param.searchWord }" title="검색할 내용을 입력해주세요" />
									<input type="image" src="<%=request.getContextPath()%>/img/admin/btn_search.gif" class="sbtn" alt="검색" />
									<input type="hidden" name="numchoose" id="numchoose" value="${sudaVo.numchoose }" >
								</div>
							</form>
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