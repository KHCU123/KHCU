<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
	<title> ��й�ȣ Ȯ�� </title>

	<script>
		function passwdCheck(){	
			if(document.passwdForm.passwd.value==''){
				alert("��й�ȣ�� �Է��Ͻʽÿ�.");
				document.passwdForm.passwd.focus();
				return false;
			}
		}
	</script>
</head>

<body>
<center><b> ��й�ȣ Ȯ�� </b>
<br>
<form method="POST" name="passwdForm"  action="crQnACheckPwPro.khcu" onsubmit="return passwdCheck()"> 
<input type="hidden" name="num" value="${num}"/>
<input type="hidden" name="classcode" value="${classcode}"/>
<input type="hidden" name="pageNum" value="${pageNum }"/>
<table border="1" align="center" cellspacing="0" cellpadding="0" width="360">
	<tr height="30">
		<td align=center><b> ���� ���� ���� ��й�ȣ�� �Է��� �ֽñ� �ٶ��ϴ� </b></td>
	</tr>
	<tr height="30">
		<td align=center >��й�ȣ :
			<input type="password" name="passwd" size="8" maxlength="12">
		</td>
	</tr>
	<tr height="30">
		<td align=center>
			<input type="submit" value="Ȯ��" >
			<input type="button" value="���" onclick="document.location.href='crQnAList.khcu?pageNum=${pageNum}&classcode=${classcode }'">     
		</td>
	</tr>
</table>

</form>
</center>
</body>
</html> 
