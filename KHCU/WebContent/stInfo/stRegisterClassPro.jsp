<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<c:if test="${check == 0}">
	<c:redirect url="stRegisterClass.khcu"/>
</c:if>
<c:if test="${check != 0}">
	<script>
		alert("���� �ð��� �̹� ��û�� ���ǰ� �ֽ��ϴ�.");
		history.go(-1);
	</script>
</c:if>





