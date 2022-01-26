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
	$(function(){
	    //체크박스 전체 선택&해제
	    $('#checkall').click(function(){
	         if($("#checkall").prop("checked")){
	            $("input[type=checkbox]").prop("checked",true); 
	        }else{
	            $("input[type=checkbox]").prop("checked",false); 
	        };
	    });
	    
	    $(".deleteClick").on('click', function() {
			if (confirm('선택하신 문의사항을 삭제하시겠습니까?')) {
				$.ajax({
					type : 'post',
					url : '/bookmall/ask/deleteAjax.do', // <<-- 처리 요청 URL
					data : $("#askspace").serialize(),
					success : function(res) { // 비동기요청  성공시
						alert('총 '+res.trim()+"건이 삭제되었습니다.");
						location.reload(); // 페이지 새로고침
					}
				});
			}
		});
	
		$(".board_tr").click(function(){
			location.href='askview.do?askno='+$(this).data("askno");
			//console.log($(this).data("boardno"));
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
	                <div class="bbs">
	                    <table class="list">
	                        <colgroup>
	                            <col width="*" />
	                            <col width="100px" />
	                            <col width="800px" />
	                            <col width="100px" />
	                            <col width="100px" />
	                            <col width="*" />
	                        </colgroup>
	                        <thead>
	                            <tr>
	                                <th><input type="checkbox" id="checkall" value="전체선택"></th>
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
			                 <form name="askspace" id="askspace">
		                        <c:if test="${!empty askList  }">
			                           <c:forEach var="ask" items="${askList }" varStatus="status">
			                            <tr class="board_tr" data-askno="${ask.askno}" style="cursor:pointer;">
				                          	<tr style="font-size: 15px">
				                          		<td class="first"><input type="checkbox" name="askno" id="check" value="${ask.askno }"/></td>       
				                                <td>${ask.subject }</td>
				                                <td class="txt_l" style="text-align:left;"> 
				                                    <c:if test="${ask.nested > 0}">
				                                    	<c:forEach begin="1" end="${ask.nested}">&nbsp;&nbsp;&nbsp;</c:forEach>
				                                    	<img src="/project/img/admin/answer_icon.gif">
				                                    </c:if>
				                                <a href="askview.do?askno=${ask.askno }" >${ask.title }</a></td>
				                                <td class="date"><fmt:formatDate value="${ask.regdate}" pattern="yyyy-MM-dd" /></td>
				                                <td> ${ask.status}</td>
		                         	 		</tr>
		                          	  </c:forEach>  
                           	 	</c:if>
                           	 </form>
	                        </tbody>
	                    </table>
			                <a href="javascript:;" class="deleteClick" style="cursor: pointer; font-weight: bold;">&nbsp;&nbsp;&nbsp;삭제</a>
			                <div class="request" style="text-align: right;">
					        <a href="askwrite.do" style="font-size: 15px; font-weight: bold;" >1:1 문의하기</a>
				        </div>
                    </div>
                </div>
               </div>
            </div>
<!-- board area -->           
        <%@ include file="/WEB-INF/view/include/footer.jsp" %>
    </div>
</body>
</html>