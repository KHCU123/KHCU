<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="/css/Menu2.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head>
	<title> ���а��� </title>
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
<center><b> ���а��� </b>
<br>

<form>
<table id="customers" border="1" width="400" cellspacing="0" cellpadding="0" align="center">  
	<tr height="30">
		<td align="center" width="100">�۹�ȣ</td>
		<td align="center" width="100" align="center">${article.num}</td>
		<td align="center" width="100">��ȸ��</td>
		<td align="center" width="100" align="center">${article.readcount}</td>
	</tr>
	<tr height="30">
		<td align="center" width="100">�ۼ���¥</td>
		<td align="center" width="300" align="center" colspan="3">
			<fmt:formatDate value="${article.reg_date}" type="both"  pattern="yyyy-MM-dd"/>
		</td>
	</tr>
	<tr height="30">
		<td align="center" width="100">����</td>
		<td align="center" width="300" align="center" colspan="3">${article.title}</td>
	</tr>
	<tr>
		<td align="left" width="400" colspan="4"><pre>${article.content}</pre></td>
	</tr>
	<tr height="30">      
		<td colspan="4" align="right">
			<input type="button" value="����"
				onclick="document.location.href='entranceNoticeModifyForm.jsp?num=${article.num}&pageNum=${pageNum}'">
			&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="button" value="����"
				onclick="document.location.href='entranceNoticeDeleteForm.jsp?num=${article.num}&pageNum=${pageNum}'">
			&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="button" value="���" onclick="document.location.href='entranceNoticeList.jsp?pageNum=${pageNum}'">
		</td>
	</tr>
</table>
</form>

</center>
</body>
</html>