<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ include file="/css/Menu.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
<title> KH���̹����б� �α��� </title>
</head>

<body>
<center> <b> �й�(���̵�)ã�� &nbsp; <input type="button" value="��й�ȣ ã��" onclick="javascript:location='findPwForm.khcu'"></b><br>
<br><br>
<form action="findIdPro.khcu" method="post">
<table width="400" border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td width="100" height="30" align="right"> �̸� </td>
		<td width="200" height="30" align="center"><input type="text" name="findName"></td>
	</tr>
	<tr>
		<td width="100" height="30" align="right"> �������(6�ڸ�) </td>
		<td width="200" height="30" align="center"><input type="text" name="findBirth"></td>
	</tr>
	<tr><td colspan="3">&nbsp;</td>
	<tr>
		<td width="400" height="30" align="center" colspan="3">
			<input type="submit" value="Ȯ��">
			<input type="button" value="�α��� ������ �̵�" onclick="javascipt:location='main.khcu'">
		</td>
	</tr>
</table>
</form>

</center>
</body>

</html>