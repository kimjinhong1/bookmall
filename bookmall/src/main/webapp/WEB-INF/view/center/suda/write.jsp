<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
    <Script src="htttps://malsup.github.io/jquery.form.js"></Script>
    <script type="text/javascript" src="/bookmall/smarteditor/js/HuskyEZCreator.js"></script>
<script>
	var oEditors = [];
$(function() {
	nhn.husky.EZCreator.createInIFrame({
		oAppRef: oEditors,
		elPlaceHolder: "contents", // textarea ID
		sSkinURI: "<%=request.getContextPath()%>/smarteditor/SmartEditor2Skin.html",	
		htParams : {
			bUseToolbar : true,				// 툴바 사용 여부 (true:사용/ false:사용하지 않음)
			bUseVerticalResizer : true,		// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
			bUseModeChanger : true,			// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
			fOnBeforeUnload : function(){
				
			}
		}, //boolean
		fOnAppLoad : function(){
			//예제 코드
			//oEditors.getById["contents"].exec("PASTE_HTML", ["로딩이 완료된 후에 본문에 삽입되는 text입니다."]);
		},
		fCreator: "createSEditor2"
	});
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
                <h3 class="sub_title">수다게시판 등록</h3>
                <div class="bbs">
                <form method="post" name="frm" id="insertFrm" action="insert.do" enctype="multipart/form-data" >
                	<input type="hidden" name="secret" value="1">
                    <table class="board_write">
                        <tbody>
                         <tr>
							<th scope="row"><label for="">*카테고리</label></th>
							<td colspan="10">
								<select name="category" id="category">
                              	 	<option value="1">도서서평</option>
                              	 	<option value="2">도서이벤트</option>
                              	 	<option value="3">도서명언</option>
                              	 	<option value="4">도서추천</option>
                              	 	<option value="5">도서모임</option>
                              	 	<option value="6">도서나눔</option>
                              	 	<option value="7">도서찾기</option>
                              	 	<option value="8">기타</option>
                              	 </select>
                            </td>
                        </tr>
                        <tr>
                            <th>제목</th>
                            <td>
                                <input type="text" name="title" id="title" style="width:100%;" value="${data.title }"/>
                            </td>
                        </tr>
                        <tr>
                            <th>내용</th>
                            <td>
                                <textarea id="contents" name="content" title="내용을 입력해주세요" style="width:100%;">${data.content}</textarea>	
                            </td>
                        </tr>
                        <tr>
                            <th>첨부파일</th>
                            <td>
                            	<input type="file" id="file" name="file" class="w100" title="첨부파일을 업로드 해주세요." />
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