<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ include file="/css/Menu.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head>
	<title> 취업정보 </title>
</head>
<style>
h1{
text-align:center;
}
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
<center><b> 취업정보 </b>
<br>

<form>
<table id="customers" width="400" border="1" cellspacing="0" cellpadding="5"  align="center">  
	<tr height="30">
		<td align="center" width="100">글번호</td>
		<td align="center" width="100" align="center">${article.num}</td>
		<td align="center" width="100">조회수</td>
		<td align="center" width="100" align="center">${article.readcount}</td>
	</tr>
	<tr height="30">
		<td align="center" width="100">작성날짜</td>
		<td align="center" width="300" align="center" colspan="3">
			<fmt:formatDate value="${article.reg_date}" type="both"  pattern="yyyy-MM-dd"/>
		</td>
	</tr>
	<tr height="30">
		<td align="center" width="100">제목</td>
		<td align="center" width="300" align="center" colspan="3">${article.title}</td>
	</tr>
	<tr>
		<td align="left" width="400" colspan="4"><pre>${article.content}</pre></td>
	</tr>
	<tr height="30">      
		<td colspan="4" align="right">
			<input type="button" value="수정"
				onclick="document.location.href='comJobModifyForm.khcu?num=${article.num}&pageNum=${pageNum}'">
			&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="button" value="삭제"
				onclick="document.location.href='comJobDeleteForm.khcu?num=${article.num}&pageNum=${pageNum}'">
			&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="button" value="목록" onclick="document.location.href='comJobList.khcu?pageNum=${pageNum}'">
		</td>
	</tr>
</table>
</form>

</center>
</body>
</html>
