<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="${check == 1}">
	<c:redirect url="main.khcu"/>
</c:if>
<c:if test="${check == 0}">
	<script>
		alert("�Է��Ͻ� ���̵�� ��й�ȣ�� Ȯ�����ּ���");
		history.go(-1);
	</script>
</c:if>