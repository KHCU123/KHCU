<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="/css/Menu.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title> 교직원 </title>
</head>
<body>

<center>
<c:if test="${sessionScope.memId != null}">
<c:if test="${sessionScope.checkId == 1}">
	<b>${sessionScope.memId}님 환영합니다!</b><br>
	<input type="button" value="교직원리스트" onclick="javascript:location='staffCardList.khcu'">
	<input type="button" value="수업리스트" onclick="javascript:location='classList.khcu'">
	<input type="button" value="졸업 신청 학생 리스트" onclick="javascript:location='GraduateRegList.khcu'">
	<input type="button" value="졸업생 정보 리스트" onclick="javascript:location='GraduateList.khcu'">
	<input type="button" value="로그아웃" onclick="javascript:location='logout.khcu'">
</c:if>
<c:if test="${sessionScope.checkId != 1}">
	<b>접근 권한이 없습니다.</b>
</c:if>
</c:if>
<c:if test="${sessionScope.memId == null}">
	<b>로그인이 필요합니다.</b>
</c:if>
</center>

</body>
</html>