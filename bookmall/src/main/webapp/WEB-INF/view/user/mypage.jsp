<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
<script>
$(function(){
	$(".board_tr").click(function(){
		location.href='askview.do?askno='+$(this).data("askno");
		//console.log($(this).data("boardno"));
	});
});

</script>

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
						<br> <br>
						<div class="text"></div>
						<div class="myinfo">
									 <a href ="/bookmall/user/remove.do">회원 탈퇴</a>
									 <a href ="/bookmall/user/edit.do">회원정보 수정</a>
									 <a href ="/bookmall/addr/addressList.do">나의 주소록</a>
									 </div>
							<br> <br>
						</div>
					</div>
				</div>
			<div class="size">
				<div class="box">
				<p class="title">
					<div class="under">
						<br> <br>
						<div class="text"></div>
							| 최근 주문내역<a href="/bookmall/user/recentorder.do" class="btn">자세히보기▶</a>
							<table class="type">
								<tbody>
									<thead>
										<tr>
											<th scope="col" width="10%">주문번호</th>
											<th scope="col" width="10%">상품</th>
											<th scope="col" width="30%">상품정보</th>
											<th scope="col" width="20%">상품금액</th>
											<th scope="col" width="10%">수량</th>
											<th scope="col" width="10%">결제금액</th>
											<th scope="col" width="10%">주문상태</th>
										</tr>
									</thead>
										<c:if test="${recentOrderInfo eq null or empty recentOrderInfo}">
											<td colspan="9"><center><b>최근 주문내역이 없습니다.</b></center></td>
										</c:if>
								</tbody>
							</table>
								<tbody>
									<tr>
										<c:if test="${cartInfo ne null and not empty cartInfo}">
											<c:forEach var="recentOrder" items="${recentOrderInfo}">
												<td><a href=""
													style="color: black; font-size: 13px; background-color: white; border: 0px solid white">${orders.orderno}
														<br>
												</a> (recentOrder.order_date)</td>
												<td><img src="/bookmall/img/book_1.png" width="100"></td>
												<td>${recentOrder.btitle_first }<br>
													${recentOrder.btitle_second }<br> ${recentOrder.author } |
													${recentOrder.publisher}<br> <br>
												</td>
												<td>${recentOrder.price }</td>
												<td>${recentOrder.bookcount }</td>
												<td>(${recentOrder.salesprice } * ${recentOrder.bookcount })</td>
											</c:forEach>
										</c:if>
									</tr>
								</tbody>
							<br> <br>
						</div>
					</div>
				</div>
			<div class="size">
				<div class="box">
						<p class="title">
						<div class="under">
							<div class="text"></div>
							| 1:1문의내역<a href="/bookmall/ask/askindex.do" class="btn">전체보기▶</a>
								<table class="type">
										<thead>
											<tr>
												<th scope="col" width="10%">문의종류</th>
												<th scope="col" width="30%">제목</th>
												<th scope="col" width="10%">작성일</th>
												<th scope="col" width="10%">답변상태</th>
											</tr>
										</thead>
		                    		    <tbody>
					                 		 <c:if test="${empty askList }">
						                            <tr>
						                                <td class="first" colspan="7"><b>문의내역이 없습니다.</b></td>
						                            </tr> 
					                        </c:if>
				                    	    <c:if test="${!empty askList }">
					                           <c:forEach var="ask" items="${askList }" varStatus="status">
						                          	<tr style="font-size: 15px">
						                                <td>${ask.subject }</td>
						                                <td>
						                                  	<a href="/bookmall/ask/askview.do?askno=${ask.askno }" style="float:left;text-align:left;"><center>${ask.title }</center></a>
						                                </td>
						                                <td class="date">
						                                	<fmt:formatDate value="${ask.regdate}" pattern="yyyy-MM-dd" /></td>
						                                <td>
						                              	  ${ask.status}
						                                </td>
				                         	 		</tr>
				                          	  	</c:forEach>  
		                           			 </c:if>
		                       		 </tbody>
	                    		</table>
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
								<c:if test="${empty dibsList }">
			                            <tr>
			                              <center><b>MyList 내역이 없습니다.</b></center>
			                            </tr> 
		                        </c:if>
                    	   		<c:if test="${!empty dibsList}">
		                           <c:forEach var="mylist" items="${dibsList }" varStatus="status">
		                          		 <th>
					                        <a href="" ><img src=""></a><br>
											<a href="">${mylist.btitle_first }</a>
											<p> ${mylist.btitle_second} </p>
											<p>${mylist.author}  </p>
										</th>
	                          	  	</c:forEach>  
                      			 </c:if>
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