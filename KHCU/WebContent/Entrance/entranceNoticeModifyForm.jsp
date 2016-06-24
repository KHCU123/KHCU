<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="/css/Menu2.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
	<title> 입학공지 </title>
	
</head>

<style>
#customers {
    font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
    border-collapse: collapse;
    
}
#customers td, #customers th {
    border: 1px solid #EAEAEA;
    text-align: left;
    padding: 8px;
}
#customers tr:nth-child(even){
	background-color: #FFFFFF
}
#customers tr:hover {
	background-color: #EAEAEA;
}
#customers th {
    padding-top: 12px;
    padding-bottom: 12px;
    background-color: #FFFFFF;
    color: white;
}
#customers a{
	text-decoration:none; 
	font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
}
</style>

<body>  
<center><b> 입학공지 수정</b>
<br>
<form method="post" name="modifyForm" action="entranceNoticeModifyPro.jsp?pageNum=${pageNum}" onsubmit="return modifyCheck()">
<input type="hidden" name="num" value="${article.num}"></td>

<table id="customers" border="1" width="400" cellspacing="0" cellpadding="0" align="center">
	<tr>
		<td align="right" colspan="2">
			<a href="/Entrance/entranceNoticeList.jsp"> 글목록</a> 
		</td>
	</tr>
	<tr>
		<td  width="100" align="center" >제 목</td>
		<td  width="300"><input type="text" name="title" size="50" value="${article.title}"></td>
	</tr>
	<tr>
		<td  width="400" colspan="2"><textarea name="content" rows="13" cols="60">${article.content}</textarea></td>
	</tr>
	<tr>      
		<td colspan=2 align="center"> 
			<input type="submit" value="수정">
			<input type="button" value="목록" OnClick="window.location='entranceNoticeList.jsp?pageNum=${pageNum}'">
		</td>
	</tr>
</table>

</form>
</center>
</body>
</html>  