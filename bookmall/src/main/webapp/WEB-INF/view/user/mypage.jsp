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
									 <a href ="/bookmall/refund/index.do">반품/교환내역</a>
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
							| 최근 주문내역<a href="/bookmall/user/recentorder.do" class="btn">전체보기▶</a>
							<table class="type">
								<tbody>
									<thead>
										<tr>
											<th scope="col" width="10%">주문일</th>
											<th scope="col" width="10%">주문번호</th>
											<th scope="col" width="30%">주문내역</th>
											<th scope="col" width="10%">수령인</th>
											<th scope="col" width="20%">배송주소</th>
										</tr>
									</thead>
										<c:if test="${recentOrderInfo eq null or empty recentOrderInfo}">
											<td colspan="9"><center><b>최근 주문내역이 없습니다.</b></center></td>
										</c:if>
								<tbody>
									<tr>
									<c:if test="${recentOrderInfo ne null and not empty recentOrderInfo}">
										<c:forEach var="recentOrder" items="${recentOrderInfo}">
										<thead>
											<td><fmt:formatDate value="${recentOrder.order_date}" pattern="yyyy-MM-dd" /></td>
											<td>${recentOrder.orderno}</td>
											<td>${recentOrder.btitle_first }<br>
												${recentOrder.btitle_second }<br> 
												${recentOrder.author } | ${recentOrder.publisher}
											</td>
											<td>${recentOrder.receiver_name}</td>
											<td>${recentOrder.zipcode}<br>
												${recentOrder.addr1}<br>
												${recentOrder.addr2}
											</td>
										</thead>
										</c:forEach>
									</c:if>
									</tr>
								</tbody>
							</table>
							<br>
						</div>
					</div>
				</div>
		<div class="size">
				<div class="box">
				<p class="title">
					<div class="under">
						<br> <br>
						<div class="text"></div>
							| 1:1 문의내역<a href="/bookmall/ask/askindex.do" class="btn">전체보기▶</a>
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
				                          	<tr style="font-size: 10px">
				                                <td>${ask.subject }</td>
				                                <td>
				                                  	<a href="/bookmall/ask/askview.do?askno=${ask.askno }" style="float:left;text-align:left; font-size: 13px;">${ask.title }</a>
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
					                        <a href="/bookmall/book/detail.do?bookno=${mylist.bookno}" ><img src="/bookmall/img/${mylist.bthumb_org}" class="img-thumbnail" style="width: 80px; "></a><br>
											<a href="/bookmall/book/detail.do?bookno=${mylist.bookno}" >${mylist.btitle_first }</a>
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