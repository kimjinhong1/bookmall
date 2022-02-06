<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<html>
<head>
<title>통합검색</title>
<link href="<%=request.getContextPath()%>/css/search.css" rel="stylesheet" type="text/css"/>
<link rel="stylesheet" href="/bookmall/css/reset.css"/>
<link rel="stylesheet" href="/bookmall/css/common.css"/>
<link rel="stylesheet" href="/bookmall/css/contents.css"/>
<link rel="stylesheet" href="/bookmall/css/search.css"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">
<script src="/bookmall/js/common.js"></script>
<script>
function category_one(bclassify) {
	$.ajax ({
		url : 'category2.do',
		data : {
			bclassify : bclassify
		},
		datatype : "JSON",
		async:false,
		success:function(res) {
			$('#category_two_select').empty();
			$('#category_two_defalt').empty();
			$('#category_three_select').empty();
			$('#category_three_defalt').empty();
			$('#category_three_defalt').append("<span >대분류를 선택 해 주세요</span>");
			
			var html = "";
			html += "<h2 style='background-color: #004080; color:#fff;'>대분류</h2>";
			for(var i=0; i < res.length; i++) {
				html += '<span class="bcategoryno" id="bcategoryno_'+res[i].bcategoryno+'" value="'+res[i].bcategoryno+'" onclick="category_two('+res[i].bclassify+', '+res[i].bcategoryno+', \''+res[i].bcategoryname+'\');">'+res[i].bcategoryname+"</span><br>"
			}
			
			$("#category_two_select").append(html);
			
		},
		error : function(error) {
			console.log("error!")
		}
	});
}

function category_two(bclassify, bparentno, bcategoryname) {
	$.ajax ({
		url : 'category2.do',
		data : {
			bclassify : bclassify,
			bparentno : bparentno
		},
		datatype : "JSON",
		async:false,
		success:function(res) {
			$('#category_three_defalt').empty();
			//var checkColor;
			$('#category_three_select').empty();
			
			var html = "";
			var select ="";
			
			html += "<h2 style='background-color: #004080; color:#fff;'>중분류</h2>";
			for(var i=0; i < res.length; i++) {
				html += '<span id="bcategoryno_'+res[i].bcategoryno+'" onclick="category_three('+bparentno+', '+res[i].bcategoryno+', \''+res[i].bcategoryname+'\');">'+ res[i].bcategoryname+"</span><br>"
			}
			
			$("#category_three_select").append(html);
			
			// 대분류 카테고리 선택 유무
			if($("#bcategoryno2_"+bparentno).length) {
				//$("#bcategoryno_"+bparentno).css('color','black');
				$("#bcategoryno2_"+bparentno).remove();
				return;
			} else {
				//$("#bcategoryno_"+bparentno).css('color','red');
				select += '<span class="bcategoryno2_" id="bcategoryno2_'+bparentno+'"><input type="hidden" name="bparentnoS"  value="'+bparentno+'" >'+bcategoryname+'<button style="color:red;" onclick="delcate('+bparentno+')">&nbsp;X</button>&nbsp;&nbsp;</span>&nbsp;&nbsp;'
				//select +=
			}
			$("#searchForm_Condition_Add").append(select);
			
			
		},
		error : function(error) {
			console.log("error!")
		}
	});
}

function category_three(bparentno, bcategoryno, bcategoryname) {
	var select ="";
	// 카테고리
	var no = '+bcategoryno+'
	// 중분류 카테고리 선택 유무
	if($("#bcategoryno2_"+bcategoryno).length) {
		//$("#bcategoryno_"+bcategoryno).css('color','black');
		$("#bcategoryno2_"+bcategoryno).remove();
		return;
	} else {
		//$("#bcategoryno_"+bcategoryno).css('color','red');
		select += '<span class="bcategoryno2_" id="bcategoryno2_'+bcategoryno+'"><input type="hidden" name="bcategorynoS"  value="'+bcategoryno+'">'+bcategoryname+'<button style="color:red;" onclick="delcate('+bcategoryno+')">&nbsp;X</button>&nbsp;&nbsp;</span>&nbsp;&nbsp;'
		// 중분류 선택시 해당 상위 대분류 선택에서 제외
		$("#bcategoryno2_"+bparentno).remove();
	}
	$("#searchForm_Condition_Add").append(select);
}

function delcate(cate) {
	$("#bcategoryno2_"+cate).remove();
}

function searchBtn(rp) {
	if (typeof rp !== 'undifined') {
		var rp = 1;
	}
	if ($("#searchWord").val().trim() == '') {
		alert("검색어를 입력해주세요.");
		return
	}
	console.log('검색시작');
	console.log($("#searchForm").serialize()+"&page="+rp+"&"+$("#searchForm_Condition").serialize());
	$.ajax({
		type : "get",
		data : 
			$("#searchForm").serialize()+"&page="+rp+"&"+$("#searchForm_Condition").serialize()
		,
		url : "search.do",
		success : function(data) {
			$('#search_data').empty();
			var booklist = data.booklist;
			var totCount = data.totCount;
			var totPage = data.totPage;
			var page = data.page;
			//var pageArea = data.pageArea;
			console.log("성공")
			console.log(booklist)
			console.log(totCount)
			//페이징 처리
			var startPage = (page-1)/10*10+1;
			var endPage = startPage + 10 - 1;
			if (endPage > totPage) endPage = totPage;
			
			var search = "";
			
			//search += '<div class="size">'
			search += '<table class="list">'
			search += '<caption>도서 목록</caption>'
			search += '<colgroup>'
			search += '<col width="10px" />'
			search += '<col width="100px" />'
			search += '<col width="250px" />'
			search += '<col width="100px" />'
			search += '<col width="100px" />'
			search += '<col width="50px" />'
			search += '</colgroup>'
			search += '<tbody>'
				if (booklist == "") {
					search += '검색결과가 없습니다.'
				}
				for(var i=0; i < booklist.length; i++) {
					search += '<tr class="board_tr" data-boardno="'+booklist[i].bookno+'" style="cursor: pointer;">'
					search += '<td class="first">'
					search += '<input type="checkbox" name="bookno" id="bookno" value="">'
					search += '</td>'
					search += '<td class="bookimg">'
					search += '<a href="/bookmall/book/detail.do?bookno='+booklist[i].bookno+'" >'
					search += '<img src="/bookmall/upload/'+booklist[i].bthumb_real+'" width="150"></a></td>'
					search += '<td class="txt_l" style="text-align:left;"><h2><a href="/bookmall/book/detail.do?bookno='+booklist[i].bookno+'" >'+booklist[i].btitle_first+'</h2>'+booklist[i].btitle_second+'</a></td>'
					search += '<td>'+booklist[i].author+' 저 | '+booklist[i].publisher+' | '+booklist[i].pubdate+'</td>'
					search += '<td>'+booklist[i].salesprice+' 원  </td>'
					search += '<td class="review"> 회원 리뷰(건) | 별점</td>'
					search += '<td class="bintroduce">'+booklist[i].bintroduce+'</td>'
					search += '<td>	<a>수량 선택 :'
					search += '<input type="button" name="minusCount" id="minusCount" value="-" class="">'
					search += '<input type="text" name="bookcount" id="bookcount" value="1" maxlength="10" readonly>'
					search += '<input type="button" name="plusCount" id="plusCount" value="+" class="" ></a>'
					search += '</td>'
					search += '<td class="btnTop">'
					search += '<a id ="cartbtn" name="cartinsert" href="#"></a><strong>장바구니에 담기</strong> </a>'
					search += '</td>'
					search += '<td class="btnMiddle">'
					search += '<a class="btns" href="#" onclick=""><strong>바로 주문하기</strong> </a>'
					search += '</td>'
					search += '<td class="btnBottom">'
					search += '<a class="btns" href="#" onclick=""><strong>리스트에 담기</strong> </a>'
					search += '</td>'
					search += '</tr>'
				}
			search += '</tbody>'
			search += '</table>'
			search += '<div>'
			
			for (var rp = startPage; rp <= endPage; rp++) {
				search += '<a href="#" onclick="searchBtn('+rp+'); return false;" class="page-btn">' + rp + '</a>';
				//search += "	                <a href='javascript:location.href=\""+url+"&page="+rp+"\";'";
				//if (rp ==page) search += "class='current'";
				//search += ">"+rp+"</a>\r\n"; 
			}
			search += '</div>'

			$("#search_data").append(search);
		},
		error : function(data) {
			console.log("error!")
		}
	});
}

$(function(){
	 // 선택 카테고리 초기화
	 $("#initialization").click(function() { 
         $("#searchForm_Condition_Add").empty();   
     }); 

});

</script>
</head>
<body>
	<div id="canvas">
	<%@include file="/WEB-INF/view/include/header.jsp" %>
		<div id="container">
			<div id="content">
				<div class="con_tit">
                	<div class="bbs">				
                		<div style="display: inline-block;">
						<h1 style=" padding: 30px;">통합 검색 </h1>
						<form name="searchForm" class="searchForm" id="searchForm" action="index.do"  method="get">
							<!-- 검색 -->
								<dl>
									<dd>
										<select name="searchType" id="searchType" style="width:160px; height:32px; text-align:center; border-radius: 30px;">
							                <option value="all" <c:if test="${param.searchType=='all'}">selected</c:if>>전체</option>
							                <option value="btitle" <c:if test="${param.searchType=='btitle'}">selected</c:if>>도서명</option>
							                <option value="author" <c:if test="${param.searchType=='author'}">selected</c:if>>저자</option>
							                <option value="publisher" <c:if test="${param.searchType=='publisher'}">selected</c:if>>출판사</option>
						                </select>&nbsp;&nbsp;
							    		<input type="text" id="searchWord" name="searchWord" value="" style=" width:300px;  height:32px; border-radius: 20px 8px 20px 8px;">&nbsp;&nbsp;
							    		<button type="button" onclick="searchBtn();">
							    			<img  src="<%=request.getContextPath()%>/img/search.png" style=" width:25px; height:25px; ">
							    		</button>
							    	</dd>
						    	</dl>
						    	<br>
								<!-- 가격 -->
								<dl style="float : left;">
									<dd>
									<p style="float : left; font-size: 20px;">가격</p>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<input type="radio" name="salesprice" value=0 checked="checked" > 전체&nbsp;&nbsp;&nbsp;&nbsp;
						        	<input type="radio" name="salesprice" value=1 <c:if test="">checked="checked"</c:if>> 1만원 미만&nbsp;&nbsp;&nbsp;&nbsp;
						        	<input type="radio" name="salesprice" value=2 <c:if test="">checked="checked"</c:if>> 1만원 ~ 2만원 미만&nbsp;&nbsp;&nbsp;&nbsp;
						        	<input type="radio" name="salesprice" value=3 <c:if test="">checked="checked"</c:if>> 2만원 ~ 4만원 미만&nbsp;&nbsp;&nbsp;&nbsp;
						        	<input type="radio" name="salesprice" value=4 <c:if test="">checked="checked"</c:if>> 4만원 이상&nbsp;&nbsp;&nbsp;&nbsp;
						        	</dd>
						    	</dl>
						    	<br>
						    	<br>
								<!-- 출간일 -->
								<dl style="float : left;">
									<dd>
									<p style="float : left; font-size: 20px;">출간일</p>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						        	<input type="radio" name="pubdate" value="0" checked="checked" > 전체&nbsp;&nbsp;&nbsp;&nbsp;
						        	<input type="radio" name="pubdate" value="1" <c:if test="">checked="checked"</c:if>> 1개월 이내&nbsp;&nbsp;&nbsp;&nbsp;
						        	<input type="radio" name="pubdate" value="2" <c:if test="">checked="checked"</c:if>> 3개월 이내&nbsp;&nbsp;&nbsp;&nbsp;
						        	<input type="radio" name="pubdate" value="3" <c:if test="">checked="checked"</c:if>> 1년 이내
						        	</dd>
						    	</dl>
						    	<br>
						    	<br>
						    	<br>
						    	<!-- 카테고리 전체 -->
								<dl id="category_all" class="category_all" style="float : left;">
									<!-- 전체분류 -->
									<dd id="category_one" class="category_one" style="float : left; margin-right: 30px;">
										<span class="allcate" onclick="category_one(${vo.korea});" style="font-size: 20px;">국내 도서</span><br><br>
										<span class="allcate" onclick="category_one(${vo.foreign});" style="font-size: 20px">외국 도서</span><br>
									</dd>
									<!-- 대분류 -->
									<dd id="category_two" class="category_two" style="float : left; margin-right: 30px; overflow: auto; width: 200px; height: 200px; ">
										<!-- 전체 분류 미 선택 시  -->
										<span id="category_two_defalt" class="category_two_defalt" >
											<br>
											<span >국내, 외국 분류를 선택 해 주세요</span>
										</span>
										<!-- 전체 분류 선택 시 -->
										<span id="category_two_select" class="category_two_select" >
												<span onclick="category_two();"></span><br>
										</span>
									</dd>
									<!-- 중분류 -->
									<dd id="category_three" class="category_three" style="float : left; margin-right: 30px; overflow: auto; width: 200px; height: 200px;">
										<!-- 전체 분류 미 선택 시  -->
										<span id="category_three_defalt" class="category_three_defalt" >
											<br>
											<span >대분류를 선택 해 주세요</span>
										</span>
										<!-- 전체 분류 선택 시 -->
										<span id="category_three_select" class="category_three_select" >
												<span onclick="category_three();"></span><br>
										</span>
									</dd>
								</dl>
						</form>
						</div>
						<br>
						<div style="display: inline-block; padding: 20px 1px 1px 1px;">
						<form name="searchForm_Condition"  id="searchForm_Condition" action="#"  method="get">
							<button type="reset" id="initialization" class="initialization" >
				    			<img  src="<%=request.getContextPath()%>/img/rerere.png" style=" width:25px; height:25px; ">
				    		</button>
				    		&nbsp;&nbsp;
							<div id="searchForm_Condition_Add" class="searchForm_Condition_Add" style="overflow: auto; width: 470px; height: 100px;border: 1px solid black;"></div>
						</form>
						</div>
					</div>
					<!-- 검색 영역 -->
					<div class="container" id="search_data"></div>
				</div>
			</div>
		</div>
	<%@include file="/WEB-INF/view/include/footer.jsp" %>
	</div>
</body>
</html>