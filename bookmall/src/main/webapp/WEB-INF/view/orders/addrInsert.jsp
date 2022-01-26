<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- 주소검색 -->
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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
                document.getElementById("addr1").value = addr; // 주소
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("addr2").focus();
            }
        }).open();
    }
</script>

<script>
	$(function() {
		$("#btn").on("click", function() {
			if ($("#zipcode").val() == "") {
				alert("우편번호을 입력하세요");
				return false;
			}
			if ($("#addr1").val() == "") {
				alert("주소를 입력하세요");
				return false;
			}
			if ($("#tel2").val() == "") {
				alert("상세주소를 입력하세요");
				return false;
			}
			frm.submit();
		});
	})
	
	$(function() {
	$(".orderBtn").click(function() {
		$("#frm").submit();
	})
})
</script>

	
<%-- <script>
	function detailView(zipcode, addr1, addr2) {
		window.opener.document.f.zipcode.name = zipcode;
		window.opener.document.f.addr1.name = addr1;
		window.opener.document.f.addr2.name = addr2;
		//window.opener.document.custF.submit();    //폼 전송
		self.close();    //자식창 닫기
	}
</script> --%>
	
	
</head>
<body>
	<a href="마이페이지 주소록" style="font-size: 13px;"> 주소록 전체보기</a> <!-- 다혜씨 -->
	<br>
	<form action="writeInsert.do" method="post" name="frm" id="frm">
	
		<table>
			<tr>
				<td>우편번호</td>
				<td><input type="text" name="zipcode" id="zipcode" size=10>
				<a href="javascript:zipcode();"><input type="button" name="search" value="검색">${list.zipcode }</a></td>
			<tr>
				<td>주소
				<td colspan="2"><input type="text" name="addr1" id="addr1" size=30>${list.addr1 }</td>
			</tr>
			<tr>
				<td>상세주소
				<td colspan="2"><input type="text" name="addr2" id="addr2" size=30>${list.addr2 }</td>
			</tr>
		</table>
		<br>
		<div class="button" align="left">
				<button style="font-size: 15px; background-color: #fff; border: 1px solid #d3d3d3;">주소록 등록하기</button>
		</div>
	</form>
</body>
</html>

