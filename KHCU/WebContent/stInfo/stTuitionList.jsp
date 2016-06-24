<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head>
	<title>등록금 고지서 리스트</title>
</head>
<body>
<center>
<p>등록금 고지서 리스트</p>

<br/>

<table width="80%">
	<tr>
		<td align="center">
			<input type="button" value="등록금 고지서 입력" onclick="javascript:location='stTuitionInputForm.khcu'">
		</td>
	</tr>	
</table>	

<br/>

<c:if test="${count == 0 }">
<table width="80%" border="1">
	<tr>
		<td align="center">
			등록된 등록금 고지서 정보가 없습니다.
		</td>
	</tr>
</table>
</c:if>

<c:if test="${count > 0 }">
<table width="80%" border="1">
	<tr>
		<td align="center" width="100">번호</td>
		<td align="center" width="100">년도</td>
		<td align="center" width="100">학기</td>
		<td align="center" width="100">대학</td>
		<td align="center" width="100">전공</td>
		<td align="center" width="100">등록금</td>
		<td align="center" width="100">수정</td>
		<td align="center" width="100">삭제</td>
	</tr>
	<c:forEach var="article" items="${articleList}">
	<tr height="30">
		<td align="center" width="100"> ${article.num} </td>
		<td align="center" width="100"> ${article.year} </td>
		<td align="center" width="100"> ${article.semester} </td>
		<td align="center" width="100"> ${article.college} </td>
		<td align="center" width="100"> ${article.major} </td>
		<td align="center" width="100"> ${article.money} </td>
		<td align="center" width="100"><input type="button" value="정보 수정" onclick="javascipt:location='stTuitionUpdateForm.khcu?num=${article.num}&pageNum=${currentPage}'"></td>
		<td align="center" width="100"><input type="button" value="정보 삭제" onclick="javascipt:location='stTuitionDeleteForm.khcu?num=${article.num}&pageNum=${currentPage}'"></td>
	</tr>
	</c:forEach>
</table>
</c:if>

<br/>

<c:if test="${count > 0}">
	<c:set var="pageCount" value="${count / pageSize + ( count % pageSize == 0 ? 0 : 1)}"/>
	<c:set var="pageBlock" value="${10}"/>
	<fmt:parseNumber var="result" value="${currentPage / 10}" integerOnly="true" />
	<c:set var="startPage" value="${result * 10 + 1}" />
	<c:set var="endPage" value="${startPage + pageBlock-1}"/>
	<c:if test="${endPage > pageCount}">
		<c:set var="endPage" value="${pageCount}"/>
	</c:if> 
          
	<c:if test="${startPage > 10}">
		<a href="stTuitionList.khcu?pageNum=${startPage - 10 }">[이전]</a>
	</c:if>

	<c:forEach var="i" begin="${startPage}" end="${endPage}">
		<a href="stTuitionList.khcu?pageNum=${i}">[${i}]</a>
	</c:forEach>

	<c:if test="${endPage < pageCount}">
		<a href="stTuitionList.khcu?pageNum=${startPage + 10}">[다음]</a>
	</c:if>
</c:if>
	
</body>
</html>