<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="/css/Menu.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title> 학생 </title>
</head>
<body>

<center>
<c:if test="${sessionScope.memId != null}">
	<b>${sessionScope.memId}님 환영합니다!</b><br>
	<input type="button" value="학생카드" onclick="javascript:location='stCard.khcu'">
	<input type="button" value="학생리스트" onclick="javascript:location='stCardList.khcu'">
	<input type="button" value="휴복학관리" onclick="javascript:location='stHuhak.khcu'">
	<input type="button" value="학점관리" onclick="javascript:location='stScore.khcu'">
	<input type="button" value="전체학점관리" onclick="javascript:location='stAllScore.khcu'">
	<input type="button" value="로그아웃" onclick="javascript:location='logout.khcu'">
	<input type="button" value="시간표(학생ver)" onclick="javascript:location='stClassTime.khcu'">
	<input type="button" value="수강신청(학생ver)" onclick="javascript:location='stRegisterClass.khcu'">
	<input type="button" value="장학금" onclick="javascript:location='stScholarship.khcu'">
	<input type="button" value="증명서 발급" onclick="javascript:location='stCertificateMain.khcu'">
	<input type="button" value="등록금 고지서 리스트" onclick="javascript:location='stTuitionList.khcu'">
</c:if>

<c:if test="${sessionScope.memId == null}">
	<b>${sessionScope.memId}님 환영합니다!</b><br>
	<input type="button" value="학생리스트" onclick="javascript:location='stCardList.khcu'">
</c:if>
</center>

</body>
</html>