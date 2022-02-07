<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ include file="/WEB-INF/view/admin/include/headHtml.jsp" %>

<script>
	//도서 검색 
	function goSearch(){
		window.location = "/bookmall/admin/book/index.do?page=1&searchType="+$("#searchType").val()+"&searchWord="+$("#searchWord").val();
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
					<h2>도서관리 - [목록]</h2>
				</div>
				<!-- //con_tit -->
				<div class="con">
					<!-- 내용 : s -->
					<div id="bbs">
						<div id="blist">
							<form name="frm" id="frm" action="process.do" method="post">
							<table width="100%" border="0" cellspacing="0" cellpadding="0" summary="관리자 도서 관리목록입니다.">
								<colgroup>
									<col class="w6" />
									<col class="w4" />
									<col class="" />
									<col class="w10" />
									<col class="w5" />
									<col class="w4" />
								</colgroup>
								<thead>
									<tr>
										<th scope="col" class="first"><input type="checkbox" name="allChk" id="allChk" onClick="check(this, document.frm.no)"/></th>
										<th scope="col">ISBN</th>
										<th scope="col">도서명</th> 
										<th scope="col">저자</th> 
										<th scope="col">출판사</th> 
										<th scope="col">도서상태</th>
										<th scope="col">상세정보</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="vo" items="${list }">
									<tr>
										<td class="first"><input type="checkbox" name="no" id="no" value=""/></td>
										<td>${vo.isbn } </td>
										<td>${vo.btitle_first }_${vo.btitle_second }</td>
										<td>${vo.author }</td>
										<td>${vo.publisher }</td>
										<td><c:if test="${vo.bstatus == 0}">노출</c:if><c:if test="${vo.bstatus == 1}">비노출</c:if></td>
										<td><input type="button" value="상세정보" onclick="location.href='/bookmall/admin/book/detail.do?bookno=${vo.bookno}';"></td>
									</tr>
									</c:forEach>
								</tbody>
							</table>
							</form>
							<div class="btn">
								<div class="btnLeft">
									<a class="btns" href="#" onclick=""><strong>삭제</strong> </a>
								</div>
								<div class="btnRight">
									<a class="wbtn" href="/bookmall/admin/book/write.do"><strong>등록</strong> </a>
								</div>
							</div>
							<!--//btn-->
							<!-- 페이징 처리 -->
							<div class='page'>
								${pageArea }
							</div>
							<!-- 도서 검색 시작 -->
							<div class="search">
								<select name="searchType" id="searchType" title="검색을 선택해주세요">
									<option value="all">전체</option>
									<option value="btitle">제목</option>
									<option value="author">저자</option>
								</select>
								<input type="text" name="searchWord" id="searchWord" value="" title="검색할 내용을 입력해주세요" />
								<input type="image" src="<%=request.getContextPath()%>/img/admin/btn_search.gif" class="sbtn" alt="검색" onClick="goSearch();" />
							</div>
							<!-- 도서 검색 종료 --> 
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
		<div>${pageArea }</div>
	</div>
	<!--//canvas -->
</div>
<!--//wrap -->

</body>
</html>