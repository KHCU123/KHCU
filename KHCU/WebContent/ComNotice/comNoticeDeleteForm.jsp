<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ include file="/css/Menu.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
	<title> 공지사항 </title>

	<script>
		function pwCheck(){	
			if(document.deleteForm.pw.value==''){
				alert("비밀번호를 입력하십시요.");
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
<center><b> 공지사항 삭제 </b>
<br>
<form method="POST" name="deleteForm"  action="comNoticeDeletePro.khcu?pageNum=${pageNum}" onsubmit="return pwCheck()"> 
<input type="hidden" name="num" value="${num}">

<table id="customers" border="1" align="center" cellspacing="0" cellpadding="0" width="360">
	<tr height="30">
		<td align=center><b> 공지사항 글 삭제를 위해 비밀번호를 입력해 주시기 바랍니다 </b></td>
	</tr>
	<tr height="30">
		<td align=center >비밀번호 :
			<input type="password" name="pw" size="8" maxlength="12">
		</td>
	</tr>
	<tr height="30">
		<td align=center>
			<input type="submit" value="삭제" >
			<input type="button" value="목록" onclick="document.location.href='comNoticeList.khcu?pageNum=${pageNum}'">     
		</td>
	</tr>
</table>

</form>
</center>
</body>
</html> 
