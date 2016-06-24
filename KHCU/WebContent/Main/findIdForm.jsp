<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ include file="/css/Menu.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
<title> KH사이버대학교 로그인 </title>
</head>

<body>
<center> <b> 학번(아이디)찾기 &nbsp; <input type="button" value="비밀번호 찾기" onclick="javascript:location='findPwForm.khcu'"></b><br>
<br><br>
<form action="findIdPro.khcu" method="post">
<table width="400" border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td width="100" height="30" align="right"> 이름 </td>
		<td width="200" height="30" align="center"><input type="text" name="findName"></td>
	</tr>
	<tr>
		<td width="100" height="30" align="right"> 생년월일(6자리) </td>
		<td width="200" height="30" align="center"><input type="text" name="findBirth"></td>
	</tr>
	<tr><td colspan="3">&nbsp;</td>
	<tr>
		<td width="400" height="30" align="center" colspan="3">
			<input type="submit" value="확인">
			<input type="button" value="로그인 페이지 이동" onclick="javascipt:location='main.khcu'">
		</td>
	</tr>
</table>
</form>

</center>
</body>

</html>