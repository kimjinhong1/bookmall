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
    <title>수다게시판 목록</title>
    <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css"/>
    <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
    <link rel="stylesheet" href="/bookmall/css/reset.css"/>
    <link rel="stylesheet" href="/bookmall/css/com.css"/>
    <link rel="stylesheet" href="/bookmall/css/common.css"/>
    <link rel="stylesheet" href="/bookmall/css/contents.css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
    <script src="/bookmall/js/common.js"></script>
    <script src="/bookmall/js/main.js"></script>
</head>
<body>
    <div class="wrap">
        <%@ include file="/WEB-INF/view/include/header.jsp" %>
        
<!-- board area -->		
			<div class="sub">
	        	<div class="size">
	        		<h3 class="sub_title">수다게시판</h3>    
	                <div class="bbs">
	                    <table class="list">
	                    <p>
	                    	<span><strong>총 ${totCount }</strong>  |  ${sudaVo.page }/${totPage }페이지</span>
       						<span style="text-align:right;float:right">
							<select id="numsel" onchange="$('#numchoose').val($('#numsel').val());$('#searchForm').submit();">
								<option value="10" <c:if test="${10 == sudaVo.numchoose}">selected</c:if>>10개씩</option>
								<option value="20" <c:if test="${20 == sudaVo.numchoose}">selected</c:if>>20개씩</option>
								<option value="30" <c:if test="${30 == sudaVo.numchoose}">selected</c:if>>30개씩</option>
							</select>
							</span>
	                    </p>
	                        <caption>FAQ</caption>
	                        <colgroup>
	                            <col width="80px" />
	                            <col width="200" />
	                            <col width="*px" />
	                            <col width="100px" />
	                            <col width="100px" />
	                            <col width="100px" />
	                        </colgroup>
	                        <thead>
	                            <tr>
	                                <th>번호</th>
	                                <th>카테고리</th>
	                                <th>제목</th>
	                                <th>작성자</th>
	                                <th>작성일</th>
	                                <th>조회수</th>
	                            </tr>
	                        </thead>
	                        <tbody>
	                  <c:if test="${empty list }">
	                            <tr>
	                                <td class="first" colspan="7">등록된 글이 없습니다.</td>
	                            </tr> 
	                        </c:if>
	                        <c:if test="${!empty list }">
	                           <c:forEach var="vo" items="${list }" varStatus="status">
	                          	<tr class="board_tr" style="cursor:pointer;">   
	                          	    <td>    
	                          	    <c:if test="${vo.top_notice == 1 }">[공지]</c:if>
	                          	    <c:if test="${vo.top_notice == 0 }">${(totCount-status.index) - ((sudaVo.page -1)*10)}</c:if>
	                                
	                                </td>
	                                <td>
		                            <c:if test="${vo.category == 1 }">도서서평</c:if>
	                            	<c:if test="${vo.category == 2 }">도서이벤트</c:if>
	                            	<c:if test="${vo.category == 3 }">도서명언</c:if>
	                            	<c:if test="${vo.category == 4 }">도서추천</c:if>
	                            	<c:if test="${vo.category == 5 }">도서모임</c:if>
	                            	<c:if test="${vo.category == 6 }">도서나눔</c:if>
	                            	<c:if test="${vo.category == 7 }">도서찾기</c:if>
	                            	<c:if test="${vo.category == 8 }">기타</c:if>
	                                </td>
	                               <td class="txt_l" style="text-align:left;">
		                                <c:if test="${vo.nested > 0 }">
	                                 	<c:forEach begin="1" end="${vo.nested}">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</c:forEach>
	                                	<img src="/bookmall/img/reply_icon3.png" style='width:25px;'>    
                               		    </c:if>
	                                     <a href="view.do?sudano=${vo.no }" >${vo.title } [${vo.c_count }]</a>
	                                     ${CommonUtil.getNewIcon(vo.regdate, vo.new_icon) }
	                                </td>
	                                <td class="userno">${vo.name} </td>
	                                 <td class="date"><fmt:formatDate value="${vo.regdate}" pattern="yyyy-MM-dd" /></td>
	                                 <td class="readcount">${vo.readcount }</td>
	                            </tr>
	                            </c:forEach>
	                        </c:if>    
	                        </tbody>
	                    </table>
                    <div class="btnSet"  style="text-align:right;">
                    <c:if test="${!empty userInfo }">
                        <a class="btn3" href="write.do">글작성 </a>
                    </c:if>
                    <c:if test="${empty userInfo }">
                        <a class="btn3" href="javascript:alert('로그인후 사용가능합니다.');location.href='/bookmall/user/login.do';">글작성</a>
                    </c:if>    
                    </div>
	                    <!-- 페이지처리 -->
						${pageArea }
						<div class="bbsSearch" style="max-width:600px">
	                        <form method="get" name="searchForm" id="searchForm" action="">
	                            <span class="srchSelect">
	                                <select id="stype" name="searchCategory" class="dSelect" title="검색분류 선택">
	                                    <option value="">전체</option>  
	                                    <option value="1" <c:if test="${param.searchCategory=='1'}">selected</c:if>>도서서평</option>
	                                    <option value="2" <c:if test="${param.searchCategory=='2'}">selected</c:if>>도서이벤트</option>
	                                    <option value="3" <c:if test="${param.searchCategory=='3'}">selected</c:if>>도서명언</option>
	                                    <option value="4" <c:if test="${param.searchCategory=='4'}">selected</c:if>>도서추천</option>
	                                    <option value="5" <c:if test="${param.searchCategory=='5'}">selected</c:if>>독서모임</option>
	                                    <option value="6" <c:if test="${param.searchCategory=='6'}">selected</c:if>>도서나눔</option>
	                                    <option value="7" <c:if test="${param.searchCategory=='7'}">selected</c:if>>도서찾기</option>
	                                    <option value="8" <c:if test="${param.searchCategory=='8'}">selected</c:if>>기타</option>
	                                </select>	                            
	                            
	                                <select id="stype" name="searchType" class="dSelect" title="검색분류 선택">
	                                    <option value="">전체</option>
	                                    <option value="title" <c:if test="${param.searchType=='title'}">selected</c:if>>제목</option>
	                                    <option value="content" <c:if test="${param.searchType=='content'}">selected</c:if>>내용</option>
	                                </select>
	                            </span>
	                            <span class="searchWord">
	                                <input type="text" id="sval" name="searchWord" value="${param.searchWord }"  title="검색어 입력">
	                                <input type="button" id="" value="검색" title="검색">
	                                <input type="hidden" name="numchoose" id="numchoose" value="${sudaVo.numchoose }" >
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