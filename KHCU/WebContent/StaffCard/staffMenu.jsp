<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="/css/Menu.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title> ������ </title>
</head>
<body>

<center>
<c:if test="${sessionScope.memId != null}">
<c:if test="${sessionScope.checkId == 1}">
	<b>${sessionScope.memId}�� ȯ���մϴ�!</b><br>
	<input type="button" value="����������Ʈ" onclick="javascript:location='staffCardList.khcu'">
	<input type="button" value="��������Ʈ" onclick="javascript:location='classList.khcu'">
	<input type="button" value="���� ��û �л� ����Ʈ" onclick="javascript:location='GraduateRegList.khcu'">
	<input type="button" value="������ ���� ����Ʈ" onclick="javascript:location='GraduateList.khcu'">
	<input type="button" value="�α׾ƿ�" onclick="javascript:location='logout.khcu'">
</c:if>
<c:if test="${sessionScope.checkId != 1}">
	<b>���� ������ �����ϴ�.</b>
</c:if>
</c:if>
<c:if test="${sessionScope.memId == null}">
	<b>�α����� �ʿ��մϴ�.</b>
</c:if>
</center>

</body>
</html>