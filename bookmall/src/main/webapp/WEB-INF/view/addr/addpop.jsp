<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>주소록</title>
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
	//체크박스 전체 선택&해제
	$('#ck_all').click(function() {
		if ($("#ck_all").prop("checked")) {
			$("input[type=checkbox]").prop("checked", true);
		} else {
			$("input[type=checkbox]").prop("checked", false);
		}
	});

	// 삭제
	$(".deleteClick").on('click', function() {
		if (confirm('선택하신 문의사항을 삭제하시겠습니까?')) {
			$.ajax({
				type : 'post',
				url : '/bookmall/addr/deleteAjax.do', // <<-- 처리 요청 URL
				data : $("#addspace").serialize(),
				success : function(res) { // 비동기요청  성공시
					alert('총 ' + res.trim() + "건이 삭제되었습니다.");
					location.reload(); // 페이지 새로고침
				}
			});
		}
	});
	
});

</script>
</head>
<body>
		<div align="center">
			<hr color="#d3d3d3" width="100%">
			<h2>나의 주소록</h2>
			<hr color="#d3d3d3" width="100%">
		</div>
		<table  style="width:100%; border:0; cellspacing:0; cellpadding:0; class:address_list;">
		    <colgroup>
		        <col width="5%" />
		        <col width="10%" />
		        <col width="5%"/>
		    </colgroup>
			<thead>
			    <tr>
			        <th>별칭/이름</th>
			        <th>주소</th>
			        <th>전화번호</th>
			    </tr>
			</thead>
			<tbody>
		    <c:forEach var="addBook" items="${addBook}" varStatus="status">
		        <tr id="board_tr"data-addno="${addBook.addno}">
		            <input type="hidden" name="division" value="${addBook.division}" />
		            <input type="hidden" name="name" value="${addBook.name}" />
		            <input type="hidden" name="zipcode" value="${addBook.zipcode}" />
		            <input type="hidden" name="address" value="${addBook.address}" />
		            <input type="hidden" name="address2" value="${addBook.address2}" />
		            <input type="hidden" name="tel1" value="${addBook.tel1}" />
		            <input type="hidden" name="tel2" value="${addBook.tel2}" />
		            <input type="hidden" name="tel3" value="${addBook.tel3}" />
		        </tr>
		    </c:forEach>	                  	
		    	<c:if test="${empty addBook }">
                    <tr>
                        <td class="first" colspan="6">등록된 주소가 없습니다.</td>
                    </tr> 
                </c:if>
		    </tbody>
				<form name="addspace" id="addspace">
						<c:forEach var="addBook" items="${addBook}">
							<tr class="board_tr" data-addno="${addBook.addno}"
								style="cursor: pointer; ">
								<tr style="font-size: 15px; height: 60px; ">
								<td>
									<a href="javascript:void(window.close
									('http://localhost:8080/bookmall/addr/addpop.do?addno=${addBook.addno }', 
									'주소선택','width=800px, height=500px'))">${addBook.division}/${addBook.name}</a> 
								</td>
								<td>
								<a href="javascript:void(window.close
									('http://localhost:8080/bookmall/addr/addpop.do?addno=${addBook.addno }', 
									'주소선택','width=800px, height=500px'))">${addBook.zipcode}<br>${addBook.address} ${addBook.address2}</a> 
								</td>
								<td><center>${addBook.tel1}-${addBook.tel2 }-${addBook.tel3 }</center></td>
							</tr>
						</c:forEach>
				</form>
			</tbody>
		</table>
</body>
</html>