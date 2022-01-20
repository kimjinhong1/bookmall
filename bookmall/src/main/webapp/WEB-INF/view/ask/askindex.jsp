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
<link rel="stylesheet" href="/bookmall/css/com.css"/>
<link rel="stylesheet" href="/bookmall/css/common.css"/>
<link rel="stylesheet" href="/bookmall/css/contents.css"/>
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
				
	function del() {
		if (confirm("삭제하시겠습니까?")) {
			<%--location.href="delete.do?boardno=${data.boardno}";--%>
			$.ajax({
				url:'deleteAjax.do',
				data:{askno},
				success:function(res) {
					if (res.trim() == '1') {
    					alert('정상적으로 삭제되었습니다.');
    					location.href='askindex.do';
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
	        };
	    });
	});
	
	$(function(){
		$(".board_tr").click(function(){
			location.href='askview.do?askno='+$(this).data("askno");
			//console.log($(this).data("boardno"));
		});
	});
	
	
});
</script>

</head>
<body>
	<div class="wrap">
		<%@ include file="/WEB-INF/view/include/header.jsp"%>
        
<!-- board area -->		
			<div class="sub">
	        	<div class="size">
	        		<h3 class="sub_title">${userInfo.name }님의 &nbsp; 1:1문의내역</h3>    
	                        <a href="askwrite.do" style="cursor: pointer; font-size: 15px;font-weight: bold;">1:1 문의하기 >></a>
	                <div class="bbs">
	                    <table class="list">
	                        <colgroup>
	                            <col width="*" />
	                            <col width="80px" />
	                            <col width="100px" />
	                            <col width="800px" />
	                            <col width="100px" />
	                            <col width="100px" />
	                        </colgroup>
	                        <thead>
	                            <tr>
	                                <th><input type="checkbox" id="checkall" value="전체선택"></th>
	                                <th>글번호</th>
	                                <th>문의사항</th>
	                                <th>제목</th>
	                                <th>작성일</th>
	                                <th>답변상태</th>
	                            </tr>
	                        </thead>
	                        <tbody>
		                 		 <c:if test="${empty askList }">
			                            <tr>
			                                <td class="first" colspan="7">문의내역이 없습니다.</td>
			                            </tr> 
		                        </c:if>
	                      		  <c:if test="${!empty askList }">
		                       	    <c:forEach var="ask" items="${askList }" varStatus="status">
			                          	<tr class="board_tr" data-boardno="${ask.askno}" style="cursor:pointer;">
				                          		<td>
			                       					<label> 
														<input type="checkbox" name="cartno" value="${cart.cartno }" id="1">${cart.bookno}
													</label>
				                          		</td>
				                          	    <td>    
				                          	  	  ${ask.askno}
				                                </td>
				                                <td>
						                            <c:if test="${ask.subject == '상품문의' }">상품문의</c:if>
					                            	<c:if test="${ask.subject == '결제문의' }">결제문의</c:if>
					                            	<c:if test="${ask.subject == '배송문의' }">배송문의</c:if>
					                            	<c:if test="${ask.subject == '교환/반품문의' }">교환/반품문의</c:if>
					                            	<c:if test="${ask.subject == '취소/환불문의' }">취소/환불문의</c:if>
					                            	<c:if test="${ask.subject == '기타문의' }">기타문의</c:if>
				                                </td>
				                               	<td> ${ask.title }</td>
				                                 <td class="date"><fmt:formatDate value="${ask.regdate}" pattern="yyyy-MM-dd" /></td>
				                                 <td class="status">${ask.status}</td>
			                            </tr>
		                            </c:forEach>
	                        	</c:if>    
	                        </tbody>
	                    </table>
	                <a href="javascript:;" class="deleteClick" style="cursor: pointer; font-weight: bold;">삭제</a>
                    </div>
	                    <!-- 페이지처리 -->
						${pageArea }
						<div class="bbsSearch" style="max-width:600px">
	                        <form method="get" name="searchForm" id="searchForm" action="">
	                            <span class="srchSelect">
	                            </span>
	                        </form>                        
	                    </div>
	                </div>
	               </div>
	            </div>
<!-- board area -->           
        <%@ include file="/WEB-INF/view/include/footer.jsp" %>
    </div>
</body>
</html>