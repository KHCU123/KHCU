<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="/css/Menu.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title> �л� </title>
</head>
<body>

<center>
<c:if test="${sessionScope.memId != null}">
	<b>${sessionScope.memId}�� ȯ���մϴ�!</b><br>
	<input type="button" value="�л�ī��" onclick="javascript:location='stCard.khcu'">
	<input type="button" value="�л�����Ʈ" onclick="javascript:location='stCardList.khcu'">
	<input type="button" value="�޺��а���" onclick="javascript:location='stHuhak.khcu'">
	<input type="button" value="��������" onclick="javascript:location='stScore.khcu'">
	<input type="button" value="��ü��������" onclick="javascript:location='stAllScore.khcu'">
	<input type="button" value="�α׾ƿ�" onclick="javascript:location='logout.khcu'">
	<input type="button" value="�ð�ǥ(�л�ver)" onclick="javascript:location='stClassTime.khcu'">
	<input type="button" value="������û(�л�ver)" onclick="javascript:location='stRegisterClass.khcu'">
	<input type="button" value="���б�" onclick="javascript:location='stScholarship.khcu'">
	<input type="button" value="���� �߱�" onclick="javascript:location='stCertificateMain.khcu'">
	<input type="button" value="��ϱ� ������ ����Ʈ" onclick="javascript:location='stTuitionList.khcu'">
</c:if>

<c:if test="${sessionScope.memId == null}">
	<b>${sessionScope.memId}�� ȯ���մϴ�!</b><br>
	<input type="button" value="�л�����Ʈ" onclick="javascript:location='stCardList.khcu'">
</c:if>
</center>

</body>
</html>