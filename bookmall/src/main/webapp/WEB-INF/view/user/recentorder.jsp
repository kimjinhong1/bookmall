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
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css" />
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
<link rel="stylesheet" href="/bookmall/css/order.css" />
<link rel="stylesheet" href="/bookmall/css/com.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
<script src="/bookmall/js/common.js"></script>
<script src="http://code.jquery.com/jquery-1.12.0.min.js"></script>
 
<link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/3.0.0/css/bootstrap-datetimepicker.min.css" rel="stylesheet" /> 
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.8.2/moment-with-locales.min.js"></script> 
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/3.0.0/js/bootstrap-datetimepicker.min.js"></script>

<script> 
$(document).ready(function(){ 
	$("#spreadBtn02").click(function(){ 
		if($("#hiddenList01").is(":visible")){
				$("#hiddenList01").slideUp(); 
					}else{ $("#hiddenList01").slideDown(); 
			} 
		}); 
	}); 
		//선언한 TextBox에 DateTimePicker 위젯을 적용한다. 
$('#fromDate').datetimepicker({ language : 'ko', // 화면에 출력될 언어를 한국어로 설정한다. 
	pickTime : true, // 사용자로부터 시간 선택을 허용하려면 true를 설정하거나 pickTime 옵션을 생략한다. 
	defalutDate : new Date() // 기본값으로 오늘 날짜를 입력한다. 기본값을 해제하려면 defaultDate 옵션을 생략한다. 
	}); 
	
$('#toDate').datetimepicker({ 
	language : 'ko',
	pickTime : true, 
	defalutDate : new Date() 
	});
</script>

</head>
<body>
	<div class="wrap">
		<%@ include file="/WEB-INF/view/include/header.jsp"%>
		<div class="sub">
			<div class="sub_visual">
				<div class="slogan">최근 주문내역</div><br><br>
			</div>
			<div class="size">
				<div class="calendar">
					※최근 1년간 주문내역을 조회하실 수 있습니다.<br><br>
						<button>
							<span style="display:inline-block; background-color:white; width:70px; height: 30px; line-height: 30px; cursor: pointer;">최근1주일</span>
						</button>
						<button>
							<span style="display:inline-block; background-color:white; width:70px; height: 30px; line-height: 30px; cursor: pointer;">1개월</span>
						</button>
						<button>
							<span style="display:inline-block; background-color:white; width:70px; height: 30px; line-height: 30px; cursor: pointer;">3개월</span>
						</button>
						<button>
							<span style="display:inline-block; background-color:white; width:70px; height: 30px; line-height: 30px; cursor: pointer;">6개월</span>
						</button>&nbsp;&nbsp;
					
					
					<%-- 검색 시작날짜선택 --%>
					<input id="startDate" type="date" style="background-color:#ffffff; color: #808080;width:160px;font-size:15px;line-height: 30px;"> 
						<td>~</td>
					<%-- 검색 마지막날짜선택 --%>
					<input id="endDate" type="date" style="background-color:#ffffff; color: #808080; width:160px;font-size:15px;line-height: 30px;"><br><br>
						<div class=findorder>
							<td>
								<select name="selectinquiry" id="selectinquiry"
												style="width: 100px; height: 35px; ">
									<option value="1">주문전체</option>
									<option value="2">주문번호</option>
									<option value="3">주문자</option>
								</select>
									<input id="findbox" type="text" style=" width:480px; maxlength:10; height:35px; padding-top:10px;padding-bottom:10px ">
								<input type="submit" name="searchOrder" value="조회" style="display:inline-block; background-color: #c8c8c8; color: white; height: 35px; width: 80px; font-size: 15px; line-height: 30px;";>
								</input>
							</td>
						</div>
				</div>
				<div class="box">
						<p class="title">
						<div class="under">
							<div class="text"></div>
								<table class="type">
									<thead>
										<tr>
											<th scope="col" width="20%">주문번호</th>
											<th scope="col" width="10%">상품</th>
											<th scope="col" width="20%">상품정보</th>
											<th scope="col" width="10%">상품금액</th>
											<th scope="col" width="10%">수량</th>
											<th scope="col" width="10%">결제금액</th>
											<th scope="col" width="10%">주문상태</th>
											<th scope="col" width="10%">리뷰</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td ><a href="" style ="color: black; font-size:13px; background-color: white; border: 0px solid white">192983 <br></a> (2021-12-30)</td>
											<td> <img src="/bookmall/img/book_1.png" width="100"></td>
												 <td>구병모의 신작 장편소설 <br>
		                						 상아의 문으로<br>
			               						 구병모 저 | 문학과지성사<br><br>
			               						 </td>
											<td>9,800원</td>
											<td> 1 </td>
											<td>9,800원</td>
											<td>결제완료</td> 
			               					<td><a class="btn" href="/bookmall/board/review.do" >리뷰작성</a></td>
										</tr>
									</tbody>
									<tbody>
										<tr>
											<td><a href="" style ="color: black; font-size:13px; background-color: white; border: 0px solid white">115645 <br></a> (2021-12-29)</td>
											<td> <img src="/bookmall/img/book_2.png" width="100"></td>
												 <td>기록하는 순간 영감이 된다 <br>
		                						 별게 다 영감<br>
			               						 이승희 저 | 북스톤<br><br>
			               						 </td>
											<td>14,400원</td>
											<td> 3 </td>
											<td>43,200원</td>
											<td>결제완료</td>
			               					<td><a class="btn" href="/bookmall/board/review.do" >리뷰작성</a><td>
										</tr>
									</tbody>
									<tbody>
										<tr>
											<td><a href="" style ="color: black; font-size:13px; background-color: white; border: 0px solid white">15991155 </a><br> (2021-12-20)  </td>
											<td><img src="/bookmall/img/book_3.png" width="100"></td>
												 <td>시인 나태주 x 화가 유라 <br>
		                						 서로 다른 계절의 여행<br>
			               						  나태주 글/유라 그림 | 북폴리오<br><br>
			               						 </td>
											<td>13,500원</td>
											<td> 2 </td>
											<td>27,000원</td>
											<td>결제완료</td>
			               					 <td><a  class="btn" href="/bookmall/board/review.do">리뷰작성</a></td>
										</tr>
									</tbody>
								</table>
								<br> <br>
						</div>
					</div>
				</div>
		</div>
				<%@ include file="/WEB-INF/view/include/footer.jsp"%>
	</div>
</body>
</html>