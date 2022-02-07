<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="bookmall.util.*" %>
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
    <link rel="stylesheet" href="/bookmall/css/contents.css"/>
    
    <!-- js -->
    <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
    <script src="/bookmall/js/common.js"></script>
    <script src="/bookmall/js/main.js"></script>
	
	<script>
		$(function(){
			$('#minusCount').click(function() {
				if($("#bookcount").val() <= 1) {
					alert("최소 수량은 1권입니다.");
				} else {
					var bc = $("#bookcount").val();
					bc--;
					$("#bookcount").val(bc);
				}
			});
			
			$('#plusCount').click(function() {
				if($("#bookcount").val() > 100) {
					alert("최대 수량은 100권입니다.");
				} else {
					var bc = $("#bookcount").val();
					bc++;
					$("#bookcount").val(bc);
				}
			})
		});
	</script>

<script>
function goSave() {
    $.ajax({ 
       url:'/bookmall/center/review/insert.do', 
       type:'post', 
       data:$("#frm").serialize(), 
       success:function(res) {
          if (res.trim() == 1) { 
             alert('댓글이 등록되었습니다.');
             $("#frm #content").val("");
             reviewList(${data.bookno}); 
          } else { 
             alert("댓글 등록 오류");
          }
       }
    })
 }

 function reviewList(bookno, page) {
    $.ajax({
       url : '/bookmall/center/review/list.do', 
       data : {bookno:bookno, page:page},  
       success : function(res) { 
          $("#bookReview").html(res);
       }
    })
 }
 $(function() { 
    reviewList(${data.bookno}, 1); 
 })
 
 function goDelete(no) {  
	   if (confirm('댓글을 삭제하시겠습니까?')) { 
		   $.ajax ({
			 	url:"/bookmall/center/review/delete.do", 
			 	data: {no : no}, 
			 	success: function(res){
			 		if(res.trim() =='1') {  
			 			reviewList(${data.bookno}); 
			 		} else {
			 			alert('댓글 삭제 오류');
			 		}
			 	}
		   })
	   }
 }
 
 function goReply(no) {  
	   if (confirm('댓글을 수정하시겠습니까?')) { 
		   $.ajax ({
			 	url:"/bookmall/center/review/update.do", 
			 	data: $("#frm"+no).serialize(), 
			 	type:'post',
			 	success: function(res){
			 		if(res.trim() =='1') {  
			             alert('댓글이 수정되었습니다.');
			             $("#tr"+no).hide();
			             reviewList(${data.bookno}); 
			 		} else {
			 			alert('댓글 수정 오류');
			 		}
			 	}
		   })
	   }
 }
 
 function showTr(no){
	 $(".replyTr").hide();
	 $("#tr"+no).show();
 }
 
function socre(bookno) {
    $.ajax({
       url : '/bookmall/center/review/score.do', 
       data : {bookno:bookno},  
       success : function(res) { 
          $("#bookScore").html(res);
       }
    })
 }
$(function() { 
	socre(${data.bookno}, 1); 
 })
 
$(function() {
	$("#cartbtn").click(function(){
		$.ajax({
			url: '/bookmall/cart/add',
			type: 'POST',
			data: {
				bookno : ${data.bookno}, btitle_first : '${data.btitle_first}', salesprice: ${data.salesprice}
				
			},
			success: function(result){
				if (result.trim() == "2") {
					alert("이미 등록되었습니다.");
				} else {
					alert('장바구니에 등록되었습니다.');
				}
			}
		})
	});
});
$(function() {
	$("#listbtn").click(function(){
		$.ajax({
			url: '/bookmall/mylist/insert.do',
			type: 'POST',
			data: {
				bookno : ${data.bookno}, btitle_first : '${data.btitle_first}', author: '${data.author}', publisher: '${data.publisher }'
			},
			success: function(result){
				if (result.trim() == "2") {
					alert("이미 등록되었습니다.");
				} else {
					alert('마이리스트에 등록되었습니다.');
				}
			}
		})
	});
});
</script>  
</head>
<body>
<div class="wrap"> 	
   	<!-- HEADER 시작 -->
    <%@ include file="/WEB-INF/view/include/header.jsp" %>
    <!-- HEADER 종료 -->
    <input type="hidden" name="bookno" value="${data.bookno }">
    
    	<!-- 도서 목록 캡션 시작 -->   
		
			<div class="container">
			<hr>
				<br><h1>도서 정보</h1>
			<hr>
        <!-- 도서 목록 캡션 종료 -->
        
        
    	 <!-- 도서 기본 정보 시작 -->
         <div class="bookNormalInfo">
         	<div class="col-md-5" style="border: 1px; width: 450px; height: 635px; float: left; padding-top: 5px;">
				<img src="/bookmall/upload/${data.bthumb_real }" style="width: 448px; height: 630px;"><br>
			</div>
			
			<div class="col-md-6" style="width: 750px; height: 635px; float: right; padding-top: 10px; text-align: center;" >
				<table style="float: left; width: 750px; height: 635px; ">
					<tr style="padding-top: 3px; padding-left: 5px;">
						<td>*도서명 : </td>
						<td><b>${data.btitle_first }</b>&nbsp;${data.btitle_second }</td>
					</tr>
					<tr style="padding-top: 3px;">
						<td>*저자 : </td>
						<td>${data.author }</td>
					</tr>
					<tr style="padding-top: 3px;">
						<td>*출판사 : </td>
						<td>${data.publisher }</td>
					</tr>
					<c:if test="${data.translator ne '' }">
					<tr style="padding-top: 3px;">
						<td>*번역가 : </td>
						<td>${data.translator }</td>
					</tr>
					</c:if>
					<tr style="padding-top: 3px; ">
						<td>*출간일 : </td>
						<td>${data.pubdate }</td>
					</tr>
					<tr style="padding-top: 3px; ">
						<td>*별점 : </td>
						<td>${data.review_score }</td>
					</tr>
					<tr style="padding-top: 3px;">
						<td>*판매 지수 : </td>
						<td>${data.sales }</td>
					</tr>
					<tr style="padding-top: 3px;">
						<td>*판매가 : </td>
						<td>${data.salesprice }&nbsp;원</td>
					</tr>
					<tr style="padding-top: 3px;">
						<td>*수량선택 : </td>
						<td>
							<input type="button" name="minusCount" id="minusCount" value="-" class="">
		         			<input type="text" name="bookcount" id="bookcount" value="1" style="text-align: center;"readonly>
		         			<input type="button" name="plusCount" id="plusCount" value="+" class="" >	
		         		</td>
		         	</tr>
		         	<tr>
		         		<td>*상품담기 : </td>
		         		<td>
		         			<a href="#" class="btn btn-secondary"> 바로 구매 &raquo;</a>
				 			<a id ="cartbtn" name="cartinsert" href="#" class="btn btn-primary"> 장바구니 담기 &raquo;</a>
				 			<a id ="listbtn" name="mylistinsert" href="#" class="btn btn-success"> 마이리스트 담기 &raquo;</a>
				 		</td>
				 	</tr>
				</table>
				<%-- <div class="btitle" style="width: 750px; height: 60px; padding-top: 5px; padding-left: 20px;">
					<p align="left"><font size="6em"><b>${data.btitle_first }</b></font> &nbsp;&nbsp;&nbsp;<font size="3em">${data.btitle_second }</font>
				</div>
				
				<div class="author" style="width: 750px; height: 60px; padding-top: 5px; padding-left: 20px;">
					<p align="left"><font size="6em"><b>저자 :  </b></font><font size="3em"> ${data.author }</font> 
				</div>
				
				<div class="publisher" style="width: 750px; height: 60px; padding-top: 5px; padding-left: 20px;">
					<p align="left"><font size="6em"><b>출판사 : </b></font><font size="3em"> ${data.publisher }</font> 
				</div>
				
				<div class="pubdate" style="width: 750px; height: 60px; padding-top: 5px; padding-left: 20px;">
					<p align="left"><font size="6em"><b>출간일 : </b></font><font size="3em"> ${data.pubdate }</font> 
				</div>
				
				<div class="review_score" style="width: 750px; height: 60px; padding-top: 5px; padding-left: 20px;">
					<p align="left"><font size="6em"><b>별점 : </b></font> &nbsp;&nbsp;&nbsp;
					<font size="3em"> ${data.review_score }</font> 
				</div>
				
				<div class="sales" style="width: 750px; height: 60px; padding-top: 5px; padding-left: 20px;">
					<p align="left"><font size="6em"><b>판매 지수 : </b></font> &nbsp;&nbsp;&nbsp;
					<font size="3em"> ${data.sales }&nbsp;권</font> 
				</div>
				
				<div class="salesprice" style="width: 750px; height: 60px; padding-top: 5px; padding-left: 20px;">
					<p align="left"><font size="6em"><b>판매가 : </b></font><font size="3em" style="color:red;"> ${data.salesprice }&nbsp;원</font> 
				</div>
				
				<div class="bookCountBtn" style="width: 750px; height: 60px; padding-top: 5px; padding-left: 20px; padding-bottom: 20px;">
					<p align="left"><font size="6em"><b>수량 선택 : </b></font> &nbsp;&nbsp;&nbsp; 
		         		<input type="button" name="minusCount" id="minusCount" value="-" class="">
		         		<input type="text" name="bookcount" id="bookcount" value="1" readonly>
		         		<input type="button" name="plusCount" id="plusCount" value="+" class="" >	
				</div> --%>
				
				
	         	<!-- 구매/장바구니 버튼 시작 -->
	         	<!-- <div class="butSet clear" style="width: 750px; height: 60px; padding-top: 5px; padding-left: 20px;">
					<a href="#" class="btn btn-info"> 바로 구매 &raquo;</a>
				 	<a id ="cartbtn" name="cartinsert" href="#" class="btn btn-info"> 장바구니 담기 &raquo;</a>
				 	<a id ="listbtn" name="mylistinsert" href="#" class="btn btn-info"> 마이리스트 담기 &raquo;</a>
				</div> -->
				<!-- 구매/장바구니 버튼 종료 -->
			</div>
         	<!-- 도서 기본 정보 종료 -->
         	
         	<!-- 도서 정보/리뷰/배송환불 이동 버튼 시작 -->
         	
         	<hr>
			<div class="infoMoveBtn" style="width: 1200px; height: 40px; float: center; ">
				<ul class="viewBtn">
					<li>
						<a href="#bookDetailInfo">도서 정보</a>
					</li>
					<li>
						<a href="#bookReview">리뷰</a>
					</li>
					<li>
						<a href="#bookDeliveryInfo">배송/반품/교환</a>
					</li>
				</ul>
			</div>
			<hr>
			
			<!-- 도서 정보/리뷰/배송환불 이동 버튼 종료 -->
			
			<!-- 도서 상세 정보 시작 -->
			<a name="bookDetailInfo"></</a>
			<a><h2>품목 정보</h2></a><br>
			
         		<table class="bookDetailInfo">
	         		<tr>
	         			<td>출간일</td>
	         			<td>${data.pubdate }</td>
	         		</tr>
	         		<tr>
	         			<td>쪽수</td>
	         			<td>${data.bpages }&nbsp; 쪽</td>
	         		</tr>
	         		<tr>
	         			<td>무게</td>
	         			<td>${data.bweight }&nbsp; g</td>
	         		</tr>
	         		<tr>
	         			<td>크기</td>
	         			<td>${data.bwidth } * ${data.bvertical } * ${data.bheight }&nbsp;mm</td>
	         		</tr>
	         		<tr>
	         			<td>ISBN13</td>
	         			<td>${data.isbn }</td>
	         		</tr>
	         		<tr>
	         			<td>관련 분류</td>
	         			<td><c:forEach items="${list }" var="cate">
				         		<c:if test="${data.classify eq 0}">국내도서 ></c:if>
				         		<c:if test="${data.classify eq 1}">국외도서 ></c:if>
				         		${cate.parentname} >	
			         			${cate.bcategoryname }<br>
			         		</c:forEach>
			         	</td>
			         </tr>
         		</table>
         		<hr>
         		
         		<a><h2>도서 소개</h2></a><br>
         		<hr>
         		<div class="bookInfo">
         			${data.bintroduce }
         		</div>
				
				<a><h2>목차</h2></a>
				<hr>
				<div class="bookIndex">
					${data.bindex }
				</div>         	
				<hr>
				
				<a><h2>도서 리뷰</h2></a><br>
				<div>
				<img src="/bookmall/img/score.png" style='width:100px;'>   
				<b id="bookScore" style="font-size:30px;"></b>/5
				</div>
				</div>
				<div id="bookReview" class="bbs">
				</div>
				
				<div class="bbs">
					<c:if test="${!empty userInfo}">
                    <form method="post" name="frm" id="frm" action="" enctype="multipart/form-data" >
                       <input type="hidden" name="bookno" value="${data.bookno }">  
                       <input type="hidden" name="userno" value="${userInfo.userno }"> 
                        <table class="board_write">
                            <colgroup>
                                <col width="*" />
                                <col width="100px" />
                            </colgroup>
                            <tbody>
                            <tr>
                                <td style="color:#000000;">
                                	<input type="radio" name="score" value="5" checked>5점&nbsp;&nbsp;
                                	<input type="radio" name="score" value="4" >4점&nbsp;&nbsp;
                                	<input type="radio" name="score" value="3" >3점&nbsp;&nbsp;
                                	<input type="radio" name="score" value="2" >2점&nbsp;&nbsp; 
                                	<input type="radio" name="score" value="1" >1점&nbsp;&nbsp; 
                                    <textarea name="content" id="content" placeholder="주제와 무관한 댓글, 악플 등의 글은 임의 삭제될 수 있습니다." style="height:50px;" width:100%;"></textarea> <!-- 서버로 전송 댓글내-->
                                </td>
                                <td>
                                    <div class="btnSet"  style="text-align:right;">
                                        <a class="btn2" href="javascript:goSave();">저장 </a>
                                    </div>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                      </form>
                    </c:if> 
                 </div> 
                 
                <!-- 배송/반품/교환 시작 -->
                <a name="bookDeliveryInfo"></</a>
                <a><h2>배송/반품/교환 안내</h2></a>
         		<table class="bookDelivery">
	         		<span style="color:blue">배송 안내</span>
		         		<tr>
		         			<td>배송 구분</td>
		         			<td>김가네 배송 / 배송비 : 무료배송</td>
		         		</tr>
		        </table>
		        <table class="bookDelivery">
					<span style="color:blue">반품 안내</span>
						<tr>
							<td>반품 방법</td>
							<td>마이페이지 > 반품 신청</td>
						</tr>
						<tr>
							<td>반품 가능기간</td>
							<td>출고 완료 후 10일 이내의 주문 상품</td>
						</tr>
						<tr>
							<td>반품 비용</td>
							<td>김가네에서 반품 비용 전액 부담</td>
						</tr>
				</table>
				<table class="bookDelivery">
					<span style="color:blue">교환 안내</span>
						<tr>
							<td>교환 방법</td>
							<td>마이페이지 > 교환 신청</td>
						</tr>
						<tr>
							<td>교환 가능기간</td>
							<td>출고 완료 후 10일 이내의 주문 상품</td>
						</tr>
						<tr>
							<td>교환 비용</td>
							<td>김가네에서 교환 비용 전액 부담</td>
						</tr>
         		</table>
         			
         		 <!-- 배송/반품/교환 종료-->  
         	</div>
         	<!-- 도서 상세 정보 종료 -->
         	
 
         	</div>
 
        <!-- FOOTER 시작 -->
        <%@ include file="/WEB-INF/view/include/footer.jsp" %>
        <!-- FOOTER 종료 -->
</body>
</html>