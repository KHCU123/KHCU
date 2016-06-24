<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<center>
<c:if test="${check == 1}">
	<b> ${findName}님의 학번(아이디)는 ${findNum} 입니다.</b><br>
	<input type="button" value="로그인 페이지 이동" onclick="javascipt:location='main.khcu'"> &nbsp;
	<input type="button" value="비밀번호 찾기" onclick="javascript:location='findPwForm.khcu'">
</c:if>
<c:if test="${check == 0}">
	<script>
		alert("입력하신 정보를 확인해주세요");
		history.go(-1);
	</script>
</c:if>