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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
<script src="/bookmall/js/orders.js"></script>
<script src="/bookmall/js/main.js"></script>

</head>

<body>
<form name="custF"><!-- method="POST" -->
		<%@ include file="/WEB-INF/view/include/header.jsp"%>
		<div class="wrap_orders">
		<div class="container" align="center">
			<div class="size">
            	<div class="text">
					<div class="col-md-7 offset-md-1" align="center">
						<h1 class="text-primary text-center mt-4">주문이 <span style="color: red;">완료</span> 되었습니다.</h1>
					</div>
					<br><br>
						<div align="center">
					<!-- 주문 완료 -->
							<table  style="width:800px; border:1px solid #d3d3d3;  align:center;"  >
								<tr>
									<td align="left" width="23%" bgColor="#edf5fc" style="padding-left:14px;" >주문번호</td>
									<td bgColor="#ffffff" >${s.orderno}
									</td>
								</tr>
								<tr>
									<td align="left" width="23%" bgColor="#edf5fc" style="padding-left:14px;" >주문 접수일</td>
									<td bgColor="#ffffff">${s} 2021년 12월 25일 토요일 16시 19분
									</td>
								</tr>
								<tr>
									<td align="left" width="23%" bgColor="#edf5fc" style="padding-left:14px;" >배송주소</td>
									<td bgColor="#ffffff">${loginUser.addr1}
									</td>
								</tr>
								<tr>
									<td class="popup" align="left" width="23%" bgColor="#edf5fc" style="padding-left: 14px;"><SPAN class="warning">*</SPAN>휴대전화번호</TD> <!-- receiver_phone -->
									<td bgColor="#ffffff"><input type="text" name="receiver_phone" id="receiver_phone" value="${loginUser.tel}" size="15" maxlength="15" /></td>
								</tr>
								<tr>
									<td align="left" width="23%" bgColor="#edf5fc" style="padding-left:14px;" >결제 수단</td>
									<td bgColor="#ffffff" >${s} 신용카드(삼성카드)
									</td>
								</tr>
								</table>
							</div>
							
							
						<br><br><br>	
						
						
						 <!-- 버튼 -->
	                	<div class="btnSet" align="center">
	                            	<a href="main.do" class="btn" style="font-size:18px; background-color: #fff; border:1px solid #d3d3d3;">홈으로 가기</a>
	                            </div>
	                        </div>
						</div>	
				</div>
				</div>
	</form>
		 <%@ include file="/WEB-INF/view/include/footer2.jsp" %>
</body>
</html>