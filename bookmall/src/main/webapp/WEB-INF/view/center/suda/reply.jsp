<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>수다게시판 답변</title>
    <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css"/>
    <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
    <link rel="stylesheet" href="/bookmall/css/reset.css"/>
    <link rel="stylesheet" href="/bookmall/css/common.css"/>
    <link rel="stylesheet" href="/bookmall/css/contents.css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
    <script src="/bookmall/js/common.js"></script>
    <Script src="htttps://malsup.github.io/jquery.form.js"></Script>
    <script type="text/javascript" src="/bookmall/smarteditor/js/HuskyEZCreator.js"></script>
</head>
    <script>
	    var oEditors;
	    $(function(){
	    	oEditors = setEditor("contents");
	    });
    	function goSave() {
    		if ($("#title").val() == '') {
    			alert("제목을 입력하세요");
    			$("#title").focus();
    			return;
    		}
    		oEditors.getById['contents'].exec("UPDATE_CONTENTS_FIELD",[]);
    		$("#insertFrm").submit();
    	}
    </script>
</head>
<body>
    <div class="wrap">
    	<%@ include file="/WEB-INF/view/include/header.jsp" %>
    		<div class="sub">
            <div class="size">
                <h3 class="sub_title">수다게시판 답변</h3>
                <div class="bbs">
                <form method="post" name="frm" id="insertFrm" action="insertReply.do" enctype="multipart/form-data" >
                <input type="hidden" name="gno" value="${data.gno }">
                <input type="hidden" name="ono" value="${data.ono }">
                <input type="hidden" name="nested" value="${data.nested }">
                <input type="hidden" name="category" value="${data.category }">
                <input type="hidden" name="secret" value="1">
                    <table class="board_write">
                       <tbody>
                         <tr>
							<th scope="row"><label for="">카테고리</label></th>
							<td colspan="10">
								<p style="color:#000000">
								<c:if test="${data.category == 1 }">도서서평</c:if>
                            	<c:if test="${data.category == 2 }">도서이벤트</c:if>
                            	<c:if test="${data.category == 3 }">도서명언</c:if>
                            	<c:if test="${data.category == 4 }">도서추천</c:if>
                            	<c:if test="${data.category == 5 }">도서모임</c:if>
                            	<c:if test="${data.category == 6 }">도서나눔</c:if>
                            	<c:if test="${data.category == 7 }">도서찾기</c:if>
                            	<c:if test="${data.category == 8 }">기타</c:if>  
                            	</p>
                            </td>
                        </tr>
                        <tr>
                            <th>제목</th>
                            <td>
                                <input type="text" name="title" id="title" style="width:100%;" value="[Re]${data.title }"/>
                            </td>
                        </tr>
                        <tr>
 						<th scope="row"><label for="">내용</label></th>
							<td colspan="10">
								<textarea id="contents" name="content" title="내용을 입력해주세요" style="width:100%;"></textarea>	
							</td>
                        </tr>
                        </tbody>
                    </table>
                    <div class="btnSet"  style="text-align:right;">
                        <a class="btn" href="index.do">목록</a>
                        <a class="btn" href="javascript:goSave();">등록</a>
                    </div>
                    </form>
                </div>
            </div>
        </div>
        <%@ include file="/WEB-INF/view/include/footer.jsp" %>
    </div>
</body>
</html>