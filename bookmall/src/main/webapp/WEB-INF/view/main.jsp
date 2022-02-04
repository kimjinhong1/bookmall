<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css"/>
    <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
    <link rel="stylesheet" href="/bookmall/css/reset.css"/>
    <link rel="stylesheet" href="/bookmall/css/main.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
    <script src="/bookmall/js/common.js"></script>
    <script src="/bookmall/js/main.js"></script>
    <script>
    	$(function() {
    		console.log(document.cookie.indexOf("mainPopup=popup"));
    		if (document.cookie.indexOf("mainPopup=popup") < 0) {
    			$(".divPop").show();
    		}
    	});
    </script>
</head>
<body>
    <div class="wrap">
        <%@ include file="/WEB-INF/view/include/header.jsp" %>
        <div class="visual">
          <div class="size" style=" height: 500px">
            <div class="swiper mySwiper">
                <div class="swiper-wrapper" >
                  <div class="swiper-slide" style="background-image: url('/bookmall/img/banner6.png');" ></div>
                  <div class="swiper-slide" style="background-image: url('/bookmall/img/banner7.png');"></div>
                  <div class="swiper-slide" style="background-image: url('/bookmall/img/banner8.png');"></div>
                  <div class="swiper-slide" style="background-image: url('/bookmall/img/banner9.png');"></div>
                  <div class="swiper-slide" style="background-image: url('/bookmall/img/banner10.png');"></div>
                </div>
                <div class="swiper-button-next" style="color: black;"></div>
                <div class="swiper-button-prev" style="color: black;"></div>
            </div>
        </div>
        </div>
		<div class="container">
        	<div class="size">
                <div class="text">
					<a href=""><b>오늘의 책 ▶</b></a>
            	</div>
	                <div class="section">
						<div class="nowBook"></div>
							<a href=""><img src="/bookmall/img/book_4.png" width="192" ></a><br>
			                <p>1940 런던 공습 이야기</p> <!-- btitle_second -->
			                <a href="">폭격기의 달이 뜨면</a> <!-- btitle_first -->
			                <p>에릭 라슨 저/이경남 역 | 생각의힘</p>  <!-- author, publisher -->
							<p>27,000원</p> <!-- price -->
             	 	</div>	
             	 	<div class="section">
						<div class="nowBook"></div>
							<a href=""><img src="/bookmall/img/book_5.png" width="192"></a><br>
			                <p>방구석 이탈리아 미술 여행</p> <!-- btitle_second -->
			                <a href="">90일 밤의 미술관 : 이탈리아</a> <!-- btitle_first -->
			                <p>김덕선, 김성희, 유재선, 이영은 저 |  동양북스(동양books)</p>  <!-- author, publisher -->
							<p>19,800원</p> <!-- price -->
             		</div>	
             	 	<div class="section">
						<div class="nowBook"></div>
							<a href=""><img src="/bookmall/img/book_6.png" width="192"></a><br>
			                <p>시인 나태주 × 화가 유라</p> <!-- btitle_second -->
			                <a href="">서로 다른 계절의 여행</a> <!-- btitle_first -->
			                <p>나태주 글/유라 그림 | 북폴리오</p>  <!-- author, publisher -->
							<p>13,500원</p> <!-- price -->
             	 	</div>	
             	 	</div>
             	 	<div class="container">
        	<div class="size">
                <div class="text">
                <a href=""><b>오늘의 책 ▶</b></a>
            	</div>
	                <div class="section">
						<div class="nowBook"></div>
							<a href=""><img src="/bookmall/img/book_7.png" width="192"></a><br>
			                <p>최양선 장편소설</p> <!-- btitle_second -->
			                <a href="">세대주 오영선</a> <!-- btitle_first -->
			                <p>최양선 저 | 사계절</p>  <!-- author, publisher -->
							<p>6,060원</p> <!-- price -->
             	 	</div>	
             	 	<div class="section">
						<div class="nowBook"></div>
							<a href=""><img src="/bookmall/img/book_8.png" width="192"></a><br>
			                <p>읽는인간</p> <!-- btitle_second -->
			                <a href="">읽는 인간 리터러시를 경험하라</a> <!-- btitle_first -->
			                <p>이승희 저 | 북스톤</p>  <!-- author, publisher -->
							<p>14,400원</p> <!-- price -->
             		</div>	
             	 	<div class="section">
						<div class="nowBook"></div>
							<a href=""><img src="/bookmall/img/book_9.png" width="192"></a><br>
			                <p>혁신을 이룬 스타트업은 어떻게 데스밸리를 넘었나</p> <!-- btitle_second -->
			                <a href="">창업가의 답</a> <!-- btitle_first -->
			                <p>성호철, 임경업 저 | 포르체</p>  <!-- author, publisher -->
							<p>15,120원</p> <!-- price -->
             	 	</div>	
            </div>
        </div>
       </div>
       
        <%@ include file="/WEB-INF/view/include/footer.jsp" %>
    </div>
</body>
</html>