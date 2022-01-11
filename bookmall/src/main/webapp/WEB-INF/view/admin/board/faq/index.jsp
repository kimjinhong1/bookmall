<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ include file="/WEB-INF/view/admin/include/headHtml.jsp" %>
<script>
function goDelete(){
	if (confirm("정말로 삭제하시겠습니까?")) {
		$("#frm").submit();
	}
}

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
					<h2>FAQ 관리 </h2>

				<!-- //con_tit -->
				<div class="con">
					<!-- 내용 : s -->
					<div id="bbs">
						<div id="blist">
						<p><span><strong>총 ${totCount }</strong>  |  ${faqVo.page }/${totPage }페이지</span></p>
							<form name="frm" id="frm" action="deleteAll.do" method="post">
							<table width="100%" border="0" cellspacing="0" cellpadding="0" summary="관리자 관리목록입니다.">
								<colgroup>
									<col class="w3" />
									<col class="w4" />
									<col class="w15" />
									<col class="" />
									<col class="w10" />

								</colgroup>
								<thead>
									<tr>
										<th scope="col" class="first"><input type="checkbox" name="allChk" id="allChk" onClick="checkAll()"/></th>
										<th scope="col">번호</th>
										<th scope="col">카테고리</th>
										<th scope="col">제목</th> 
										<th scope="col">작성일</th> 
									</tr>
								</thead>
                        <tbody>
                  		<c:if test="${empty list }">
                            <tr>
                                <td class="first" colspan="5">등록된 글이 없습니다.</td>
                            </tr> 
                        </c:if>
                        <c:if test="${!empty list }">
                           <c:forEach var="vo" items="${list }" varStatus="status">
                          	<tr class="board_tr" style="cursor:pointer;">
                          		<td class="first"><input type="checkbox" name="check" id="check" value="${vo.no }"/></td>       
                                <td>${(totCount-status.index) - ((faqVo.page -1)*10)}</td>
                                <td>${vo.categoryname }</td>
                                <td class="txt_l" style="text-align:left;">
                                    <a href="view.do?faqno=${vo.no }" >${vo.title }</a>
                                </td>
                                <td class="date"><fmt:formatDate value="${vo.regdate}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
                              
                            </tr>
                            </c:forEach>
                        </c:if>    
                        </tbody>								
							</table>
							</form>
						<!--//btn-->
							<div class="btn">
								<div class="btnLeft">
									<a class="btns" href="#" onclick="goDelete()"><strong>삭제</strong> </a>
								</div>
								<div class="btnRight">
									<a class="wbtn" href="write.do"><strong>등록</strong> </a>
								</div>
							</div>
							
							<!-- 페이징 처리 -->
							${pageArea }
							<!-- //페이징 처리 -->
							
							<form name="searchForm" id="searchForm" action="index.do"  method="get">
								<div class="search">
									<select name="searchCategory">
										<option value="">전체</option>
									<c:forEach var="vo" items="${clist}">
									    <option value="${vo.no}" <c:if test="${vo.no == param.searchCategory}">selected</c:if>>${vo.name}</option>
									</c:forEach>
									</select>
									<select name="searchType" title="검색을 선택해주세요">
										<option value="">전체</option>
										<option value="title" <c:if test="${param.searchType=='title'}">selected</c:if>>제목</option>
										<option value="content" <c:if test="${param.searchType=='content'}">selected</c:if>>내용</option>
									</select>
									<input type="text" name="searchWord" value="${param.searchWord }" title="검색할 내용을 입력해주세요" />
									<input type="image" src="<%=request.getContextPath()%>/img/admin/btn_search.gif" class="sbtn" alt="검색" />
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