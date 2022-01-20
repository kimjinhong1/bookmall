<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주소록 목록</title>
<script>
function AddressInit(selectedValue) {
        var tabs = document.getElementById("divAddressOption").getElementsByTagName("a");
        for (var i = 0; i < tabs.length; i++) {
            var tab = tabs[i];
            if (tab.id == "address_tab" + selectedValue) {
                tab.setAttribute("class", "address_tab_on");
            } else {
                tab.setAttribute("class", "address_tab_off");
            }
        }
</script>        
</head>
<body>
	<div align="center">
		<hr color="#d3d3d3" width="100%">
		<h2>배송 주소록</h2>
		<hr color="#d3d3d3" width="100%">
	</div>	
		<form name="f" action="order1.do" method="post" align="left">
			<b>ㆍ</b>아래의 주소를 클릭하시면 자동으로 주소가 입력됩니다.
			<a class="button" href="javascript:;" onclick="">새 주소 등록</a><a> /</a>
			<a class="button" href="마이 페이지 배송 주소록 관리로 이동" target="_blank">주소록 관리</a><br>
			<b>ㆍ</b>우편번호나 부정확한 주소로 인해 배송 사고가 발생할 위험이 있는 주소는 표시되지 않습니다.
			<table  style="width:100%; border:0; cellspacing:0; cellpadding:0; class:address_list;">
				<tbody><tr align="center" bgcolor="F0F0F0">
					<td style="width:auto" bgcolor="F0F0F0">배송주소</td>
					<td style="width:100px">수정/삭제</td>
				</tr></tbody>
			</table>
			
			<table>
			<%-- <c:forEach items="" var=""> --%>
				<tr>
					<td style="width:640px;" ><a href="javascript:"><br>주 소 : ${loginUser.zipcode}<span class="info1"></span></a></td>							
					<td style="width:auto;" >
						<div class="button" align="center" style="padding: 0px;">
							<a class="button_small" href="javascript:void(0);" onclick="AddressInit('SelectAddress','54748850')">선택하기</a>
							<br>
							<a class="button_small" href="javascript:void(0);" onclick="AddressInit('SelectAddress','54748850')">수정</a> |
							<a class="button_small" href="javascript:void(0);" onclick="AddressInit('SelectAddress','54748850')">삭제</a>
						</div>
					</td>
				</tr>
			<%-- </c:forEach> --%>		
			</table>
		</form>
									
		
			
</html>
</body>