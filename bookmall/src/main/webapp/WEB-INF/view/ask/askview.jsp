<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>1:1문의게시판</title>
<link rel="stylesheet"
	href="https://unpkg.com/swiper/swiper-bundle.min.css" />
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
<link rel="stylesheet" href="/project/css/reset.css" />
<link rel="stylesheet" href="/project/css/common.css" />
<link rel="stylesheet" href="/project/css/contents.css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
<script src="/project/js/common.js"></script>
<script>
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
    </script>
</head>
<body>
	<div class="wrap">
		<%@ include file="/WEB-INF/view/include/header.jsp"%>
		<div class="sub">
			<div class="size">
				<h3 class="sub_title">1:1문의내용</h3>
				<div class="bbs">
					<div class="view">
						<div class="title">
							<dl>
								<dt>${ask.title }</dt>
								<dd class="date">작성일 : ${ask.regdate }</dd>
							</dl>
						</div>
						<div class="content">
							<p>${ask.content }</p>
						</div>
						<dl class="file">
							<dt>첨부파일</dt>
							<dd>
								<a
									href="/bookmall/common/download.jsp?path=/upload/&org=${ask.filename_org}&real=${ask.filename_real}"
									target="_blank">${ask.filename_org } </a>
							</dd>
						</dl>

						<div class="btnSet clear">
							<div class="fl_l">
								<a href="/bookmall/ask/askindex.do" class="btn">목록으로</a> <a
									href="edit.do?askno=${ask.askno }" class="btn">수정하기</a> <a
									href="javascript:del();" class="btn">삭제</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<%@ include file="/WEB-INF/view/include/footer.jsp"%>
	</div>
</body>
</html>