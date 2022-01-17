<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>국내도서</title>
    
    <!-- css -->
    <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css"/>
    <link rel="stylesheet" href="/bookmall/css/reset.css"/>
    <link rel="stylesheet" href="/bookmall/css/book/booklist.css"/>
    
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
         
        <div class="container">
        <!-- 새로 나온 도서 영역 시작 -->
            <div class="size">
				<div class="category">
					<div class="category_name">국내도서</div>
					
				</div>
            	<div class="text">
					<p style="font-size:20px"><b>새로 나온 도서 ▶</b></p>
            	</div>
					<div class="section_new">
						<div class="newBook">
							<a href=""><img src="/bookmall/img/book_1.png" width="130"></a><br>
			                <span style="color:blue"><b>[건강에세이/건강기타]</b></span><br> <!-- bcategory -->
			                <a href=""><b>새벽 입김 위에 네 이름을 쓴다</b></a> <!-- btitle_first -->
			                <p>김지석 저</p>  <!-- author -->
			                <p>큐리어스(Qurious)</p> <!-- publisher -->
							<p><b>12,600원</b></p> <!-- salesprice -->
						</div>
	             	</div>	
	             	<div class="section_new">
						<div class="newBook">
							<a href=""><img src="/bookmall/img/book_1.png" width="130"></a><br>
			                <span style="color:blue"><b>[건강에세이/건강기타]</b></span><br> <!-- bcategory -->
			                <a href=""><b>새벽 입김 위에 네 이름을 쓴다</b></a> <!-- btitle_first -->
			                <p>김지석 저</p>  <!-- author -->
			                <p>큐리어스(Qurious)</p> <!-- publisher -->
							<p><b>12,600원</b></p> <!-- salesprice -->
						</div>
	             	</div>
	             	<div class="section_new">
						<div class="newBook">
							<a href=""><img src="/bookmall/img/book_1.png" width="130"></a><br>
			                <span style="color:blue"><b>[건강에세이/건강기타]</b></span><br> <!-- bcategory -->
			                <a href=""><b>새벽 입김 위에 네 이름을 쓴다</b></a> <!-- btitle_first -->
			                <p>김지석 저</p>  <!-- author -->
			                <p>큐리어스(Qurious)</p> <!-- publisher -->
							<p><b>12,600원</b></p> <!-- salesprice -->
						</div>
	             	</div>
	             	<div class="section_new">
						<div class="newBook">
							<a href=""><img src="/bookmall/img/book_1.png" width="130"></a><br>
			                <span style="color:blue"><b>[건강에세이/건강기타]</b></span><br> <!-- bcategory -->
			                <a href=""><b>새벽 입김 위에 네 이름을 쓴다</b></a> <!-- btitle_first -->
			                <p>김지석 저</p>  <!-- author -->
			                <p>큐리어스(Qurious)</p> <!-- publisher -->
							<p><b>12,600원</b></p> <!-- salesprice -->
						</div>
	             	</div>
			</div>
			<!-- 새로 나온 도서 영역 종료 -->
		</div>
		
		<!-- 인기 있는 도서 영역 시작 -->	
		<div class="container">
        	<div class="size">
                <div class="text">
					<p style="font-size:20px"><b>인기 있는 도서 ▶</b></p>
            	</div>
	                <div class="section_hot">
						<div class="hotBook">
							<p style="text-align:left"><b>사회/정치</b></p><br>
							<a href=""><img src="/bookmall/img/book_4.png" width="200" height="300" align="left" float="left" ></a>
			                <a href=""><b>데스퍼레이트 그라운드</b></a><br> <!-- btitle_first -->
			                <p>햄프턴 사우스 저</p> <!-- author -->
			                <p>플래닛 미디어</p><br>  <!-- publisher -->
							<p><b>22,500원</b></p> <!-- salesprice -->
						</div>
             	 	</div>
	                <div class="section_hot">
						<div class="hotBook">
							<p style="text-align:left"><b>사회/정치</b></p><br>
							<a href=""><img src="/bookmall/img/book_4.png" width="200" height="300" align="left" float="left" ></a>
			                <a href=""><b>데스퍼레이트 그라운드</b></a><br> <!-- btitle_first -->
			                <p>햄프턴 사우스 저</p> <!-- author -->
			                <p>플래닛 미디어</p><br>  <!-- publisher -->
							<p><b>22,500원</b></p> <!-- salesprice -->
						</div>
             	 	</div>	
	                <div class="section_hot">
						<div class="hotBook">
							<p style="text-align:left"><b>사회/정치</b></p><br>
							<a href=""><img src="/bookmall/img/book_4.png" width="200" height="300" align="left" float="left" ></a>
			                <a href=""><b>데스퍼레이트 그라운드</b></a><br> <!-- btitle_first -->
			                <p>햄프턴 사우스 저</p> <!-- author -->
			                <p>플래닛 미디어</p><br>  <!-- publisher -->
							<p><b>22,500원</b></p> <!-- salesprice -->
						</div>
             	 	</div>	
	                <div class="section_hot">
						<div class="hotBook">
							<p style="text-align:left"><b>사회/정치</b></p><br>
							<a href=""><img src="/bookmall/img/book_4.png" width="200" height="300" align="left" float="left" ></a>
			                <a href=""><b>데스퍼레이트 그라운드</b></a><br> <!-- btitle_first -->
			                <p>햄프턴 사우스 저</p> <!-- author -->
			                <p>플래닛 미디어</p><br>  <!-- publisher -->
							<p><b>22,500원</b></p> <!-- salesprice -->
						</div>
             	 	</div>	
	                <div class="section_hot">
						<div class="hotBook">
							<p style="text-align:left"><b>사회/정치</b></p><br>
							<a href=""><img src="/bookmall/img/book_4.png" width="200" height="300" align="left" float="left" ></a>
			                <a href=""><b>데스퍼레이트 그라운드</b></a><br> <!-- btitle_first -->
			                <p>햄프턴 사우스 저</p> <!-- author -->
			                <p>플래닛 미디어</p><br>  <!-- publisher -->
							<p><b>22,500원</b></p> <!-- salesprice -->
						</div>
             	 	</div>	
	                <div class="section_hot">
						<div class="hotBook">
							<p style="text-align:left"><b>사회/정치</b></p><br>
							<a href=""><img src="/bookmall/img/book_4.png" width="200" height="300" align="left" float="left" ></a>
			                <a href=""><b>데스퍼레이트 그라운드</b></a><br> <!-- btitle_first -->
			                <p>햄프턴 사우스 저</p> <!-- author -->
			                <p>플래닛 미디어</p><br>  <!-- publisher -->
							<p><b>22,500원</b></p> <!-- salesprice -->
						</div>
             	 	</div>		
            </div>
        </div>
        <!-- 인기 있는 도서 영역 종료  -->
</div>   
       
        <!-- FOOTER 시작 -->
        <%@ include file="/WEB-INF/view/include/footer.jsp" %>
        <!-- FOOTER 종료 -->
</body>
</html>