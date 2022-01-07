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
<link rel="stylesheet" href="/bookmall/css/com.css" />
<link rel="stylesheet" href="/bookmall/css/sub.css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
<script src="/bookmall/js/common.js"></script>

<script>
	$(document).ready(
		function() {
			$(".replycontents").hide();
			//content 클래스를 가진 div를 표시/숨김(토글)
				$(".replytitle").click(
				function() {
					$(this).next(".replycontents")
							.slideToggle(500);
					$("i", this)
							.toggleClass("fa-chevron-down fa-chevron-up");
							<%-- i 는 font awsome의 아이콘. down 아이콘이 기본 클릭시 up. 이다
						    toggle의 경우. jquery 자체 세션으로 이전 display를 기억한다.
						    즉 이전 display가 inline 이면 다른 값을 주지 않으면 inline 으로 돌아간다--%>
	});
					
});
</script>
</head>
<body>
	<div class="wrap">
		<%@ include file="/WEB-INF/view/include/header.jsp"%>
		<div class="sub">
			<div class="sub_visual">
				<div class="slogan">1:1 문의내역</div>
				<br>
				<br>
			</div>
			<div class="size">
				<div class="box">
					<p class="title">
					<div class="under">
						<div class="text"></div>
						<a href="/bookmall/user/askwrite.do" class="btn">1:1 문의하기▶</a>
						<table class="type2">
							<thead>
								<tr>
									<th scope="col" width="10%">문의번호</th>
									<th scope="col" width="20%">문의종류</th>
									<th scope="col" width="50%">문의내용</th>
									<th scope="col" width="10%">문의일자</th>
									<th scope="col" width="10%">답변상태</th>
								</tr>
								<tr>
									<td>20252</td>
									<td>교환/반품</td>
									<td style="word-break: break-all; word-wrap: break-word;">
										주며 그들을 행복스럽고 평화스러운 곳으로 인도하겠다는 커다란 이상을 품었기 때문이다 
										그러므로 그들은 길지 아니한 목숨을 사는가 싶이 살았으며 그들의 그림자는 천고에 사라지지 않는 것이다 
										이것은 현저하게 일월과 같은 예가 되려니와 그와 같지 못하다 할지라도 창공에 반짝이는 뭇 별과 같이 산야에 피어나는 군영과 같이 이상은 실로 인간의 부패를 방지하는 소금이라 할지니 인생에 가치를 주는 원질이 되는 것이다 
										그들은 앞이 긴지라 착목한는 곳이 원대하고 그들은 피가 더운지라 실현에 대한 자신과 용기가 있다 그러므로 그들은 이상의 보배를 능히 품으며 그들의 이상은 아름답고 소담스러운 열매를 맺어 우리 인생을 풍부하게 하는 것이다 보라
									<td>2021-11-01</td>
									<td> 2021-11-01<br>답변완료</td>
								</tr>
							</thead>
						</table>
						<table class="type2">
							<thead>
								<tr>
									<div class="replytitle">
										<%-- 제목으로 보일부분 --%>
										└ '{data.name }'님 '{data.asktitle }'답변입니다.
									</div>
									<div class="replycontents" >
										<%-- 클릭시 보여질 부분 --%>
										안녕하세요 고객님 어쩌구 저쩌구 어쩌구 저쩌구 어쩌구 저쩌구 어쩌구 저쩌구
										 어쩌구 저쩌구 어쩌구 저쩌구 어쩌구 저쩌구 어쩌구 저쩌구 어쩌구 저쩌구 어쩌구 저쩌구
										 어쩌구 저쩌구 어쩌구 저쩌구 어쩌구 저쩌구 어쩌구 저쩌구 어쩌구 저쩌구 어쩌구 저쩌구
										 어쩌구 저쩌구 어쩌구 저쩌구 어쩌구 저쩌구 어쩌구 저쩌구 어쩌구 저쩌구 어쩌구 저쩌구
										 어쩌구 저쩌구 어쩌구 저쩌구 어쩌구 저쩌구 어쩌구 저쩌구 어쩌구 저쩌구 어쩌구 저쩌구
									</div>
								</tr>
							</thead>
						</table>
						<table class="type2">
							<thead>
								<tr>
									<th scope="col" width="10%">문의번호</th>
									<th scope="col" width="20%">문의종류</th>
									<th scope="col" width="50%">문의내용</th>
									<th scope="col" width="10%">문의일자</th>
									<th scope="col" width="10%">답변상태</th>
								</tr>
								<tr>
									<td>20252</td>
									<td>교환/반품</td>
									<td style="word-break: break-all; word-wrap: break-word;">
										주며 그들을 행복스럽고 평화스러운 곳으로 인도하겠다는 커다란 이상을 품었기 때문이다 
										그러므로 그들은 길지 아니한 목숨을 사는가 싶이 살았으며 그들의 그림자는 천고에 사라지지 않는 것이다 
										이것은 현저하게 일월과 같은 예가 되려니와 그와 같지 못하다 할지라도 창공에 반짝이는 뭇 별과 같이 산야에 피어나는 군영과 같이 이상은 실로 인간의 부패를 방지하는 소금이라 할지니 인생에 가치를 주는 원질이 되는 것이다 
										그들은 앞이 긴지라 착목한는 곳이 원대하고 그들은 피가 더운지라 실현에 대한 자신과 용기가 있다 그러므로 그들은 이상의 보배를 능히 품으며 그들의 이상은 아름답고 소담스러운 열매를 맺어 우리 인생을 풍부하게 하는 것이다 보라
									<td>2021-11-01</td>
									<td> 2021-11-01<br>답변완료</td>
								</tr>
							</thead>
						</table>
						<table class="type2">
							<thead>
								<tr>
									<div class="replytitle">
										<%-- 제목으로 보일부분 --%>
										└ '{data.name }'님 '{data.asktitle }'답변입니다.
									</div>
									<div class="replycontents" >
										<%-- 클릭시 보여질 부분 --%>
										안녕하세요 고객님 어쩌구 저쩌구 어쩌구 저쩌구 어쩌구 저쩌구 어쩌구 저쩌구
										 어쩌구 저쩌구 어쩌구 저쩌구 어쩌구 저쩌구 어쩌구 저쩌구 어쩌구 저쩌구 어쩌구 저쩌구
										 어쩌구 저쩌구 어쩌구 저쩌구 어쩌구 저쩌구 어쩌구 저쩌구 어쩌구 저쩌구 어쩌구 저쩌구
										 어쩌구 저쩌구 어쩌구 저쩌구 어쩌구 저쩌구 어쩌구 저쩌구 어쩌구 저쩌구 어쩌구 저쩌구
										 어쩌구 저쩌구 어쩌구 저쩌구 어쩌구 저쩌구 어쩌구 저쩌구 어쩌구 저쩌구 어쩌구 저쩌구
									</div>
								</tr>
							</thead>
						</table>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="container">
			<div class="row" align="center">
				<a href="javascript:del();" class="btn"></a>
			</div>
		</div>
	</div>
	</div>
	<%@ include file="/WEB-INF/view/include/footer.jsp"%>
	</div>
	</div>
	</div>
</body>
</html>