<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>해외도서</title>
    
    <!-- css -->
    <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css"/>
    <link rel="stylesheet" href="/bookmall/css/reset.css"/>
    <link rel="stylesheet" href="/bookmall/css/com.css"/>
    
    <!-- js -->
    <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
    <script src="/bookmall/js/common.js"></script>
    <script src="/bookmall/js/main.js"></script>

	<script type="text/javascript">
		(function($) {
			$('.nav_category ul.layer').closest('li').hover(
				function() {
					$(this).addClass('active').find('ul').show();
				},
				function() {
					$(this).removeClass('active').find('ul').hide();
				}
			).find('a').focus(function() {
				$(this).addClass('focus').closest('li: has(ul)').addClass('active');
				$(this).closest('li: has(ul)').find('ul').stop().css('opacity', 1).show();
			}).blur(function() {
				$(this).removeClass('focus');
				if(!$(this).closest('li: has(ul)').find('.focus').size())
					$(this).closest('li: has(ul)').removeClass('active').find('ul').fadeOut(10);
			})
		})
	</script>
</head>
<body>
	<div class="nav_category">
		<h2 class="nav_title">
			<a href=""></a>
		</h2>
		<ul>
			<li class>
				<a href="" class>
					<em></em>
				</a>
				<ul class="layer" style="opacity: 1; display: none;">
					<li>
						<a href=""></a>
					</li>
				</ul>
			</li>
		</ul>
	</div>
</body>