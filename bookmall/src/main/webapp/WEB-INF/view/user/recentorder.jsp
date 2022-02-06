<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link href="<%=request.getContextPath()%>/css/admin/member.css" rel="stylesheet" type="text/css"/>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>recentorder</title>
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
		$("#spreadBtn02").click(function() {
			if ($("#hiddenList01").is(":visible")) {
				$("#hiddenList01").slideUp();
			} else {
				$("#hiddenList01").slideDown();
			}
		});
		//선언한 TextBox에 DateTimePicker 위젯을 적용
		$('#fromDate').datetimepicker({
			language : 'ko', // 화면에 출력될 언어를 한국어로 설정
			pickTime : true, // 사용자로부터 시간 선택을 허용하려면 true를 설정하거나 pickTime 옵션 생략
			defalutDate : NOW()
		// 기본값으로 오늘 날짜를 입력한다. 기본값을 해제하려면 defaultDate 옵션 생략
		});

		$('#toDate').datetimepicker({
			language : 'ko',
			pickTime : true,
			defalutDate : new Date()
		// 기본값으로 오늘 날짜를 입력한다. 기본값을 해제하려면 defaultDate 옵션 생략
		});
		
	});
</script>

</head>
<body>
<div class="wrap">
	<%@ include file="/WEB-INF/view/include/header.jsp"%>
<div class="sub">
	<div class="sub_visual">
		<div class="slogan">${userInfo.name }님의 최근주문내역</div>
		<br> <br>
	</div>
	<div class="size">
	<form name="searchForm" id="searchForm" action="recentorder.do"  method="get">
		<div class="calendar">
			※최근 1년간 주문내역을 조회하실 수 있습니다.<br> <br>
			<div class="underClendar">
			
				<button name="search" class="date_range d-7" onclick="javascript:changeDt(7,0)"><span>최근1주일</span></button>
				<button name="search" class="date_range m-1" onclick="javascript:changeDt(30,0)"><span>1개월</span></button>
				<button name="search" class="date_range m-3" onclick="javascript:changeDt(60,0)"><span>3개월</span></button>
				<button name="search" class="date_range m-6" onclick="javascript:changeDt(180,0)"><span>6개월</span></button>
				
				&nbsp;&nbsp;

			<%-- 검색 시작날짜선택 --%> 				
			<th><input id="startDate" type="date"></th>
			
			 ~ 
			 <%-- 검색 마지막날짜선택 --%>
			 <th><input id="endDate" type="date"></th>
			
			</div><br>
			<div class=findorder>
				<td><select name="searchType" id="searchType" style="width: 100px; height: 35px; ">
						<option value="receiver_name" <c:if test="${param.searchType=='receiver_name'}">selected</c:if>>수령인</option>
						<option value="receiver_phone" <c:if test="${param.searchType=='receiver_phone'}">selected</c:if>>연락처</option>
					</select> 
					<input id="searchWord" type="text" name="searchWord" value="${param.searchWord }"style=" width:300px; height:35px;">
					<input type="submit" value="검색" style=" width:100px; height:32px; ">
				</td>
			</div>
		</div>
		</form>
				<div class="box">
					<p class="title">
					<div class="text"></div>
					<table class="type">
						<tbody>
							<thead>
								<tr>
									<th scope="col" width="100px">주문번호</th>
									<th scope="col" width="100px">상품</th>
									<th scope="col" width="300px">상품정보</th>
									<th scope="col" width="100px">수령인</th>
									<th scope="col" width="300px">배송주소</th>
									<th scope="col" width="100px">연락처</th>
									<th scope="col" width="100px">결제금액</th>
									<th scope="col" width="100px">결제일</th>
									<th scope="col" width="100px"></th>
								</tr>
							</thead>
								<c:if test="${recentOrderInfo eq null or empty recentOrderInfo}">
									<td colspan="9"><center><b>최근 주문내역이 없습니다.</b></center></td>
								</c:if>
								<tr>
									<c:if test="${recentOrderInfo ne null and not empty recentOrderInfo}">
										<c:forEach var="recentOrder" items="${recentOrderInfo}">
										<thead>
											<td>${recentOrder.orderno}</td>
											<td><img src="/bookmall/img/book_1.png" width="50"></td>
											<td>${recentOrder.btitle_first }<br>
												${recentOrder.btitle_second }<br> 
												${recentOrder.author } | ${recentOrder.publisher}
											</td>
											<td>${recentOrder.receiver_name}</td>
											<td>${recentOrder.zipcode}<br>
												${recentOrder.addr1}<br>
												${recentOrder.addr2}
											</td>
											<td>${recentOrder.receiver_phone}</td>
											<td><fmt:formatNumber value="${recentOrder.paid_amount}" pattern="###,###" /></td>
											<td><fmt:formatDate value="${recentOrder.order_date}" pattern="yyyy-MM-dd" /></td>
											<td>
												<a class="btn" href="/bookmall/refund/exchange.do?orderno=${recentOrder.orderno }" style="cursor: pointer;">반품/교환</a><br><br>
												<a class="btn" href="/bookmall/refund/refund.do?orderno=${recentOrder.orderno }" style="cursor: pointer;">취소/환불</a></td>
										</thead>
										</c:forEach>
									</c:if>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
<%@ include file="/WEB-INF/view/include/footer.jsp"%>
</body>
</html>