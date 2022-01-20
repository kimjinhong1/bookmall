<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<link rel="stylesheet" href="/bookmall/css/refund.css" />
<link rel="stylesheet" href="/bookmall/css/com.css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
<script src="/bookmall/js/common.js"></script>
<script src="/bookmall/js/main.js"></script>
<!-- 주소검색 -->
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
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
	</script>
<script>

	$(function goSave() {
			if($("#name").val() == '') {
				alert("이름을 입력하세요");
				$("#name").focus();
			else($("#receiver_name").val() == '') {
				alert("받으시는분 이름을 입력하세요");
				$("#receiver_name").focus();
			else ($("#address").val() == '') {
				alert("주소를 입력하세요");
				$("#address").focus();
			return;
		}
		oEditors.getById['content'].exec("UPDATE_CONTENTS_FIELD",[]);
		$("#frm").submit();
	}
			
	function close() {
		window.close();
		}
	}
)};
	
</script>

<style>
span {
	display: inline-block;
	width: 100px;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
}
</style>
</head>
<body>
	<div class="wrap">
		<div class="sub">
			<div class="sub_visual">
				<div class="slogan">교환신청</div>
			</div>
			<div class="size">
				<div class="box">
					<p class="title">
					<div class="under">
						<div class="text"></div>
						| 교환 사유 선택
						<table class="type">
							<thead>
								<tr>
									<th><input type="radio" id="wrongdelivery" name="cancle1"
										value="1">오배송</th>
									<th><input type="radio" id="broken" name="cancle1"
										value="2">상품파손</th>
									<th><input type="radio" id="defect" name="cancle1"
										value="3">제작불량</th>
								</tr>
								<tr>
							</thead>
						</table>
						<br> <br>
					</div>
				</div>
			</div>
			<div class="size">
				<div class="box">
					<p class="title">
					<div class="under">
						<div class="text"></div>
						| 교환사유 및 기타 메세지 입력<font size="2px;">&nbsp;*파본, 상품불량이나 취소
							사유에 대해 기입해주세요.</font>
						<table class="type">
							<thead>
							<tbody>
								<th></th>
								<tr>
									<td><textarea name="content" id="content"
											style="width: 100%;"></textarea></td>
								</tr>
							</thead>
							</tbody>
						</table>
						<br> <br>
					</div>
				</div>
			</div>

			<div class="size">
				<div class="box">
					<p class="title">
					<div class="under">
						<div class="text"></div>
						| 회송 정보 입력<font color="#f2291f">(*필수 입력 항목)</font>
						<table
							style="margin-left: auto; margin-right: auto; width: 1200px;">
							<tr>
							</tr>
						</table>
						<table style="width: 100px; align: center; border: 0;">
							<tr>
								<td><div id="AddressBook" align=center
										style="margin: 30px 0px 0px 330px; position: absolute; vertical-align: top;"></div></td>
							</tr>
						</table>
						<table
							style="cellSpacing: 1; cellPadding: 3; width: 1200px; bgColor: #83b8c2; border: 0; align: center;">
							<tr>
								<td class="popup" align="left" width="23%"
									style="padding-left: 14px;"><SPAN class="warning">*
								</SPAN>주문인</td>
								<td bgColor="#ffffff"><input type="text" name="name"
									value="${loginUser.name} 김한나" class="form" maxlength="20" />
									[${loginUser.tel }010-9632-5543]</td>
							</tr>
							<tr>
								<td class="popup" align="left" width="23%"
									style="padding-left: 14px;"><SPAN class="warning">*
								</SPAN>받으시는 분</td>
								<td bgColor="#ffffff"><INPUT class=form type=text
									maxLength=20 value="${receiver_name}" name=receiver_name>
									<!-- receiver_name --></td>
							</tr>
							<tr>
								<td rowspan="3" class="popup" align="left" width="23%"
									style="padding-left: 14px;"><SPAN class="warning">*
								</SPAN>주소</td>
								<td><input type="text" name="zipcode" id="zipcode"
									class="inNextBtn" value="${loginUser.zipcode} 21004"
									style="float: left;"> <span class="addr_check"><a
										href="javascript:zipcode();" class="btn bgGray"
										style="float: left; width: auto; clear: none; border: 1px solid #d3d3d3;">주소검색</a></span>
									<!-- address1 --></td>
							</tr>
							<tr>
								<td><input type="text" name="addr1" id="addr1"
									value="${loginUser.addr1} 인천광역시 황어로115번길"
									style="float: left; width: 500px;"> <!-- address2 --></td>
							</tr>
							<tr>
								<td><input type="text" name="addr2" id="addr2"
									value="${loginUser.addr2} xx동 xxx호"
									style="float: left; width: 500px;"> <!-- address3 --></td>
							</tr>
							<tr>
								<td class="popup" align="left" width="23%"
									style="padding-left: 14px;"><SPAN class="warning">*
								</SPAN>휴대전화번호</TD>
								<!-- receiver_phone -->
								<td bgColor="#ffffff"><input type="text" name="tel1"
									value="${loginUser.tel1} 010" size="3" maxlength="3" /> - <input
									type="text" name="tel2" value="${loginUser.tel2} 9632" size="4"
									maxlength="4" /> - <input type="text" name="tel3"
									value="${loginUser.tel3} 5543" size="4" maxlength="4" /></td>
							</tr>
						</table>

						<br> <br>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="container">
		<div class="row" align="center">
			<a href="javascript:goSave();" class="btn"
				style="font-weight: bold; color: red">저장</a>&nbsp;&nbsp;&nbsp;&nbsp;
			<a href="javascript:close();" class="btn" style="font-weight: bold;">닫기</a>
		</div>
	</div>
</body>
</html>