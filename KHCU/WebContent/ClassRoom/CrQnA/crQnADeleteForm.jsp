<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
	<title> ����/�亯 </title>

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

<body>
<center><b> ����/�亯 ���� </b>
<br>
<form method="POST" name="deleteForm"  action="crQnADeletePro.khcu?pageNum=${pageNum}" onsubmit="return pwCheck()"> 
<input type="hidden" name="num" value="${num}">
<input type="hidden" name="classcode" value="${classcode }">

<table border="1" align="center" cellspacing="0" cellpadding="0" width="360">
	<tr height="30">
		<td align=center><b> ����/�亯 �� ������ �Ͻðڽ��ϱ�? </b></td>
	</tr>
	<tr height="30">
		<td align=center >��й�ȣ :
			<input type="password" name="passwd" size="8" maxlength="12">
		</td>
	</tr>
	<tr height="30">
		<td align=center>
			<input type="submit" value="����" >
			<input type="button" value="���" onclick="document.location.href='crQnAList.khcu?pageNum=${pageNum}&classcode=${classcode }'">     
		</td>
	</tr>
</table>

</form>
</center>
</body>
</html> 