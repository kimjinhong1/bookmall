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
		<script type="text/javascript">
        <!-- netfunnel 완료 처리 -->
            window.onload = function () {
                NetFunnel_Complete();
            };

            function frmSubmit_Standby() {
                
                frmSubmit();
                
                return false;
            }
        </script>
        
        <script type='text/javascript'>
				$j(document).ready(function() {
					if (window.gtag) {
						gtag('event', "checkout_progress", {
							"event_label" : "order_step1",
							"items" : [ {
								"id" : "P284697729",
								"name" : "검은 황무지",
								"category" : "소설/시/희곡",
								"brand" : "네버모어",
								"variant" : "K612835924",
								"list_position" : 1,
								"quantity" : 1,
								"price" : '13500'
							},

							]
						});
					}
				});
			</script>
		<style type="text/css">
		    label { cursor:pointer; }
		</style>
		
	
</head>

<body>
	<div class="wrap_orders">
		<%@ include file="/WEB-INF/view/include/header.jsp"%>
		<div class="container" align="center">
			<div class="size">
            	<div class="text">
            		<!--주문과정 Step2 -->
					<img src="/bookmall/img/order_step_t02.gif" width="1200px"><br>
					<!--결제 내역 확인-->
					<div class="list">
						<table style="margin-left: auto; margin-right: auto; width: 1200px;">
							<tr>
							      <td>■ 결제 내역 확인</td>
							</tr>
						</table>
					</div>
					<div>
						<table style="cellSpacing:1; cellPadding:3; width:1200px; bgColor:#83b8c2; border:0; align:center; border:1px solid #d3d3d3 ; ">
							<tr>
								<td class="popup" align="left" width="23%" bgColor="#edf5fc" style="padding-left:14px;"><SPAN class="warning"></SPAN>주문상품금액정보</td>
								<td align="left" width="77%" bgColor="#edf5fc" style="padding-left:14px;">총 1권(장), 13,320원</td>	 <!--  -->
							</tr>
							<tr>
								<td class="popup" align="left" width="23%" style="padding-left:14px;"><SPAN class="warning"></SPAN>상품 주문 총액</td>
								<td align="left" width="77%" bgColor="#ffffff" style="padding-left:14px;">13,320원</td>	 <!--  -->
							</tr>
							<tr>
								<td class="popup" align="left" width="23%" style="padding-left:14px;"><SPAN class="warning"></SPAN>배송료</td>
								<td align="left" width="77%" bgColor="#ffffff" style="padding-left:14px;">0원</td>	 <!--  -->
							</tr>
							<tr>
								<td class="popup" align="left" width="23%" bgColor="#edf5fc" style="padding-left:14px;"><SPAN class="warning"></SPAN>결제 총액</td>
								<td align="left" width="77%" bgColor="#edf5fc" style="padding-left:14px;">13,320원</td>	 <!--  -->
							</tr>
						</table>
						<div>
							<table>
								<tr>
									<td valign="top" style="padding-top: 2px; font-size:15px;">결제 총액 = 상품주문퐁액 + 배송료</td>
								</tr>	
							</table>
						</div>	
					</div>
					<br><br>
					<div>
						<table style="margin-left: auto; margin-right: auto; width: 1200px;">
							<tr>
							    <td>■ 결제 수단 선택</td>
							</tr>
						</table>	
						<table style="margin-left: auto; margin-right: auto; width: 1200px; border:1px solid #d3d3d3 ;">
							<tr>
								<td bgColor="#ffffff">
						            <input type=radio name="methodOfPayment" id="methodOfPayment1"  value="1" onclick=""><label for="methodOfPayment1">무통장 입금</label>
						            <input type=radio name="methodOfPayment" id="methodOfPayment2"  value="2" onclick=""><label for="methodOfPayment2">신용카드</label>
						            <input type=radio name="methodOfPayment" id="methodOfPayment3"  value="3" onclick=""><label for="methodOfPayment3">N Pay</label>
								</td>
							</tr>		
						</table>
					</div>
					
					
					
				</div>
			</div>
		</div>					
	</div>	
	<br><br><br>
	<div align="center">
		<hr style="border: solid 0.5px #d3d3d3; width: 1200px"   >
	</div>							
		 <%@ include file="/WEB-INF/view/include/footer.jsp" %>
</body>
</html>