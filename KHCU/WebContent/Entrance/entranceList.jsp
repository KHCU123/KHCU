<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="/css/Menu2.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title> 입학안내 </title>
</head>
<style>
.hover {
		max-width:400px; 
		height:80px; 
		line-height:80px; 
		margin:20px auto; 
		background-color:#F6F6F6;  
		text-align:center; transition:all 0.8s, color 0.3s 0.3s;  
		color:#504f4f; cursor: pointer;  
	}
	.hover:hover{
		color:#fff;
	}
	.effect1:hover{
		box-shadow:
			400px 0 0 0  rgba(0,0,0,0.25) inset, 
			-400px 0 0 0  rgba(0,0,0,0.25) inset;
	}
	.effect2:hover{
		box-shadow:
			400px 0 0 0  rgba(0,0,0,0.25) inset, 
			-400px 0 0 0  rgba(0,0,0,0.25) inset;
	}
	.effect3:hover{
		box-shadow:
			400px 0 0 0  rgba(0,0,0,0.25) inset, 
			-400px 0 0 0  rgba(0,0,0,0.25) inset;
	}
</style>
<body>
    <div class="hover effect1">
		<span><font size="5" color="#000000"><a href="/KHCU/Entrance/entranceNoticeList.jsp"> 입학공지 </a></font></span>
	</div>
	<div class="hover effect2">
		<span><font size="5" color="#000000"><a href="/KHCU/Entrance/applicationWriteForm.jsp"> 지원서작성 </a></font></span>
	</div>
	<div class="hover effect3">
		<span><font size="5" color="#000000"><a href="/KHCU/Entrance/applicationModifyForm.jsp"> 지원서수정 </a></font></span>
	</div>
</body>
</html>