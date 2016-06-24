<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="${check == 1}">
	<c:redirect url="main.khcu"/>
</c:if>
<c:if test="${check == 0}">
	<script>
		alert("입력하신 아이디와 비밀번호를 확인해주세요");
		history.go(-1);
	</script>
</c:if>