<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>FAQ 카테고리 관리</title>
<%@ include file="/WEB-INF/view/admin/include/headHtml.jsp" %>
<script>
function goDelete(no){
	if (confirm('삭제하시겠습니까?')) {
		location.href='delete.do?no='+no;
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
					<h2>FAQ 카테고리 관리 </h2>

				<!-- //con_tit -->
				<div class="con">
					<!-- 내용 : s -->
					<div id="bbs">
						<div id="bwrite">
							<table width="100%" border="0" cellspacing="0" cellpadding="0" summary="카테고리 추가">
								<colgroup>
									<col style="width:200px" />
									<col style="width:400px" />
									<col width="" />
								</colgroup>
								<thead>
								<form action="insert.do" id="writeFrm" method="post">
									<tr>
										<th scope="col">카테고리 추가</th>
										<th><input type="text" id="categoryname" name="name" class="w100" title="카테고리" /></th>
                                		<th style="text-align:left;"><a class="btns" href="#" onclick="$('#writeFrm').submit();"><strong>저장</strong> </a></th>
									</tr>
								</form>
								</thead>
							</table>
						</div>
					</div>
					<div id="bbs">
						<div id="blist">
							<table width="100%" border="0" cellspacing="0" cellpadding="0" summary="관리자 관리목록입니다.">
								<colgroup>
									<col class="w4" />
									<col class="" />
									<col class="w10" />
									<col class="w10" />

								</colgroup>
								<thead>
									<tr>
										<th scope="col">번호</th>
										<th scope="col">카테고리명</th> 
										<th scope="col">수정</th> 
										<th scope="col">삭제</th> 
									</tr>
								</thead>
                        <tbody>
                        	<c:if test="${empty list}">
                            <tr>
                                <td class="first" colspan="4">등록된 글이 없습니다.</td>
                            </tr>
                            </c:if> 
                           <c:forEach var="vo" items="${list }" varStatus="status">
                           <form action="update.do" id="listFrm${vo.no}" method="post">
                           <input type="hidden" name="no" value="${vo.no}">
                          	<tr class="board_tr">
                          		<td>${vo.no }</td>
                                <td class="txt_l" style="text-align:left;">
                                    <input type="text" name="name" style="width:80%" value="${vo.name }">
                                </td>
                                <td>
                                	<a class="btns" href="#" onclick="$('#listFrm${vo.no}').submit();"><strong>수정</strong> </a>
                                </td>
                                <td>
                                	<a class="btns" href="#" onclick="goDelete(${vo.no})"><strong>삭제</strong> </a>
                                </td>
                            </tr>
                            </form>
                            </c:forEach>  
                        </tbody>					
							</table>
					
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