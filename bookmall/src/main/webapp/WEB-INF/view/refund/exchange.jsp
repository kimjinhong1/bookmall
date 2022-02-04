<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>교환/반품</title>
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css" />
<link rel="stylesheet" href="/bookmall/css/reset.css" />
<link rel="stylesheet" href="/bookmall/css/com.css" />
<link rel="stylesheet" href="/bookmall/css/contents.css" />
<link rel="stylesheet" href="/bookmall/css/exchange.css" />

<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
<script type="text/javascript" src="/bookmall/smarteditor/js/HuskyEZCreator.js"></script>
<script src="/bookmall/js/common.js"></script>
<script src="https://malsup.github.io/jquery.form.js"></script> 
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	var oEditors;
	$(function() {
		oEditors = setEditor("reason");
		/*
		$("#frm").ajaxForm({
			url: '/bookmall/ask/askinsert.do', //<<-- 처리 요청 URL
			success: function(result){ // 비동기요청  성공시
				alert('문의내용이 등록되었습니다.');
			}
		});*/
	});
		
	function zipcode() {
		new daum.Postcode({
			oncomplete : function(data) {
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
				if (data.userSelectedType === 'R') {
					// 법정동명이 있을 경우 추가한다. (법정리는 제외)
					// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
					if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
						extraAddr += data.bname;
					}
					// 건물명이 있고, 공동주택일 경우 추가한다.
					if (data.buildingName !== '' && data.apartment === 'Y') {
						extraAddr += (extraAddr !== '' ? ', '
								+ data.buildingName : data.buildingName);
					}
					// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
					if (extraAddr !== '') {
						extraAddr = ' (' + extraAddr + ')';
					}
					addr += extraAddr; // 하나의 변수에 합치기
					// 조합된 참고항목을 해당 필드에 넣는다.
					//document.getElementById("sample6_extraAddress").value = extraAddr;

				}

				// 우편번호와 주소 정보를 해당 필드에 넣는다.
				document.getElementById('zipcode').value = data.zonecode; // 우편번호
				document.getElementById("addr1").value = addr; // 주소
				// 커서를 상세주소 필드로 이동한다.
				document.getElementById("addr2").focus();
			}
		}).open();
	}

	function goSave() {
		
		oEditors.getById['reason'].exec("UPDATE_CONTENTS_FIELD",[]);
		console.log($("#reason").val());
		if($("#reason").val() == '<p>&nbsp;</p>') {
				alert("내용을 입력하세요");
				$("#reason").focus();
				return;
		}
		
		if($("#receiver_name").val() == '') {
			alert("수령인을 입력하세요");
			$("#receiver_name").focus();
		return;
	}
		if($("#zipcode").val() == '') {
			alert("주소를 입력하세요");
			$("#zipcode").focus();
		return;
	}
		if($("#addr1").val() == '') {
			alert("주소를 입력하세요");
			$("#addr1").focus();
		return;
	}
		if($("#tel1").val() == '') {
			alert("휴대전화번호를 입력하세요");
			$("#tel1").focus();
		return;
	}
		if($("#tel2").val() == '') {
			alert("휴대전화번호를 입력하세요");
			$("#tel2").focus();
		return;
	}
		if($("#tel3").val() == '') {
			alert("휴대전화번호를 입력하세요");
			$("#tel3").focus();
		return;
	}

		$("#frm").submit();
	}


</script>
</head>
<body>
	<div class="wrap">
	<%@ include file="/WEB-INF/view/include/header.jsp"%>
		<div class="sub">
			<div class="sub_visual">
				<div class="slogan"> 상품 반품/교환 신청</div>
			</div>
			<div class="size">
				<div class="box">
						<form method="post" name="frm" id="frm" action="insertEx.do" enctype="multipart/form-data">
						 <input type="hidden" name="orderno"  value="${refundVo.orderno }">
						<div class="text"></div>
						|구분
						<table class="type">
							<thead>
								<tr>
									<th>
										<input type="radio" id="exchange" name="pick" value="9" checked ><label for ='exchange'>교환</label>
									</th>
									<th>
										<input type="radio" id="return" name="pick" value="11" ><label for ='return'>반품</label>
									</th>
									${refundData.pick }
									
								</tr>
							</thead>
						</table>
						<div class="text"></div>
						| 사유 선택
							<table class="type">
							<thead>
								<tr>
									<th><input type="radio" id="broken" name="division" value="상품파손" checked><label for = 'broken'>상품파손</label></th>
									<th><input type="radio" id="wrong" name="division" value="오배송"><label for ='wrong'>오배송</label></th>
									<th><input type="radio" id="change" name="division" value="단순변심"><label for ='change'>단순변심</label></th>
									<th><input type="radio" id="delay" name="division" value="배송지연"><label for ='delay'>배송지연</label></th>
									<th><input type="radio" id="defect" name="division" value="제작불량"><label for ='defect'>제작불량</label></th>
									${refundData.division }
								</tr>
							</thead>
							</table>
						<div class="text"></div>
						<table class="type"><br>
						| 사유 및 기타 메세지 입력<font size="2px;">*파본, 상품불량이나 반품/교환 사유에 대해 기입해주세요.</font>
								<tr>
									<td><textarea name="reason" id="reason" 
											style="width: 100%;">${refundData.reason}</textarea></td>
								</tr><br>
						</table>
						<br><br>
						<table class="type"><br>
							| 회송 정보 입력<font color="#f2291f" size="2px;">(*필수 입력 항목)</font>
							<tr>
								<td><div id="AddressBook" align=center
										style="margin: 30px 0px 0px 330px; position: absolute; vertical-align: top;"></div></td>
							</tr>
							<tr>
								<td class="popup" align="left" width="23%"
									style="padding-left: 14px;"><SPAN class="warning">*
								</SPAN>받으시는 분</td>
								<td ><br>
									<input type=text name="receiver_name" id="receiver_name" maxLength=20 value="${refundData.receiver_name}" ><br><br>
									<!-- receiver_name -->
								</td>
							</tr>
							<tr>
								<td rowspan="3" class="popup" align="left" width="23%"
									style="padding-left: 14px;"><SPAN class="warning">*
								</SPAN>주소</td>
								<td><input type="text" name="zipcode" id="zipcode"
									class="inNextBtn" value="${refundData.zipcode} "
									style="float: left;"> <span class="addr_check"><a
										href="javascript:zipcode();" class="btn bgGray"
										style=" width: auto; clear: none; border: 1px solid #d3d3d3;">주소검색</a></span>
									<!-- address1 --></td>
							</tr>
							<tr>
								<td>
									<input type="text" name="addr1" id="addr1"
									value="${refundData.addr1}"
									style="width: 500px;"><br> <!-- address2 -->
								</td>
							</tr>
							<tr>
								<td>
									<input type="text" name="addr2" id="addr2"
									value="${refundData.addr2}"
									style="float: left; width: 500px;"><br><br> <!-- address3 -->
								</td><br>
							</tr>
							<tr>
								<td class="popup" align="left" width="23%"
									style="padding-left: 14px;"><SPAN class="warning">*
								</SPAN>휴대전화번호</TD>
								<!-- receiver_phone -->
								<td>
									<input type="text" name="tel1" id="tel1" value="${refundData.tel1} " size="5" maxlength="5" /> 
									- 
									<input type="text" name="tel2" id="tel2" value="${refundData.tel2} " size="5" maxlength="5" /> 
									- 
									<input type="text" name="tel3" id="tel3" value="${refundData.tel3} " size="5" maxlength="5" />
								</td>
							</tr>
							</table>
							</form>
						<br> <br>
					</div>
				</div>
			</div>
		</div>
	<div class="container">
		<div class="row" align="center">
			<a href="javascript:goSave();" class="btns"
				style="font-weight: bold;">신청하기</a>&nbsp;&nbsp;&nbsp;&nbsp;
		</div>
		<%@ include file="/WEB-INF/view/include/footer.jsp"%>
	</div>
</body>
</html>