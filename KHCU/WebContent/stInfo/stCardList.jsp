<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
	<title> 학생 정보 리스트 </title>
</head>

<body>
<center><b> 학생 정보 리스트 </b>

<table width="700">
	<tr>
		<td align="center">
			<input type="button" value="학생 정보 등록하기" onclick="javascript:location='stCardInputForm.khcu'">			
		</td>
	</tr>
</table>

<c:if test="${count == 0}">
<table width="700" border="1" cellpadding="0" cellspacing="0">
	<tr>
		<td align="center">
			등록된 학생 정보가 없습니다.
		</td>
	</tr>
</table>
</c:if>

<c:if test="${count > 0}">
<table border="1" width="700" cellpadding="5" cellspacing="0" align="center"> 
	<tr height="30"> 
		<td align="center"  width="100" >학번</td> 
		<td align="center"  width="100" >이름</td> 
		<td align="center"  width="100" >대학</td>
		<td align="center"  width="100" >학과</td>		
		<td align="center"  width="100" >전공</td>
		<td align="center"  width="100" >학년</td>
		<td align="center"  width="100" >학기</td>
		<td align="center"  width="100" >재적상태</td>
		<td align="center"  width="100" >수정</td>
		<td align="center"  width="100" >삭제</td>
	</tr>

	<c:forEach var="article" items="${articleList}">
	<tr height="30">
		<td align="center"  width="100"> ${article.studentnum} </td>
		<td align="center"  width="100"> ${article.stname} </td>
		<td align="center"  width="100"> ${article.stcollege} </td>
		<td align="center"  width="100"> ${article.stmajor} </td>
		<td align="center"  width="100"> ${article.stminor} </td>
		<td align="center"  width="100"> ${article.stgrade} </td>
		<td align="center"  width="100"> ${article.stsemester} </td>
		<td align="center"  width="100"> ${article.ststate} </td>
		<td align="center"  width="100" ><input type="button" value="정보 수정" onclick="javascipt:location='stCardUpdateForm.khcu?studentnum=${article.studentnum}&stname=${article.stname}&pageNum=${currentPage}'"></td>
		<td align="center"  width="100" ><input type="button" value="정보 삭제" onclick="javascipt:location='stCardDeleteForm.khcu?studentnum=${article.studentnum}&stname=${article.stname}&pageNum=${currentPage}'"></td>
	</tr>
	</c:forEach>
	
</table>
</c:if>

<br>

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
		<a href="stCardList.khcu?pageNum=${startPage - 10 }">[이전]</a>
	</c:if>

	<c:forEach var="i" begin="${startPage}" end="${endPage}">
		<a href="stCardList.khcu?pageNum=${i}">[${i}]</a>
	</c:forEach>

	<c:if test="${endPage < pageCount}">
		<a href="stCardList.khcu?pageNum=${startPage + 10}">[다음]</a>
	</c:if>
</c:if>

</center>
</body>
</html>