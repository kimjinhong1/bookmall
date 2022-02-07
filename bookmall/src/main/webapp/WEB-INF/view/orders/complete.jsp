<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">  
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>BookMoll:주문하기</title>
<link rel="stylesheet" href="/bookmall/css/com.css" />
<link rel="stylesheet" href="/bookmall/css/orders.css" />

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script>
// 결제완료 후 "홈으로 가기" 버튼 클릭 시 결제상품 삭제
    $(".deleteClick").on('click', function() {
			$.ajax({
				type : 'post',
				url : '/bookmall/orders/deleteAjax.do', // <<-- 처리 요청 URL
				data : $("#cartspace").serialize(),
				success : function(res) { // 비동기요청  성공시
					location.reload(); // 페이지 새로고침
				}
			});
	});
</script>	
</head>
<body>
<form name=cartspace id="cartspace">
<div class="wrap">
	<%@ include file="/WEB-INF/view/include/header.jsp"%>
	<div class="orders">
		<div class="orders_visual">
			<h1 class="username">[${order.name}]님 주문이 <span>완료</span> 되었습니다.</h1>
		</div>	
		<div class="size2">
			<div class="box">
				<br><br>  
              		<!-- 결제 완료 정보 -->
                <table class="list2">
					<colgroup>
						<col width="300px" />
						<col width="900px" />
					</colgroup>
					<thead>
               			<tr>
							<th scope="row">주문 번호</th>
          						<td>${order.orderno}</td>
                 			</tr>
                 			<tr>
							<th scope="row">주문 접수일</th>
          						<td><fmt:formatDate value="${order.order_date}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
                 			</tr>
                 			<tr>
                 			<th scope="row">주문인(수령인)</th>
          						<td>${order.name}(${order.receiver_name})</td>
                 			</tr>
                 			<tr>
                 			<th scope="row">주문상품</th>
          						<td>${order.bookname}</td>
                 			</tr>
                 			<tr>
							<th scope="row">배송 주소</th>
          						<td>${order.addr1}(${order.addr2})</td>
                 			</tr>
						<c:if test="${order.methodOfPayment eq '무통장입금'}">
                  			<tr>
								<th scope="row">입금계좌번호</th>
           						<td>${order.bankToDeposit}</td>
                  			</tr>
                  			<tr>
								<th scope="row">입금자명</th>
           						<td>${order.nameOfDepositor}</td>
                  			</tr>
                  			<tr>
								<th scope="row">결제 예정 금액</th>
           						<td><fmt:formatNumber pattern="###,###,###" value="${order.paid_amount}" />원</td>
                  			</tr>
                 		</c:if>
                 		<c:if test="${order.methodOfPayment eq '신용카드'}">
							<tr>
								<th scope="row">결제 금액</th>
           						<td><fmt:formatNumber pattern="###,###,###" value="${order.paid_amount}" />원</td>
                  			</tr>
                  			<tr>
								<th scope="row">결제 방법</th>
           						<td>${order.methodOfPayment}(${order.creditCard })</td>
                  			</tr>
                 		</c:if>
		
					</thead>
				</table>
			</div>
		</div>
		<br><br>
		 <!-- 버튼 -->
          	<div class="oBtn">
          		<a href="main.do">홈으로 가기</a>
           	</div>			
     </div>
</div>	
</form>
		 <%@ include file="/WEB-INF/view/include/footer2.jsp" %>
</body>
</html>