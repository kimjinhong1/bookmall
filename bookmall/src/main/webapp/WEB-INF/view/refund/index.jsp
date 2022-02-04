<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<link rel="stylesheet" href="/bookmall/css/contents.css" />
<link rel="stylesheet" href="/bookmall/css/exchange.css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
<script src="/bookmall/js/common.js"></script>
</head>
<body>
	<div class="wrap">
		<%@ include file="/WEB-INF/view/include/header.jsp"%>

		<!-- board area -->
		<div class="sub">
			<div class="size">
				<h3 class="sub_title">${userInfo.name }님의&nbsp; 반품/교환내역</h3>
				<div class="bbs">
					<table class="list">
						<colgroup>
							<col width="100px" />
							<col width="100px" />
							<col width="300px" />
							<col width="300px" />
							<col width="100px" />
							<col width="100px" />
							<col width="100px" />
						</colgroup>
						<thead>
							<tr>
								<th>주문번호</th>
								<th>구분</th>
								<th>사유</th>
								<th>회송정보 / 연락처</th>
								<th>결제정보</th>
								<th>일시</th>
								<th>상태</th>
							</tr>
						</thead>
						<tbody>
							<c:if test="${empty refundList }">
								<tr>
									<td class="first" colspan="10">내역이 없습니다.</td>
								</tr>
							</c:if>
							<form name="refundspace" id="refundspace">
								<c:if test="${!empty refundList  }">
									<c:forEach var="refund" items="${refundList}">
										<thead>
											<td>${refund.orderno}</td>
											<td>
												<b>
													<c:if test="${refund.pick == 7}">취소</c:if>
													<c:if test="${refund.pick == 9}">반품</c:if>
													<c:if test="${refund.pick == 11}">교환</c:if>
													<c:if test="${refund.pick == 13}">환불</c:if>
												</b> <br>${refund.division}</td>
											<td>${refund.reason}</td>
											<td><b>${refund.receiver_name } </b><br>
												${refund.zipcode }<br> ${refund.addr1} ${refund.addr2}<br>
												${refund.tel1}- ${refund.tel2} - ${refund.tel3}
											</td>
											<td>${refund.creditCard }<br>
												<fmt:formatNumber value="${refund.paid_amount }" pattern="###,###" />원
											</td>
											<td>
												결제일시<br><fmt:formatDate value="${refund.order_date }" pattern="yyyy-MM-dd" /><br><br>
												신청일시<br><fmt:formatDate value="${refund.regdate }" pattern="yyyy-MM-dd" /></td>
											<td><c:if test="${refund.pick == 7}">취소신청완료</c:if>
												<c:if test="${refund.pick == 9}">반품신청완료</c:if>
												<c:if test="${refund.pick == 11}">교환신청완료</c:if>
												<c:if test="${refund.pick == 13}">환불신청완료</c:if></td>
										</thead>
									</c:forEach>
								</c:if>
							</form>
						</tbody>
					</table>
					<!-- 페이징 처리 -->
					${pageArea }
					<!-- //페이징 처리 -->
					<div class="request" style="text-align: right;"></div>
				</div>
			</div>
		</div>
	</div>
	<!-- board area -->
	<%@ include file="/WEB-INF/view/include/footer.jsp"%>
	</div>
</body>
</html>