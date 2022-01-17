<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>도서 정보</title>
    
    <!-- css -->
    <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css"/>
    <link rel="stylesheet" href="/bookmall/css/reset.css"/>
    <link rel="stylesheet" href="/bookmall/css/common.css"/>
    
    <!-- js -->
    <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
    <script src="/bookmall/js/common.js"></script>
    <script src="/bookmall/js/main.js"></script>

</head>
<body>
<div class="wrap"> 	
   	<!-- HEADER 시작 -->
    <%@ include file="/WEB-INF/view/include/header.jsp" %>
    <!-- HEADER 종료 -->
    <input type = "hidden" name="bookno" value="${data.bookno }">
    	 <!-- 도서 기본 정보 시작 -->
    	 <span style="align:center"><h3>도서 정보</h3></span>
    	 <hr>
         <div class="bookNormalInfo">
         	<img src="/bookmall/img/book_1.png" width="130"></a><br>
         	<a><h3>${data.btitle_first}</h3>${data.btitle_second }</a><br>
         	<a>${data.author } | ${data.publisher } | ${data.pubdate }</a><br>
         	<a>별점 &nbsp;&nbsp;&nbsp;| 판매 지수 : 500</a><br>
         	<hr>
         	<a>정가 : ${data.price }</a><br>
         	<span style="color:red" ><b>판매가 : ${data.salesprice}</b></span><br>
         	<hr>
         	<a>수량 선택 : </a>
         </div>	
         <!-- 도서 기본 정보 종료 -->
         
         	<!-- 구매/장바구니 버튼 시작 -->
         	<div class="butSet clear">
				<div class="buyBtn">
					<input type="button" value="바로 구매" class="" onclick="">
					<input type="button" value="리스트에 담기" class="" onclick="">
					<input type="button" value="장바구니에 담기" class="" onclick="">
				</div>
			</div>
         	<!-- 구매/장바구니 버튼 종료 -->
         	
         	<!-- 도서 정보/리뷰/배송환불 이동 버튼 시작 -->
			<div class="viewSet clear">
				<div class="viewBtn">
					<a href="" class="btn">도서 정보</a>
					<a href="" class="btn">리뷰</a>
					<a href="" class="btn">배송/반품/교환</a>
				</div>
			</div>
			<!-- 도서 정보/리뷰/배송환불 이동 버튼 종료 -->
			
			<!-- 도서 상세 정보 시작 -->
         	<div class="bookDetailInfo">
         		<a><h2>품목 정보</h2></a><br>
         		<a>출간일 : ${data.pubdate }</a><br>
         		<a>쪽수, 무게, 크기 : ${data.bpages }쪽 | ${data.bweight }g | ${data.bwidth } * ${data.bvertical } * ${data.bheight }mm </a><br>
         		<a>ISBN13 : ${data.isbn }</a><br>
         		
         		<a><h2>관련 분류</h2></a><br>
         		국내도서 > 경제 경영 > 1<br>
         		국내도서 > 경제 경영 > 2<br>
         		<hr>
         		
         		<a><h2>책 소개</h2></a><br>
         		<div class="bookInfo">
         			${data.bintroduce }
         		</div>
				<hr>
				<a><h2>목차</h2></a>
				<div class="bookIndex">
					${data.bindex }
				</div>         	
				<hr>
				
				<a><h2>도서 리뷰</h2></a><br>
				<div class="bookReview">
				
				</div>
         	</div>
         	
         	<!-- 도서 상세 정보 종료 -->
         	
         	<!-- 배송/반품/교환 시작 -->
         	<div class="bookDeliveryInfo">
         		<a><h2>배송/반품/교환</h2></a>
         		<span style="color:blue">배송 안내</span><br>
         			배송 시 주의 사항<br>
         		<span style="color:blue">반품 안내</span><br>
         			반품 시 주의 사항<br>
         		<span style="color:blue">교환 안내</span><br>
         			교환 시 주의 사항<br>
         	</div>
         </div>
 
        <!-- FOOTER 시작 -->
        <%@ include file="/WEB-INF/view/include/footer.jsp" %>
        <!-- FOOTER 종료 -->
</body>
</html>