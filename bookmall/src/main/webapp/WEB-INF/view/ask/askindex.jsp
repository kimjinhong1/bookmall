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
	$(function() {
				$(".replycontents").hide();//content 클래스를 가진 div를 표시/숨김(토글)
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
				
	$(function() {
		$("#cartbtn").click(function(){
			$.ajax({
				url: '/bookmall/cart/add',
				type: 'POST',
				data: {
					bookno : 10
					
				},
				success: function(result){
					alert('장바구니에 등록되었습니다.');
					$(".bookcount").val("1");
				}
			})
		});
	});
	
	function del() {
		if (confirm("삭제하시겠습니까?")) {
			//location.href="delete.do?boardno=${data.boardno}";
			$.ajax({
				url:'deleteAjax.do',
				data:{askno:${ask.askno}},
				success:function(res) {
					if (res.trim() == '1') {
    					alert('정상적으로 삭제되었습니다.');
    					location.href='index.do';
					} else {
						alert('삭제 오류');
					}
				}
			});
		}
	}
	
	$(function(){
	    //체크박스 전체 선택&해제
	    $('#checkall').click(function(){
	         if($("#checkall").prop("checked")){
	            $("input[type=checkbox]").prop("checked",true); 
	        }else{
	            $("input[type=checkbox]").prop("checked",false); 
	        }
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
				<br> <br>
			</div>
			<div class="size">
				<div class="box">
					<p class="title">
					<div class="under">
						<div class="text"></div>
						<a href="/bookmall/ask/askwrite.do" class="btn">1:1 문의하기▶</a>
						<table class="type2">
							<c:forEach var="ask" items="${askselect}">
								<thead>
									<tr>
										<th scope="col" width="5%"></th>
										<th scope="col" width="5%">문의번호</th>
										<th scope="col" width="20%">문의종류</th>
										<th scope="col" width="50%">문의내용</th>
										<th scope="col" width="10%">문의일자</th>
										<th scope="col" width="10%">답변상태</th>
									</tr>
									<tr>
										<td>
										<label> 
												<input type="checkbox" name="cartno" value="${ask.askno }" id="1">
										</label>
										</td>
										<td>${ask.askno}</td>
										<td>${ask.subject }</td>
										<td style="word-break: break-all; word-wrap: break-word;">
											${ask.content }</td>
										<td>${ask.regdate}</td>
										<td>${answer.answerdate }<br>${answer.status }</td>
									</tr>
								</thead>
							</c:forEach>
						</table>
						<table class="type2">
							<thead>
								<tr>
									<div class="replytitle">
										<%-- 제목으로 보일부분 --%>
										└ '${userInfo.name }'님 '${ask.asktitle }'에 대한 답변입니다.
									</div>
									<div class="replycontents">
										<%-- 클릭시 보여질 부분 --%>
										${answer.content }
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
			<a href="javascript:del();" class="btn">삭제</a>
		</div>
	</div>
	<%@ include file="/WEB-INF/view/include/footer.jsp"%>
</body>
</html>