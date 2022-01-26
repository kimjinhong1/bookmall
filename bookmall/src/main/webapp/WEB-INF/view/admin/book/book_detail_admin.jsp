<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ include file="/WEB-INF/view/admin/include/headHtml.jsp" %>
<script>
	function goDel() {
		if (confirm("해당 도서를 삭제 하시겠습니까?")) {
			$("#frm").submit();
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
					<h2>도서관리 - [도서 상세]</h2>
				</div>
				<!-- //con_tit -->
				<div class="con">
					<!-- 내용 : s -->
						<div class="container">
							<div class="bbs">
								<p>현재 재고 수 : ${data.bstack }
								<a href="update.do?bookno=${data.bookno}" class="btn btn-warning"> 수정하기 &raquo;</a>
								<form name="frm" id="frm" action="delete.do" method="post" enctype="multipart/form-data">
									<input type="hidden" name="bookno" value="${data.bookno }">
									<a href="javascript:;" class="btn btn-secondary" onclick="goDel();"> 삭제하기 &raquo;</a>
								</form>
							</div>
							<div class="row">
								<div class="col-md-5">
									<img src="" style="width: 300px; height: 500px;">
								</div>
								<div class="col-md-6">
									<h3>ISBN : ${data.isbn }</h3>   
									<p>도서명 : ${data.btitle_first } ${data.btitle_second }
									<p>저자 : ${data.author }
									<c:if test="${data.translator ne ''} ">
										<p>번역가 : ${data.translator }
									</c:if>
									<p>출판사 : ${data.publisher }
									<p>가격 : ${data.price }
									<p>판매가 : ${data.salesprice }
									<p>도서분류 : <c:if test="${data.classify eq 0}"> 국내도서 </c:if> <c:if test="${data.classify eq 1}"> 국외도서</c:if>
									<p>카테고리 : <br>
									<c:forEach items="${list }" var="cate">
						         		&nbsp;&nbsp;&nbsp;${cate.parentname} >	
					         			${cate.bcategoryname }<br>
					         		</c:forEach>
									<p>페이지수 : ${data.bpages }쪽
									<p>무게 : ${data.bweight }(g)
									<p>크기 : ${data.bwidth } * ${data.bvertical } * ${data.bheight } (mm)				
								</div>
								<div class="bintroduce">
									<p>도서 소개<hr>
									<textarea name="bintroduce" id="bintroduce" style="width:100%;" readonly>
										${data.bintroduce }
									</textarea>
								</div>
								<div class="bindex">
									<p>도서 목차<hr>
									<textarea name="bindex" id="bindex" style="width:100%;" readonly>
										${data.bindex }
									</textarea>
								</div>
					<!-- //bbs --> 
					<!-- 내용 : e -->
							</div>
						</div>
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