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
							<div class="bbs" >
								<p><h3>현재 재고 수 : ${data.bstack }</h3></p> <br>
								<a href="update.do?bookno=${data.bookno}" class="btn btn-warning"> 수정하기 &raquo;</a>
								<form name="frm" id="frm" action="delete.do" method="post" enctype="multipart/form-data">
									<input type="hidden" name="bookno" value="${data.bookno }">
									<a href="javascript:;" class="btn btn-secondary" onclick="goDel();"> 삭제하기 &raquo;</a>
								</form>
							</div>
							<div class="row">
								<div class="col-md-5" style="border: 1px; width: 400px; height: 635px; float: left; padding-top: 10px; margin-right: 10px;">
									<img src="/bookmall/upload/${data.bthumb_real }" style="width: 300px; height: 500px;">
								</div>
								<div class="col-md-6" style="width: 800px; height: 635px; float: left; padding-top: 10px;">
								<div class="isbn" style="width: 750px; height: 30px; padding-top: 15px; padding-left: 20px;">
									<p align="left"><font size="6em"><b>ISBN :</b> ${data.isbn }</font>
								</div>
								<div class="btitle" style="width: 750px; height: 30px; padding-top: 15px; padding-left: 20px;">
									<p align="left"><font size="6em"><b>도서명 : </b></font><font size="3em"><b>${data.btitle_first }</b>&nbsp;&nbsp;&nbsp;${data.btitle_second }</font>
								</div>
								<div class="author" style="width: 750px; height: 30px; padding-top: 15px; padding-left: 20px;">
									<p align="left"><font size="6em"><b>저자명 :</b> ${data.author }</font>
									<c:if test="${data.translator ne ''} ">
										<p align="left"><font size="6em"><b>번역가 :</b> ${data.translator }</font>
									</c:if>
								</div>
								<div class="publisher" style="width: 750px; height: 30px; padding-top: 15px; padding-left: 20px;">
									<p align="left"><font size="6em"><b>출판사 :</b> ${data.publisher }</font>
								</div>
								<div class="price" style="width: 750px; height: 30px; padding-top: 15px; padding-left: 20px;">
									<p align="left"><font size="6em"><b>가격 :</b> ${data.price }</font>
								</div>
								<div class="salesprice" style="width: 750px; height: 30px; padding-top: 15px; padding-left: 20px;">
									<p align="left"><font size="6em"><b>판매가 :</b> ${data.salesprice }</font>
								</div>
								<div class="bookInfo" style="width: 750px; height: 30px; padding-top: 15px; padding-left: 20px;">
									<p align="left"><font size="6em"><b>도서 규격 : </b></font>
									<font size="3em">
											${data.bpages }&nbsp;(쪽) |&nbsp;&nbsp; ${data.bweight }&nbsp;(g) |&nbsp;&nbsp; ${data.bwidth } * ${data.bvertical } * ${data.bheight }&nbsp;(mm)
									</font>
								</div>		
								<div class="catego" style="width: 750px; height: 30px; padding-top: 15px; padding-left: 20px;">
									<p align="left"><font size="6em"><b>카테고리 : </b> </font>
									<div class="cateInfo" style="width: 750px; height: 30px; padding-top: 5px; padding-left: 20px;">
										<font size="3em">
											<c:forEach items="${list }" var="cate">
											<c:if test="${data.classify eq 0}">국내도서 ></c:if>
				         					<c:if test="${data.classify eq 1}">국외도서 ></c:if>
							         		&nbsp;&nbsp;${cate.parentname} >	
						         			${cate.bcategoryname }<br>
						         		</c:forEach>
										</font>
									</div>
								</div>
									
								</div><div style="clear:both;"></div>
								<div class="bintroduce">
									<p><h3>도서 소개</h3><hr>
										${data.bintroduce }
								</div>
								<div class="bindex" style="padding-top: 10px;">
									<p><h3>도서 목차</h3><hr>
										${data.bindex }
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