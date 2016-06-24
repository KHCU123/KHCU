<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="/css/Menu.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
<title> 졸업 가사정 결과 조회 </title>
</head>

<body>
<center>

<table width="300" border="1" cellpadding="5" cellspacing="0">
	<c:if test="${semester == 'ok'}">
	<tr>
		<td align="center"> 졸업예정일자 </td>
		<td align="center"> ${gTime } </td>
	</tr>
	</c:if>
	<tr>
		<td align="center"> 졸업사정일자 </td>
		<td align="center"> ${dTime } </td>
	</tr>
	<tr>
		<td align="center"> 졸업판정 </td>
		<td align="center">
			<c:if test="${check == 'O'}"> 가능 </c:if>
			<c:if test="${check != 'O'}"> 불가 </c:if>
		</td>
	</tr>
	<tr>
		<td align="center"> 교양학점계 </td>
		<td align="center"> ${article.libCredit } / ${graLib }</td>
	</tr>
	<tr>
		<td align="center"> 전공학점계 </td>
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
<c:if test="${ststate != '졸업신청' }">
	<input type="button" value="신청" onclick="javascript:location='GraduateRegister.khcu?studentnum=${sessionScope.memId}'">
</c:if>
<c:if test="${ststate == '졸업신청' }">
	졸업 신청을 완료하였습니다.
</c:if>
</c:if>
</center>
</body>