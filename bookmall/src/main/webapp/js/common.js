$(function() {
	$(".depth1 > li").mouseover(function() { /* 선택자에 마우스를 오버 -> 실행 됨 */
	    //console.log($(this));
	    $(this).find(".depth2").stop().slideDown();
	}).mouseleave(function() {
	    $(this).find(".depth2").stop().slideUp();
	});
	
       
	//퀵메뉴
	var quick_left = $(".menu > ul:first-child").position().left + 1350;
	var quick_top = $(".menu > ul:first-child").position().top + 10;
	//console.log(quick_left);
	$(".quickMenu").css({
	    top : quick_top,
	    left : quick_left
	})
	// 스크롤이벤트 좌표 변경
	$(window).scroll(function() {
	    var newTop = $(window).scrollTop() + quick_top + "px";
	    //$(".quickMenu").css("top",newTop);
	    $(".quickMenu").stop().animate({
	        "top":newTop
	    }, 250);
	});
	// goTop클릭하면 맨위로 이동
	$(".goTop").click(function(){
	    $("html").animate({scrollTop:0},200);
	});           
});
function selectDate(name) {
	$.datepicker.setDefaults({
    	        dateFormat: 'yy-mm-dd',
    	        prevText: '이전 달',
    	        nextText: '다음 달',
    	        monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
    	        monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
    	        dayNames: ['일', '월', '화', '수', '목', '금', '토'],
    	        dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
    	        dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
    	        showMonthAfterYear: true,
    	        yearSuffix: '년'
    });
    $( "#"+name ).datepicker();
}

function popupCookie(name) {
	var today = new Date();
	today.setDate(today.getDate()+1);
	document.cookie = "mainPopup=popup;path=/;expires="+today.toGMTString()+";"; //쿠키에 저장
	$("."+name).hide();
}    

function setEditor(holder){
	var oEditors = [];
	nhn.husky.EZCreator.createInIFrame({
		oAppRef: oEditors,
		elPlaceHolder: holder,
		sSkinURI: "/project/smarteditor/SmartEditor2Skin.html",	
		htParams : {
			bUseToolbar : true,				// 툴바 사용 여부 (true:사용/ false:사용하지 않음)
			bUseVerticalResizer : true,		// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
			bUseModeChanger : true,			// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
			fOnBeforeUnload : function(){
				//alert("아싸!");	
			}
		}, //boolean
		fOnAppLoad : function(){
			//예제 코드
			//oEditors.getById["contents"].exec("PASTE_HTML", ["로딩이 완료된 후에 본문에 삽입되는 text입니다."]);
		},
		fCreator: "createSEditor2"
	});
	

	return oEditors;
}   