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
<link rel="stylesheet" href="/bookmall/css/com.css" />
<link rel="stylesheet" href="/bookmall/css/order.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
<script src="/bookmall/js/common.js"></script>
</head>
<body>
	<div class="wrap">
		<%@ include file="/WEB-INF/view/include/header.jsp"%>
		<div class="sub">
			<div class="sub_visual">
				<div class="slogan">최근 주문내역</div>
				<br>
				<br>
			</div>
			<div class="size">
				<div class="box">
					<p class="title">
					<div class="under">
						<div class="text"></div>
						<table class="type">
							<thead>
								<tr>
									<th scope="col" width="20%">주문번호</th>
									<th scope="col" width="20%">상품</th>
									<th scope="col" width="30%">상품정보</th>
									<th scope="col" width="10%">주문금액</th>
									<th scope="col" width="10%">수량</th>
									<th scope="col" width="10%">주문상태</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>192983 <br> (2021-12-30)
									</td>
									<td><img src="/bookmall/img/book_1.png" width="100"></td>
									<td>구병모의 신작 장편소설 <br> 상아의 문으로<br> 구병모 저 | 문학과지성사<br>
									<br> <a href="/bookmall/board/review.do" class="btn">리뷰작성</a>
									</td>
									<td>9,800원</td>
									<td>1</td>
									<td>결제완료</td>
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
	</div>
	</div>
</body>
</html>