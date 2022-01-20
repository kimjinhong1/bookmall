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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
<script src="/bookmall/js/common.js"></script>
<script>
	</script>
	<script>
	$(function(){
	    //체크박스 전체 선택&해제
	    $('#ck_all').click(function(){
	         if($("#ck_all").prop("checked")){
	            $("input[type=checkbox]").prop("checked",true); 
	        }else{
	            $("input[type=checkbox]").prop("checked",false); 
	        }
	    });
	 
	    $('#delete').click (function (){
	        if(confirm("삭제하시겠습니까?")){
	            $("input[name=checkRow]:checked").each(function(){
	                var tr_value =$(this).val();
	                var tr=$("tr[data-tr_value='"+tr_value+"']");
	                tr.remove();
	            });
	        }else{
	            return false;
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
				<div class="slogan">마이리스트</div>
			</div>
			<div class="size">
				<div class="box">
						<table class="type2">
							<c:forEach var="mylist" items="${mylistInfo}">
							<thead>
							        <colgroup>
							            <col width="10%;"/>
							            <col width="30%;"/>
							            <col width="40%;"/>
							            <col width="20%;"/>
							        </colgroup>
								<tr>
									<td>
										<label> 
											<input type="checkbox" name="mylistCheck" value="${mylist.listno }" id="1">${mylist.bookno}><br>
										</label>
									</td>
									<td>
										<img src="/bookmall/img/book_1.png" width="80"><br>
									</td>
									<td>
										${mylist.btitle_first }<br>
									</td>
									<td>
										<a class="mylistwrite" 
											href="/bookmall/board/review.do"
											style="border: 1px solid black; width: 80px; cursor: pointer; font-size: 13px; ">리뷰작성</a><br><br>
										<a class="mylistwrite" 
											href="/bookmall/user/cart.do"
											style="border: 1px solid black; width: 100px; cursor: pointer; font-size: 13px; ">장바구니담기</a>
									</td>
								</tr>
                            </tbody>
                            </c:forEach>
                        </table>
                        </div>
					</div>
				</div>
			</div>
		<div class="container">
	    <div class="btnSet clear"style="text-align:left; ">
            <input type="checkbox" id="ck_all" value="전체선택">
             <span style="background-color:white; border:none; font-size: 16px; font-weight: bold;">전체선택</span>&emsp;
            <input type="button" id="delete" value="삭제" style="background-color:white; border:none;font-size: 16px; font-weight: bold; cursor: pointer;">
        </div>
		</div>
<br />
	<%@ include file="/WEB-INF/view/include/footer.jsp"%>

</body>
</html>