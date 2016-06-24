<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html class="no-js">
	<head>
		<meta http-equiv="X-UA-Compatible" content="IE=edge"> 
		<meta name="viewport" content="width=device-width, initial-scale=1"> 
		<title>Off-Canvas Menu Effects - Side Slide</title>
		<meta name="description" content="Modern effects and styles for off-canvas navigation with CSS transitions and SVG animations using Snap.svg" />
		<meta name="keywords" content="sidebar, off-canvas, menu, navigation, effect, inspiration, css transition, SVG, morphing, animation" />
		<meta name="author" content="Codrops" />
		<link rel="shortcut icon" href="../favicon.ico">
		<link rel="stylesheet" type="text/css" href="<c:url value="/ClassRoom/css/normalize.css"/>" />
		<link rel="stylesheet" type="text/css" href="<c:url value="/ClassRoom/css/demo.css"/>" />
		<link rel="stylesheet" type="text/css" href="<c:url value="/ClassRoom/fonts/font-awesome-4.2.0/css/font-awesome.min.css"/>" />
		<link rel="stylesheet" type="text/css" href="<c:url value="/ClassRoom/css/menu_sideslide.css"/>" />


	</head>
	<body>
		<div class="container" id="container">
			<div class="menu-wrap">
				<nav class="menu">
					<div class="icon-list">
<<<<<<< HEAD
						<a href="/KHCU/crNoticeList.khcu?classcode=${classcode }" id="notice"><i class="fa fa-fw fa-star-o"></i><span>공지사항</span></a>
						<a href="/KHCU/crListenList.khcu?classcode=${classcode }"><i class="fa fa-fw fa-bell-o"></i><span>수업듣기(1)</span></a>
						<a href="/KHCU/crListenRoom.khcu?classcode=${classcode }"><i class="fa fa-fw fa-bell-o"></i><span>수업듣기(2)</span></a>
						<a href="/KHCU/crHwList.khcu?classcode=${classcode }"><i class="fa fa-fw fa-envelope-o"></i><span>과제</span></a>
						<a href="/KHCU/crQnAList.khcu?classcode=${classcode }"><i class="fa fa-fw fa-comment-o"></i><span>질의응답</span></a>
						<a href="/KHCU/crExamMain.khcu"><i class="fa fa-fw fa-bar-chart-o"></i><span>시험</span></a>
						<a href="/KHCU/crMain.khcu"><i class="fa fa-fw fa-newspaper-o"></i><span>자료실</span></a>
						<a href="/KHCU/crMain.khcu"><i class="fa fa-fw fa-newspaper-o"></i><span>내강의실</span></a>
=======
						<a href="#content-wrap" id="notice"><i class="fa fa-fw fa-star-o"></i><span>공지사항</span></a>
						<a href="#"><i class="fa fa-fw fa-bell-o"></i><span>수업듣기</span></a>
						<a href="#"><i class="fa fa-fw fa-envelope-o"></i><span>과제</span></a>
						<a href="#"><i class="fa fa-fw fa-comment-o"></i><span>질의응답</span></a>
						<a href="#"><i class="fa fa-fw fa-bar-chart-o"></i><span>시험</span></a>
						<a href="#"><i class="fa fa-fw fa-newspaper-o"></i><span>자료실</span></a>
>>>>>>> branch 'master' of https://github.com/KHCU123/KHCU.git
					</div>
				</nav>
				<button class="close-button" id="close-button">Close Menu</button>
			</div>
			<button class="menu-button" id="open-button">Open Menu</button>
			<div class="content-wrap" id="content-wrap">
				<div class="content" id="content">
					<header class="codrops-header">
						<h1>${classcode} <span>Showing (off-canvas) menus stylishly</span></h1>
						<nav class="codrops-demos">
							<a href="index.html">Top Side</a>
							<a class="current-demo" href="sideslide.html">공지사항</a>
							<a href="cornerbox.html">Corner Box</a>
						</nav>
					</header>
				</div>
			</div><!-- /content-wrap -->
		</div><!-- /container -->
		<script src="<c:url value="/ClassRoom/js/classie.js"/>"></script>
		<script src="<c:url value="/ClassRoom/js/main.js"/>"></script>
		<script src="http://code.jquery.com/jquery-latest.min.js"></script>
		
	</body>
</html>