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
		<script type="text/javascript">
			$(function(){
				$('#card').prop("disabled", true);
				$('#bank').prop("disabled", false);
			});
			<!-- 결제수단 -->
			function showSelect(pay){
				//alert(pay);
				
				if(pay=='100'){
					//무통장 입금
					$('#c1').show();
					$('#c2').hide();
					$('#c3').hide();
					$('#bank').prop("disabled", false);//은행이 서버로 넘어가도록
					$('#card').prop("disabled", true);
					$('#NPay').prop("disabled", true);
				}else if(pay=='200'){
					//카드결제
					$('#c1').hide();
					$('#c2').show();
					$('#c3').hide();
					$('#bank').prop("disabled", true);
					$('#card').prop("disabled", false);//카드가 서버로 넘어가도록
					$('#NPay').prop("disabled", true);
				}else if(pay=='300'){
					//네이버페이결제
					$('#c1').hide();
					$('#c2').hide();
					$('#c3').show();
					$('#bank').prop("disabled", true);
					$('#card').prop("disabled", true);
					$('#NPay').prop("disabled", false);//네이버페이가 서버로 넘어가도록
				}
				
			}
		</script>
</head>

<body>
<form name="custF"><!-- method="POST" -->
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
								<td align="left" width="77%" bgColor="#ffffff" style="padding-left:14px;">13,320원 ${totalBuy}원</td>	 <!--  -->
							</tr>
							<tr>
								<td class="popup" align="left" width="23%" style="padding-left:14px;"><SPAN class="warning"></SPAN>배송료</td>
								<td align="left" width="77%" bgColor="#ffffff" style="padding-left:14px;">0원</td>	 <!--  -->
							</tr>
							<tr>
								<td class="popup" align="left" width="23%" bgColor="#edf5fc" style="padding-left:14px;"><SPAN class="warning"></SPAN>결제 총액</td>
								<td align="left" width="77%" bgColor="#edf5fc" style="padding-left:14px;" >13,320원 ${totalBuy}원</td>	 <!--  -->
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
						<!-- 결제수단 -->
						<table style="margin-left: auto; margin-right: auto; width: 1200px;">
							<tr>
							    <td>■ 결제 수단 선택</td>
							</tr>
						</table>	
						<table style="margin-left: auto; margin-right: auto; width: 1200px; border:1px solid #d3d3d3 ;">
							<tr>
								<td bgColor="#ffffff">
						            <input type="radio" name="opayWay" checked value="100" onclick="showSelect(this.value)">무통장 입금
									<input type="radio" name="opayWay" value="200"  onclick="showSelect(this.value)">신용 카드
									<input type="radio" name="opayWay" value="300"  onclick="showSelect(this.value)">N Pay
									
									<span id="c1">
										<select name="bank" id="bank">
											<option value="1">국민</option>
											<option value="2">우리</option>
											<option value="3">신한</option>
										</select>
									</span>
									<span id="c2" style="display:none">
										<select name="card" id="card">
											<option value="1">국민카드</option>
											<option value="2">BC카드</option>
											<option value="3">현대카드</option>
											<option value="4">농협카드</option>
										</select>
									</span>
									<span id="c3" style="display:none">
										<select name="NPay" id="NPay">
											<option value="1">N Pay</option>
										</select>
									</span>
								</td>
							</tr>		
						</table>
					</div>
				</div>
			</div>
		</div>					
	</div>	
	</form>
		 <%@ include file="/WEB-INF/view/include/footer.jsp" %>
</body>
</html>