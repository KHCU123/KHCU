<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ include file="/css/Menu.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
	<title> �������� </title>

	<script>
		function pwCheck(){	
			if(document.deleteForm.pw.value==''){
				alert("��й�ȣ�� �Է��Ͻʽÿ�.");
				document.delForm.pw.focus();
				return false;
			}
		}
	</script>
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
<center><b> �������� ���� </b>
<br>
<form method="POST" name="deleteForm"  action="comNoticeDeletePro.khcu?pageNum=${pageNum}" onsubmit="return pwCheck()"> 
<input type="hidden" name="num" value="${num}">

<table id="customers" border="1" align="center" cellspacing="0" cellpadding="0" width="360">
	<tr height="30">
		<td align=center><b> �������� �� ������ ���� ��й�ȣ�� �Է��� �ֽñ� �ٶ��ϴ� </b></td>
	</tr>
	<tr height="30">
		<td align=center >��й�ȣ :
			<input type="password" name="pw" size="8" maxlength="12">
		</td>
	</tr>
	<tr height="30">
		<td align=center>
			<input type="submit" value="����" >
			<input type="button" value="���" onclick="document.location.href='comNoticeList.khcu?pageNum=${pageNum}'">     
		</td>
	</tr>
</table>

</form>
</center>
</body>
</html> 
