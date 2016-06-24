<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
	<title> 비밀번호 확인 </title>

	<script>
		function passwdCheck(){	
			if(document.passwdForm.passwd.value==''){
				alert("비밀번호를 입력하십시요.");
				document.passwdForm.passwd.focus();
				return false;
			}
		}
	</script>
</head>

<body>
<center><b> 비밀번호 확인 </b>
<br>
<form method="POST" name="passwdForm"  action="crQnACheckPwPro.khcu" onsubmit="return passwdCheck()"> 
<input type="hidden" name="num" value="${num}"/>
<input type="hidden" name="classcode" value="${classcode}"/>
<input type="hidden" name="pageNum" value="${pageNum }"/>
<table border="1" align="center" cellspacing="0" cellpadding="0" width="360">
	<tr height="30">
		<td align=center><b> 글을 보기 위해 비밀번호를 입력해 주시기 바랍니다 </b></td>
	</tr>
	<tr height="30">
		<td align=center >비밀번호 :
			<input type="password" name="passwd" size="8" maxlength="12">
		</td>
	</tr>
	<tr height="30">
		<td align=center>
			<input type="submit" value="확인" >
			<input type="button" value="목록" onclick="document.location.href='crQnAList.khcu?pageNum=${pageNum}&classcode=${classcode }'">     
		</td>
	</tr>
</table>

</form>
</center>
</body>
</html> 
