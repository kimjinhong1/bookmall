<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="bookmall.util.*" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>수다게시판 관리 [목록]</title>
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
					<h2>수다게시판 관리</h2>

				<!-- //con_tit -->
				<div class="con">
					<!-- 내용 : s -->
					<div id="bbs">
						<div id="blist">
						<p><span><strong>총 ${totCount }</strong>  |  ${sudaVo.page }/${totPage }페이지</span>
							<span style="text-align:right;float:right">
								<select id="numsel" onchange="$('#numchoose').val($('#numsel').val());$('#searchForm').submit();">
									<option value="10" <c:if test="${10 == sudaVo.numchoose}">selected</c:if>>10개씩</option>
									<option value="20" <c:if test="${20 == sudaVo.numchoose}">selected</c:if>>20개씩</option>
									<option value="30" <c:if test="${30 == sudaVo.numchoose}">selected</c:if>>30개씩</option>
								</select>
							</span>
						</p>
							<form name="frm" id="frm" action="deleteAll.do" method="post">
							<table width="100%" border="0" cellspacing="0" cellpadding="0" summary="관리자 관리목록입니다.">
								<colgroup>
									<col class="w3" />
									<col class="w6" />
									<col class="w10" />
									<col class="" />
									<col class="w10" />
									<col class="w10" />
									<col class="w6" />
								</colgroup>
								<thead>
									<tr>
										<th scope="col" class="first"><input type="checkbox" name="allChk" id="allChk" onClick="checkAll()"/></th>
										<th scope="col">번호</th>
										<th scope="col">카테고리</th>
										<th scope="col">제목</th> 
										<th scope="col">작성자</th>
										<th scope="col">작성일</th> 
										<th scope="col" class="last">조회수</th>
									</tr>
								</thead>
                        <tbody>
                  		<c:if test="${empty list }">
                            <tr>
                                <td class="first" colspan="7">등록된 글이 없습니다.</td>
                            </tr> 
                        </c:if>
                        <c:if test="${!empty list }">
                           <c:forEach var="vo" items="${list }" varStatus="status">
                          	<tr class="board_tr" style="cursor:pointer;">
                          		<td class="first"><input type="checkbox" name="check" id="check" value="${vo.no }"/></td>       
                                <td>${(totCount-status.index) - ((sudaVo.page -1)*10)}</td>
                                <td>
                                	<c:if test="${vo.category == 1 }">도서서평</c:if>
	                            	<c:if test="${vo.category == 2 }">도서이벤트</c:if>
	                            	<c:if test="${vo.category == 3 }">도서명언</c:if>
	                            	<c:if test="${vo.category == 4 }">도서추천</c:if>
	                            	<c:if test="${vo.category == 5 }">도서모임</c:if>
	                            	<c:if test="${vo.category == 6 }">도서나눔</c:if>
	                            	<c:if test="${vo.category == 7 }">도서찾기</c:if>
	                            	<c:if test="${vo.category == 8 }">기타</c:if>
                                </td>
                                <td class="txt_l" style="text-align:left;">
 		                                <c:if test="${vo.nested > 0 }">
	                                 	<c:forEach begin="1" end="${vo.nested}">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</c:forEach>
	                                	<img src="/bookmall/img/reply_icon.jpeg" style='width:25px;'>
                               		    </c:if>                               
                                    <a href="view.do?sudano=${vo.no }" >${vo.title } [${vo.c_count }]
                                    ${CommonUtil.getNewIcon(vo.regdate, vo.new_icon) }
                                    </a>
                                </td>
                                <td class="name">${vo.name }</td>
                                <td class="date"><fmt:formatDate value="${vo.regdate}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
                                <td class="readcount">${vo.readcount }</td>
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
									<select id="stype" name="searchCategory" class="dSelect" title="검색분류 선택">
	                                    <option value="">전체</option>  
	                                    <option value="1" <c:if test="${param.searchCategory=='1'}">selected</c:if>>도서서평</option>
	                                    <option value="2" <c:if test="${param.searchCategory=='2'}">selected</c:if>>도서이벤트</option>
	                                    <option value="3" <c:if test="${param.searchCategory=='3'}">selected</c:if>>도서명언</option>
	                                    <option value="4" <c:if test="${param.searchCategory=='4'}">selected</c:if>>도서추천</option>
	                                    <option value="5" <c:if test="${param.searchCategory=='5'}">selected</c:if>>독서모임</option>
	                                    <option value="6" <c:if test="${param.searchCategory=='6'}">selected</c:if>>도서나눔</option>
	                                    <option value="7" <c:if test="${param.searchCategory=='7'}">selected</c:if>>도서찾기</option>
	                                    <option value="8" <c:if test="${param.searchCategory=='8'}">selected</c:if>>기타</option>
	                                </select>
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