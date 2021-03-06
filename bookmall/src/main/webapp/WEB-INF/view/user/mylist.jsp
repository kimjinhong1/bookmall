<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link rel="stylesheet"
	href="https://unpkg.com/swiper/swiper-bundle.min.css" />
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
<link rel="stylesheet" href="/bookmall/css/com.css" />
<link rel="stylesheet" href="/bookmall/css/sub.css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
<script src="/bookmall/js/common.js"></script>
<script>
	
</script>
<script>
	$(function() {
		//체크박스 전체 선택&해제
		$('#ck_all').click(function() {
			if ($("#ck_all").prop("checked")) {
				$("input[type=checkbox]").prop("checked", true);
			} else {
				$("input[type=checkbox]").prop("checked", false);
			}
		});

		// 삭제
		$(".deleteClick").on('click', function() {
			if (confirm('선택하신 상품을 삭제하시겠습니까?')) {
				$.ajax({
					type : 'post',
					url : '/bookmall/mylist/deleteAjax.do', // <<-- 처리 요청 URL
					data : $("#listspace").serialize(),
					success : function(res) { // 비동기요청  성공시
						alert('총 ' + res.trim() + "건이 삭제되었습니다.");
						location.reload(); // 페이지 새로고침
					}
				});
			}
		});
	});

</script>
</head>
<body>
	<div class="wrap">
		<%@ include file="/WEB-INF/view/include/header.jsp"%>
		<div class="sub">
			<div class="sub_visual">
				<div class="slogan">마이리스트</div>
			</div>
			<div class="size">
				<div class="box">
					<table class="type2">
						<colgroup>
							<col width="100px" />
							<col width="100px" />
							<col width="100px" />
							<col width="600px" />
							<col width="100px" />
							<col width="100px" />
						</colgroup>
						<thead>
							<tr>
								<th>선택</th>
								<th>상품번호</th>
								<th>상품</th>
								<th>상세정보</th>
								<th>등록일</th>
								<th></th>
							</tr>
						</thead>
						<c:if test="${empty dibsList }">
							<tr>
								<td class="first" colspan="8">MyList에 담긴품목이 없습니다.</td>
							</tr>
						</c:if>
						<form name="listspace" id="listspace">
							 <c:if test="${!empty dibsList }">
								<c:forEach var="mylist" items="${dibsList}">
									<thead>
										<tr>
											<td><label> <input type="checkbox"name="listno" value="${mylist.listno }"><br></label></td>
											<td>${mylist.bookno}</td>
											<td>
											<img src=" /bookmall/img/${mylist.bthumb_org}" class="img-thumbnail" style="width: 100px; "><br></td>
											<td>
											<b>${mylist.btitle_first } </b><br>
											${mylist.btitle_second }<br>
											${mylist.author} / ${mylist.publisher}
											</td>
											<td>
											<fmt:formatDate value="${mylist.regdate }" pattern="yyyy-MM-dd" />
											</td>
											<td>
												<b><a href="/bookmall/book/detail.do?bookno=${mylist.bookno }">상품 상세보기</a></b>
											</td>
										</tr>
									</thead>
								</c:forEach>
							</c:if>
						</form>
					</table>
				</div>
			</div>
		</div>
	</div>
	<div class="container">
		<div class="btnSet clear" style="text-align: left;">
			<input type="checkbox" id="ck_all" value="전체선택"> <span
				style="background-color: white; border: none; font-size: 16px; font-weight: bold;">전체선택</span>&emsp;
			<a href="javascript:;" class="deleteClick"
				style="cursor: pointer; font-weight: bold;">삭제</a>
		</div>
	</div>
	<br />
	<%@ include file="/WEB-INF/view/include/footer.jsp"%>

</body>
</html>