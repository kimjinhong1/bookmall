$(function(){
	var swiper = new Swiper(".mySwiper", {
                loop:true,
                autoplay : {
                    delay : 3000
                },
                navigation: {
                nextEl: ".swiper-button-next",
                prevEl: ".swiper-button-prev",
                },
            });
            
            $(".section > img").mouseover(function() {
                $(this).css("margin", "-5px");                
                $(this).css("border", "5px solid #999");
            }).mouseleave(function() {
                $(this).css("margin", "0px")
                $(this).css("border", "");
            });

            $(".divPop").css({
               "top":($(window).height()-$(".divPop").outerHeight())/2+$(window).scrollTop()+"px",
               "left": ($(window).width()-$(".divPop").outerWidth())/2+$(window).scrollLeft()+"px"
            });
            $(".divPop").draggable();

            var swiper2 = new Swiper(".partner_slide", {
                loop:true,
                slidesPerView:5,
                spaceBetween:20,
                autoplay : {
                    delay : 3000
                },                
            });
            
            $(".board_title").click(function() {
                $(".board_title").removeClass("on"); //board_title클래스 선택자에 on클래스 제거
                $(this).addClass("on"); // 클릭한 선택자에 on클래스 추가
                console.log($(this).text());
                if ($(this).text() == '공지사항') {
                    $("#board_data").hide();
                    $("#board_notice").show();
                    
                } else {
                    $("#board_data").show();
                    $("#board_notice").hide();
                }
            });
})