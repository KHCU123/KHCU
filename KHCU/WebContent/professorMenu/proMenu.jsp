<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="/css/Menu.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title> 교수 </title>
</head>

<script>

function openMemo(id) {
    url = "memoForm.khcu?sender="+id;
    open(url, "confirm", 
    "toolbar=no, location=no,status=no,menubar=no,scrollbars=no,resizable=no,width=550, height=300");
    
	}

</script>


<body>

<center>
<c:if test="${sessionScope.memId != null}">
	<b>${sessionScope.memId}님 환영합니다!</b><br>
	<input type="button" value="교수카드" onclick="javascript:location='professorCardList.khcu'">
	<input type="button" value="쪽지보내기" onclick="openMemo(${sessionScope.memId})">
	<input type="button" value="쪽지함" onclick="javascript:location='memoBox.khcu'">
	<input type="button" value="강의실" onclick="javascript:location='classes.khcu'">
	<input type="button" value="로그아웃" onclick="javascript:location='logout.khcu'">
	<input type="button" value="나의강의보기(교수ver)" onclick="javascript:location='pfclassTimeTable.khcu'">
	<input type="button" value="강의신청하기(교수ver)" onclick="javascript:location='classInputForm.khcu'">
</c:if>

<c:if test="${sessionScope.memId == null}">
	<b>${sessionScope.memId}님 환영합니다!</b><br>
	<input type="button" value="교수카드" onclick="javascript:location='professorCardList.khcu'">
	<input type="button" value="강의실" onclick="javascript:location='classes.khcu'">		
</c:if>
</center>

<%@ include file="/webMemo/newMemo.jsp"%>

</body>
</html>