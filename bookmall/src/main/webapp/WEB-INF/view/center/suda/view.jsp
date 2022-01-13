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
    <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css"/>
    <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>    
    <link rel="stylesheet" href="/bookmall/css/reset.css"/>
    <link rel="stylesheet" href="/bookmall/css/common.css"/>
    <link rel="stylesheet" href="/bookmall/css/contents.css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
    <script src="/bookmall/js/common.js"></script>
<script>
function goDelete(){
	if (confirm('정말로 삭제하시겠습니까?')) {
		location.href='delete.do?no=${data.no }';
	}
}
</script>  
</head>
<body>
    <div class="wrap">
       <%@ include file="/WEB-INF/view/include/header.jsp" %>
          <div class="sub">
            <div class="size">
                <h3 class="sub_title">수다게시판</h3>
                <div class="bbs">
                    <div class="view">
                        <div class="title">
                            <dl>
                            	<c:if test="${data.category == 1 }">도서서평</c:if>
                            	<c:if test="${data.category == 2 }">도서이벤트</c:if>
                            	<c:if test="${data.category == 3 }">도서명언</c:if>
                            	<c:if test="${data.category == 4 }">도서추천</c:if>
                            	<c:if test="${data.category == 5 }">도서모임</c:if>
                            	<c:if test="${data.category == 6 }">도서나눔</c:if>
                            	<c:if test="${data.category == 7 }">도서찾기</c:if>
                            	<c:if test="${data.category == 8 }">기타</c:if>
                            	
                                <dt>${data.title } </dt>
                                <dd class="date">작성일 : ${data.regdate } </dd>
                            </dl>
                        </div>
                        <div class="content"><p>${data.content }</p> </div>
                        <dl class="file">
                            <dt>첨부파일 </dt>
                            <dd>
                            <a href="/bookmall/common/download.jsp?path=/upload/&org=${data.filename_org }&real=${data.filename_real}" 
                            target="_blank">${data.filename_org } </a></dd>
                        </dl>
                                    
                        <div class="btnSet clear">
                            <div class="fl_l">
                               <a href="index.do" class="btn">목록으로</a>
                               <a href="edit.do?sudano=${data.no }" class="btn">수정하기</a>                               
                               <a class="btn" href="javascript:goDelete();">삭제하기 </a>                               
                            </div>
                        </div>
                                       
                    </div>
                    <div>
                    <c:if test="${!empty userInfo }">
                    <form method="post" name="frm" id="frm" action="" enctype="multipart/form-data" >
                       <input type="hidden" name="tablename" value="board"> <!-- 서버로 전송 테이블 구분값-->
                       <input type="hidden" name="no" value="${data.no }">  <!-- 서버로 전송 boardno-->
                       <input type="hidden" name="userno" value="${userInfo.userno }"> <!-- 서버로 전송 사용자PK-->
                        <table class="board_write">
                            <colgroup>
                                <col width="*" />
                                <col width="100px" />
                            </colgroup>
                            <tbody>
                            <tr>
                                <td>
                                    <textarea name="content" id="content" style="height:50px;"></textarea> <!-- 서버로 전송 댓글내-->
                                </td>
                                <td>
                                    <div class="btnSet"  style="text-align:right;">
                                        <a class="btn" href="javascript:goSave();">저장 </a>
                                    </div>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                        </form>
                  </c:if>
                       <div id="commentArea"></div>
                    
                    </div>
                </div>
            </div>
        </div>
        <%@ include file="/WEB-INF/view/include/footer.jsp" %>     
    </div>
</body>
</html>