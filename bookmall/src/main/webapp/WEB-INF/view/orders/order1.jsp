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
		
		<!-- 주소검색 -->
		<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
	    function zipcode() {
	        new daum.Postcode({
	            oncomplete: function(data) {
	                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	
	                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                var addr = ''; // 주소 변수
	                var extraAddr = ''; // 참고항목 변수
	
	                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                    addr = data.roadAddress;
	                } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                    addr = data.jibunAddress;
	                }
	
	                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
	                if(data.userSelectedType === 'R'){
	                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                        extraAddr += data.bname;
	                    }
	                    // 건물명이 있고, 공동주택일 경우 추가한다.
	                    if(data.buildingName !== '' && data.apartment === 'Y'){
	                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                    }
	                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                    if(extraAddr !== ''){
	                        extraAddr = ' (' + extraAddr + ')';
	                    }
	                    addr += extraAddr; // 하나의 변수에 합치기
	                    // 조합된 참고항목을 해당 필드에 넣는다.
	                    //document.getElementById("sample6_extraAddress").value = extraAddr;
	                
	                }
	
	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                document.getElementById('zipcode').value = data.zonecode; // 우편번호
	                document.getElementById("addr2").value = addr; // 주소
	                // 커서를 상세주소 필드로 이동한다.
	                document.getElementById("addr3").focus();
	            }
	        }).open();
	    }
	    
	    
	    </script>
	    <script>
		    $(function(){
			$('#uinfo1').click(function(){
				custF.name.value="${loginUser.name}" 김한나;
				custF.tel1.value="${loginUser.tel1}" 010;
				custF.tel2.value="${loginUser.tel2}" 9632;
				custF.tel3.value="${loginUser.tel3}" 5543;
				custF.zipcode.value="${loginUser.zipcode}" 21004;
				custF.addr1.value="${loginUser.addr1}" 인천 황어로115번길;
				custF.addr2.value="${loginUser.addr2}" xx동 xxx호;
			});
			$('#uinfo2').click(function(){
				custF.name.value="";
				custF.tel1.value="";
				custF.tel2.value="";
				custF.tel3.value="";
				custF.zipcode.value="";
				custF.addr1.value="";
				custF.addr2.value="";
			});
			$('#uinfo3').click(function(){
				custF.name.value="";
				custF.tel1.value="";
				custF.tel2.value="";
				custF.tel3.value="";
				custF.zipcode.value="";
				custF.addr1.value="";
				custF.addr2.value="";
			});
		});
	    </script>
	    
	    
	    
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
<form name="custF" action=""><!-- method="POST" -->
	<div class="wrap_orders">
		<%@ include file="/WEB-INF/view/include/header.jsp"%>
		<div class="container" align="center">
			<div class="size">
            	<div class="text">
					<div class="col-md-7 offset-md-1" align="center">
						<h1 class="text-primary text-center mt-4">${loginUser.name}[ 김한나${loginUser.userid} ]님의 주문정보</h1>
					</div>
					<br><br>
					<p>▶ 주문 상품 정보</p><br>

					<!--상품리스트-->
					<div class="list">
						<table style="width: 1200px; border:1px solid #d3d3d3;">
							<tr>
								<td align="center" width="86" height="28"  bgcolor="#f4f4f4" class="popup">Thanks to</td>
								<td align="center"  bgcolor="#f4f4f4" class="popup">상품명</td>              
								<td align="center" width="138"  bgcolor="#f4f4f4" class="popup">가격</td>    
								<td align="center" width="74"  bgcolor="#f4f4f4" class="popup">수량</td>      
							</tr>
			
							<tr>
								<td height="28" align="center" bgcolor="#FFFFFF"><img src="/bookmall/img/thanks_b.gif"></td>
								<td bgcolor="#FFFFFF" style="padding-left: 8px" align="center"><a href="" target="_blank">검은 황무지</a></td>  <!-- product -->
								<td align="center" bgcolor="#FFFFFF">13,500원 / 750원</td>  <!-- price -->
								<td align="center" bgcolor="#FFFFFF">1</td>   <!-- count -->
							</tr>
						</table>
					</div>
					
					<!--예상총액/장바구니 이동버튼-->
					<table style="margin-left: auto; margin-right: auto; width: 1200px;">
						<tr>
							<td valign="top" style="padding-top: 8px"><strong>총 결제 예상 금액 : <font color="#cc3333">13,500 원 ${totalBuy}</font></strong>   <!-- total_price -->
						</tr>
						<tr>
							<td align="right" style="padding-top: 5px;">
								<a href=""  style="border:1px solid #d3d3d3;"><strong>장바구니로 돌아가기</strong></a>
							</td>
						</tr>
					</table>
				</div>	
					<br><br>
					<!--배송지 정보 입력-->
					<table style="margin-left: auto; margin-right: auto; width: 1200px;">
						<tr>
						      <td> ▶ 배송지 정보 입력<font color="#f2291f">(*필수 입력 항목)</font></td>
						</tr>
					</table>
					<table style="width:100px; align:center; border:0; " ><tr><td><div id="AddressBook" align=center style="margin:30px 0px 0px 330px;position:absolute; vertical-align:top;"></div></td></tr></table>
							<table style="cellSpacing:1; cellPadding:3; width:1200px; bgColor:#83b8c2; border:0; align:center; border:1px solid #d3d3d3 ; " >
								<tr>
									<td class="popup" align="left" width="23%" bgColor="#edf5fc" style="padding-left:14px;">배송지 선택</td>
									<td bgColor="#ffffff">
							            <input type="radio" name="info" id="uinfo1" value="1" checked>주문고객 정보와 동일
							            <input type="radio" name="info" id="uinfo2" value="2">배송주소록에서 선택
							            <input type="radio" name="info" id="uinfo2" value="3">새주소 입력
									</td>
								</tr>
								<tr>
									<td class="popup" align="left" width="23%" bgColor="#edf5fc" style="padding-left:14px;"><SPAN class="warning">* </SPAN>주문인</td>
									<td bgColor="#ffffff">
									    <input type="text" name="name" class="form" value='${loginUser.name}' maxlength="20" /><!-- name -->
									</td>
								</tr>
								<tr>
									<td class="popup" align="left" width="23%" bgColor="#edf5fc" style="padding-left:14px;"><SPAN class="warning">* </SPAN>받으시는 분</td>
									<td bgColor="#ffffff"><INPUT class=form type=text maxLength=20 value="${receiver_name}" name=receiver_name>	 <!-- receiver_name -->
									</td>
								</tr>
								<tr>
		                        	<td rowspan="3" class="popup" align="left" width="23%" bgColor="#edf5fc" style="padding-left:14px;"><SPAN class="warning">* </SPAN>주소</td>
		                        	<td>
		                        		<input type="text" name="zipcode" id="zipcode" class="inNextBtn" value="${loginUser.zipcode}" style="float:left;">
		                                <span class="addr_check"><a href="javascript:zipcode();" class="btn bgGray" style="float:left; width:auto; clear:none; border:1px solid #d3d3d3;">주소검색</a></span>   <!-- address1 -->
		                        	</td>
		                        </tr>
		                        <tr>
		                        	<td>
		                        		<input type="text" name="addr1" id="addr1"  value="${loginUser.addr1}" style="float:left;width:500px;">  <!-- address2 -->
		                        	</td>
		                        </tr>
		                        <tr>
		                        	<td>
		                        		<input type="text" name="addr2" id="addr2"  value="${loginUser.addr2}" style="float:left;width:500px;">   <!-- address3 -->
		                        	</td>
		                        </tr>
								<tr>
									<td class="popup" align="left" width="23%" bgColor="#edf5fc" style="padding-left:14px;"><SPAN class="warning">* </SPAN>휴대전화번호</TD> <!-- receiver_phone -->
									<td bgColor="#ffffff">
										<input type="text" name="tel1" value="${loginUser.tel1}"  size="3" maxlength="3" />
														- <input type="text" name="tel2" value="${loginUser.tel2}" size="4" maxlength="4" />
														- <input type="text" name="tel3" value="${loginUser.tel3}" size="4" maxlength="4" />
									</td>
								</tr>
						</table>
						<br><br><br>	
					</div>	
				</div>
				<!-- 결제수단 -->
						<table style="margin-left: auto; margin-right: auto; width: 1200px;">
							<tr>
							    <td>▶ 결제 수단 선택</td>
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
						<br><br>
						
						<div class="button" align="center">
							<a href="/bookmall/order2.do"><button style="font-size:18px; background-color: #d3d3d3;">결제하기</button></a>
						</div>
			</div>
	</form>
		 <%@ include file="/WEB-INF/view/include/footer.jsp" %>
</body>
</html>