<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="/css/Menu.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
<title> ���� ������ ��� ��ȸ </title>
</head>

<body>
<center>

<table width="300" border="1" cellpadding="5" cellspacing="0">
	<c:if test="${semester == 'ok'}">
	<tr>
		<td align="center"> ������������ </td>
		<td align="center"> ${gTime } </td>
	</tr>
	</c:if>
	<tr>
		<td align="center"> ������������ </td>
		<td align="center"> ${dTime } </td>
	</tr>
	<tr>
		<td align="center"> �������� </td>
		<td align="center">
			<c:if test="${check == 'O'}"> ���� </c:if>
			<c:if test="${check != 'O'}"> �Ұ� </c:if>
		</td>
	</tr>
	<tr>
		<td align="center"> ���������� </td>
		<td align="center"> ${article.libCredit } / ${graLib }</td>
	</tr>
	<tr>
		<td align="center"> ���������� </td>
		<td align="center"> ${article.majorCredit} / 120</td>
	</tr>
</table>
<br/><br/>
<table width="300">
	<tr>
		<td><font color="blue"> ${graduate} </font> </td>
	</tr>
</table>
<c:if test="${check == 'O'}">
<c:if test="${ststate != '������û' }">
	<input type="button" value="��û" onclick="javascript:location='GraduateRegister.khcu?studentnum=${sessionScope.memId}'">
</c:if>
<c:if test="${ststate == '������û' }">
	���� ��û�� �Ϸ��Ͽ����ϴ�.
</c:if>
</c:if>
</center>
</body>