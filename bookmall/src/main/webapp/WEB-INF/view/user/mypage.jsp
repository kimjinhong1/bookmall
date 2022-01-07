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
<link rel="stylesheet" href="/bookmall/css/reset.css"/>
<link rel="stylesheet" href="/bookmall/css/com.css" />
<link rel="stylesheet" href="/bookmall/css/sub.css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
<script src="/bookmall/js/common.js"></script>
<script src="/bookmall/js/main.js"></script>
<style>
span {display:inline-block; width:100px; white-space:nowrap; overflow:hidden; text-overflow:ellipsis; }
</style>
</head>
<body>
	<div class="wrap">
		<%@ include file="/WEB-INF/view/include/header.jsp"%>
		<div class="sub">
			<div class="sub_visual">
				<div class="slogan">마이페이지</div>
			</div>
			<div class="size">
				<div class="box">
						<p class="title">
						<div class="under">
					<div class="text"></div>
							| 최근 주문내역<a href="/bookmall/user/recentorder.do" class="btn">자세히보기▶</a>
							<table class="type">
								<thead>
									<tr>
										<th scope="col" width="15%">주문번호</th>
										<th scope="col" width="40%">주문내역</th>
										<th scope="col" width="15%">주문일자</th>
										<th scope="col" width="15%">주문상태</th>
										<th scope="col" width="15%">배송</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td onClick="location.href='/bookmall/user/ask.do'"
											style="cursor: pointer;">2021-11-01</td>
										<td>[국내도서]제목: 멍멍/ 저자:왈왈 멍멍이귀여워</td>
										<td>20211101</td>
										<td>결제완료</td>
										<td>배송완료</td>
									</tr>
									<tr>
										<td>20211101</td>
										<td>[국내도서]제목: 멍멍/ 저자:왈왈 멍멍이귀여워</td>
										<td>2021-11-01</td>
										<td>결제완료</td>
										<td>배송완료</td>
									</tr>
									<tr>
										<td>2021-11-01</td>
										<td>[국내도서]제목: 멍멍/ 저자:왈왈 멍멍이귀여워</td>
										<td>20211101</td>
										<td>결제완료</td>
										<td>배송완료</td>
									</tr>
								</tbody>
							</table>
							</p>
							<br> <br>
						</div>
					</div>
				</div>
			<div class="size">
				<div class="box">
						<p class="title">
						<div class="under">
							<div class="text"></div>
							| 1:1문의내역<a href="/bookmall/user/ask.do" class="btn">답변보기▶</a>
								<table class="type">
									<thead>
										<tr>
											<th scope="col" width="10%">번호</th>
											<th scope="col" width="10%">문의종류</th>
											<th scope="col" width="25%">제목</th>
											<th scope="col" width="35%">내용</th>
											<th scope="col" width="10%">문의일자</th>
											<th scope="col" width="10%">답변상태</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>21152</td>
											<td>교환/반품</td>
											<td>제목이 길면 옆에 내용이 생략됩니다</td>
											<td>어제 책을 받았는데, 책 상태가 안좋습니다 교환되나요?</td>
											<td>결제완료</td>
											<td>답변완료</td>
										</tr>
										<tr>
											<td>20286</td>
											<td>결제문의</td>
											<td>결제 제목제목제목제목제목제목제목제목제목제목제목어쩌고 저쩌고 물어봅니다</td>
											<td>여기도 내용내용내용내용내용이 길면 생략이 됩니다 내용이 생략됩니다다다다다다다</td>
											<td>결제완료</td>
											<td>답변완료</td>
										</tr>
									</tbody>
								</table>
								</p>
								<br> <br>
						</div>
					</div>
				</div>
			</div>
		<div class="container">
			<div class="size">
				<div class="text2">|최근본목록</div>
				<div class="banner">
					<div class="swiper partner_slide">
						<div class="swiper-wrapper">
							<div class="swiper-slide">
								<div class="img">
									<img src="/bookmall/img/book_1.png">
									<p>기록하는 순간 영감이 된다</p>
									<!-- btitle_second -->
									<a href="">별게 다 영감</a>
									<!-- btitle_first -->
									<p>이승희 저 | 북스톤</p>
									<!-- author, publisher -->
								</div>
							</div>
							<div class="swiper-slide">
								<div class="img">
									<img src="/bookmall/img/book_2.png">
									<p>구병모의 신작 장편소설</p>
									<!-- btitle_second -->
									<a href="">상아의 문으로</a>
									<!-- btitle_first -->
									<p>구병모 저 | 문학과지성사</p>
									<!-- author, publisher -->
								</div>
							</div>
							<div class="swiper-slide">
								<div class="img">
									<img src="/bookmall/img/book_3.png">
									<p>시인 나태주 × 화가 유라</p>
									<!-- btitle_second -->
									<a href="">서로 다른 계절의 여행</a>
									<!-- btitle_first -->
									<p>나태주 글/유라 그림 | 북폴리오</p>
									<!-- author, publisher -->
								</div>
							</div>
							<div class="swiper-slide">
								<div class="img">
									<img src="/bookmall/img/book_4.png">
									<p>시인 나태주 × 화가 유라</p>
									<!-- btitle_second -->
									<a href="">서로 다른 계절의 여행</a>
									<!-- btitle_first -->
									<p>나태주 글/유라 그림 | 북폴리오</p>
									<!-- author, publisher -->
								</div>
							</div>
							<div class="swiper-slide">
								<div class="img">
									<img src="/bookmall/img/book_5.png">
									<p>방구석 이탈리아 미술 여행</p>
									<!-- btitle_second -->
									<a href="">90일 밤의 미술관 : 이탈리아</a>
									<!-- btitle_first -->
									<p>김덕선, 김성희 | 동양북스(동양books)</p>
									<!-- author, publisher -->
								</div>
							</div>
						</div><br><br>
					</div>
				</div>
				<div class="container">
					<div class="size">
						<div class="text2">| 마이리스트
							<a href="/bookmall/user/mylist.do" class="btn">리스트보기▶</a></div>
						<div class="under"> </div>
						<table class="type">
							<div class="section2">
								<div class="nowBook2"></div>
								<a href=""><img src="/bookmall/img/book_1.png" width="120"></a><br>
								<p>구병모의 신작 장편소설</p>
								<!-- btitle_second -->
								<a href="">상아의 문으로</a>
								<!-- btitle_first -->
								<p>구병모 저 | 문학과지성사</p>
								<!-- author, publisher -->
								<p>9,800원</p>
								<!-- price -->
							</div>
							<div class="section2">
								<div class="nowBook2"></div>
								<a href=""><img src="/bookmall/img/book_2.png" width="120"></a><br>
								<p>기록하는 순간 영감이 된다</p>
								<!-- btitle_second -->
								<a href="">별게 다 영감</a>
								<!-- btitle_first -->
								<p>이승희 저 | 북스톤</p>
								<!-- author, publisher -->
								<p>14,400원</p>
								<!-- price -->
							</div>
							<div class="section2">
								<div class="nowBook2"></div>
								<a href=""><img src="/bookmall/img/book_3.png" width="120"></a><br>
								<p>시인 나태주 × 화가 유라</p>
								<!-- btitle_second -->
								<a href="">서로 다른 계절의 여행</a>
								<!-- btitle_first -->
								<p>나태주 글/유라 그림 | 북폴리오</p>
								<!-- author, publisher -->
								<p>13,500원</p>
								<!-- price -->
							</div>
							<div class="section2">
								<div class="nowBook2"></div>
								<a href=""><img src="/bookmall/img/book_6.png" width="120"></a><br>
								<p>시인 나태주 × 화가 유라</p>
								<!-- btitle_second -->
								<a href="">서로 다른 계절의 여행</a>
								<!-- btitle_first -->
								<p>나태주 글/유라 그림 | 북폴리오</p>
								<!-- author, publisher -->
								<p>13,500원</p>
								<!-- price -->
							</div>
							<div class="section2">
								<div class="nowBook2"></div>
								<a href=""><img src="/bookmall/img/book_4.png" width="120"></a><br>
								<p>1940 런던 공습 이야기</p>
								<!-- btitle_second -->
								<a href="">폭격기의 달이 뜨면</a>
								<!-- btitle_first -->
								<p>에릭 라슨 저/이경남 역 | 생각의힘</p>
								<!-- author, publisher -->
								<p>27,000원</p>
								<!-- price -->
							</div>
							<div class="section2">
								<div class="nowBook2"></div>
								<a href=""><img src="/bookmall/img/book_5.png" width="120"></a><br>
								<p>방구석 이탈리아 미술 여행</p>
								<!-- btitle_second -->
								<a href="">90일 밤의 미술관 : 이탈리아</a>
								<!-- btitle_first -->
								<p>김덕선, 김성희 | 동양북스(동양books)</p>
								<!-- author, publisher -->
								<p>19,800원</p>
								<!-- price -->
							</div>
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
	<%@ include file="/WEB-INF/view/include/footer.jsp"%>
</body>
</html>