<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
	<title> 과제 </title>
</head>

<body>
<center><b> 과제 </b>
<input type="hidden" name="classcode" value="${classcode }"/>
<table width="700">
	<tr>
		<td align="right">
			<c:if test="${id==2}">
			<a href="crHwWriteForm.khcu?classcode=${classcode}">과제 작성하기</a>
			</c:if>
		</td>
	</tr>
</table>

<c:if test="${count == 0}">
<table width="700" border="1" cellpadding="0" cellspacing="0">
	<tr>
		<td align="center">
			작성된 공지사항이 없습니다.
		</td>
	</tr>
</table>
</c:if>

<c:if test="${count > 0}">
<table border="1" width="800" cellpadding="0" cellspacing="0" align="center"> 
	<tr height="30"> 
		<td align="center"  width="50"  >번 호</td> 
		<td align="center"  width="100"	>과제 형태</td>
		<td align="center"  width="100"	>마감일</td>
		<td align="center"  width="400" >제 목</td>
		<td align="center"  width="100" >작성날짜</td> 
		<td align="center"  width="50" >조 회</td>    
	</tr>

	<c:forEach var="article" items="${articleList}">
	<tr height="30">
		<td align="center"  width="50" >
			<c:out value="${number}"/>
			<c:set var="number" value="${number - 1}"/>
		</td>
		<td align="center" width="100">
			${article.type }
		</td>
		<td  width="100" align="center">
			${article.end_date }
		</td>
		<td  width="400" align="center">
			&nbsp;<a href="crHwContent.khcu?num=${article.num}&pageNum=${currentPage}&classcode=${classcode }"> ${article.title} </a> 
		</td>
		<td align="center"  width="100">
			<fmt:formatDate value="${article.reg_date}" type="both"  pattern="yyyy-MM-dd"/>
		</td>
		<td align="center"  width="50"> ${article.readcount} </td>
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
		<a href="comHwList.khcu?pageNum=${startPage - 10 }">[이전]</a>
	</c:if>

	<c:forEach var="i" begin="${startPage}" end="${endPage}">
		<a href="comHwList.khcu?pageNum=${i}">[${i}]</a>
	</c:forEach>

	<c:if test="${endPage < pageCount}">
		<a href="comHwList.khcu?pageNum=${startPage + 10}">[다음]</a>
	</c:if>
</c:if>

</center>
</body>
</html>