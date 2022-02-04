<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>주소록</title>
<link rel="stylesheet"
	href="https://unpkg.com/swiper/swiper-bundle.min.css" />
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
<link rel="stylesheet" href="/bookmall/css/order.css" />
<link rel="stylesheet" href="/bookmall/css/com.css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
<script src="/bookmall/js/common.js"></script>
<script src="http://code.jquery.com/jquery-1.12.0.min.js"></script>

<link
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/3.0.0/css/bootstrap-datetimepicker.min.css"
	rel="stylesheet" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.8.2/moment-with-locales.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/3.0.0/js/bootstrap-datetimepicker.min.js"></script>

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
		if (confirm('선택하신 주소를 삭제하시겠습니까?')) {
			$.ajax({
				type : 'post',
				url : '/bookmall/addr/deleteAjax.do', // <<-- 처리 요청 URL
				data : $("#addspace").serialize(),
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
				<div class="slogan" style="font-size: 20px;">
					<b>${userInfo.name } 님의 주소록</b>
				</div>
				<br> <br>
			</div>
			<div class="size">
				<div align="center">
					<hr color="#d3d3d3" width="100%">
					<h2>나의 주소록</h2>
					<hr color="#d3d3d3" width="100%">
				</div>
				<table class="type">
					<colgroup>
						<col width="50px" />
						<col width="200px" />
						<col width="200px" />
						<col width="600px" />
						<col width="200px" />
						<col width="100px" />
						<col width="*" />
					</colgroup>
					<tr>
							<th></th>
							<th>별칭</th>
							<th>수령인</th>
							<th>주소</th>
							<th>전화번호</th>
							<th>수정</th>
					</tr>
					<tbody>
						<form name="addspace" id="addspace">
							<td></td>
							<td><b>기본주소</b></td>
							<td><b>${userInfo.name }</b></td>
							<td><b>${userInfo.zipcode } 
							<p>${userInfo.addr1}${userInfo.addr2}</p></b></td>
							<td><b>${userInfo.tel }</b></td>
							<td></td>
								<c:forEach var="addBook" items="${addBook}">
									<tr class="board_tr" data-addno="${addBook.addno}"
										style="cursor: pointer; ">
										<tr style="font-size: 15px; height: 60px; ">
										<td><input type="checkbox" name="addno" id="check"value="${addBook.addno }"/></td>
										<td>${addBook.division}</td>
										<td>${addBook.name }</td>
										<td>
											<p>${addBook.zipcode}</p>
											<p>${addBook.address} ${addBook.address2}</p>
										</td>
										<td>${addBook.tel1} - ${addBook.tel2 } - ${addBook.tel3 }</td>
										<td >
										<a href="javascript:void(window.open('http://localhost:8080/bookmall/addr/view.do?addno=${addBook.addno }', '주소수정','width=800px, height=500px'))">수정</a> 
										</td>
									</tr>
								</c:forEach>
						</form>
					</tbody>
				</table>
				<a href="javascript:;" class="deleteClick"style="cursor: pointer; font-weight: bold;">&nbsp;&nbsp;&nbsp;삭제</a>
                <div class="request" style="text-align: right;">
		        <a href="write.do" style="font-size: 15px; font-weight: bold; "> +새 주소 등록</a>
		        </div>
		</div>
	</div>
</div>
<%@ include file="/WEB-INF/view/include/footer.jsp"%>
</body>
</html>