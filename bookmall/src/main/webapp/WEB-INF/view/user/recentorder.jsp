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
		
		
		$(".date7").click(function() {
			var date = new Date();
	        var today = date.getFullYear() + "-" + ("0" + (date.getMonth()+1)).slice(-2) + "-" + ("0" + date.getDate()).slice(-2);
	        var date2 = date.getTime() - (7 * 24 * 60 * 60 * 1000);
            date.setTime(date2);
            var result = date.getFullYear() + "-" + ("0" + (date.getMonth()+1)).slice(-2) + "-" + ("0" + date.getDate()).slice(-2);
            $("#startDate").val(result);
            $("#endDate").val(today);
		})
		$(".dateM1").click(function() {
			var date = new Date();
	        var today = date.getFullYear() + "-" + ("0" + (date.getMonth()+1)).slice(-2) + "-" + ("0" + date.getDate()).slice(-2);
	        var date3 = date.getTime() - (30 * 24 * 60 * 60 * 1000);
            date.setTime(date3);
            var result = date.getFullYear() + "-" + ("0" + (date.getMonth()+1)).slice(-2) + "-" + ("0" + date.getDate()).slice(-2);
            $("#startDate").val(result);
            $("#endDate").val(today);
		})
		$(".dateM3").click(function() {
			var date = new Date();
	        var today = date.getFullYear() + "-" + ("0" + (date.getMonth()+1)).slice(-2) + "-" + ("0" + date.getDate()).slice(-2);
	        var date4 = date.getTime() - (60 * 24 * 60 * 60 * 1000);
            date.setTime(date4);
            var result = date.getFullYear() + "-" + ("0" + (date.getMonth()+1)).slice(-2) + "-" + ("0" + date.getDate()).slice(-2);
            $("#startDate").val(result);
            $("#endDate").val(today);
		})
		$(".dateM6").click(function() {
			var date = new Date();
	        var today = date.getFullYear() + "-" + ("0" + (date.getMonth()+1)).slice(-2) + "-" + ("0" + date.getDate()).slice(-2);
	        var date5 = date.getTime() - (180 * 24 * 60 * 60 * 1000);
            date.setTime(date5);
            var result = date.getFullYear() + "-" + ("0" + (date.getMonth()+1)).slice(-2) + "-" + ("0" + date.getDate()).slice(-2);
            $("#startDate").val(result);
            $("#endDate").val(today);
		})
	});
</script>

</head>
<body>
<div class="wrap">
	<%@ include file="/WEB-INF/view/include/header.jsp"%>
<div class="sub">
	<div class="sub_visual">
		<div class="slogan">${userInfo.name }?????? ??????????????????</div>
		<br> <br>
	</div>
	<div class="size">
	<form name="searchForm" id="searchForm" action="recentorder.do"  method="get">
		<div class="calendar">
			????????? 1?????? ??????????????? ???????????? ??? ????????????.<br> <br>
			<div class="underClendar">
				<input type="button" name="order_date" class="date7" value="??????1??????">
				<input type="button" name="order_date" class="dateM1" value="?????? 1??????">
				<input type="button" name="order_date" class="dateM3" value="?????? 3??????">
				<input type="button" name="order_date" class="dateM6" value="?????? 6??????">
				&nbsp;&nbsp;
			<%-- ?????? ?????????????????? --%> 
			<th><input id="startDate" name="startDate" type="date" value="${param.startDate }"></th>
			 ~ 
			 <%-- ?????? ????????????????????? --%>
			 <th><input id="endDate" name="endDate" type="date" value="${param.endDate }"></th>
			</div><br>
			<div class=findorder>
				<td><select name="searchType" id="searchType" style="width: 100px; height: 35px; ">
						<option value="receiver_name" <c:if test="${param.searchType=='receiver_name'}">selected</c:if>>?????????</option>
						<option value="receiver_phone" <c:if test="${param.searchType=='receiver_phone'}">selected</c:if>>?????????</option>
					</select> 
					<input id="searchWord" type="text" name="searchWord" value="${param.searchWord }"style=" width:300px; height:35px;">
					<input type="submit" value="??????" style=" width:100px; height:32px; ">
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
									<th scope="col" width="100px">????????????</th>
									<th scope="col" width="100px">??????</th>
									<th scope="col" width="300px">????????????</th>
									<th scope="col" width="100px">?????????</th>
									<th scope="col" width="300px">????????????</th>
									<th scope="col" width="100px">?????????</th>
									<th scope="col" width="100px">????????????</th>
									<th scope="col" width="100px">?????????</th>
									<th scope="col" width="100px"></th>
								</tr>
							</thead>
								<c:if test="${recentOrderInfo eq null or empty recentOrderInfo}">
									<td colspan="9"><center><b>?????? ??????????????? ????????????.</b></center></td>
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
												<a class="btn" href="/bookmall/refund/exchange.do?orderno=${recentOrder.orderno }" style="cursor: pointer;">??????/??????</a><br><br>
												<a class="btn" href="/bookmall/refund/refund.do?orderno=${recentOrder.orderno }" style="cursor: pointer;">??????/??????</a></td>
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