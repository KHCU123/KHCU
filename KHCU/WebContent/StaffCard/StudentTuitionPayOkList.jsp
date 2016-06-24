<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="/css/Menu.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
	<title> 등록금 납부 완료 처리 리스트 </title>
</head>

<body>
<center><b> 등록금 납부 완료 처리 리스트 </b>

<c:if test="${count == 0}">
<table width="1000" border="1" cellpadding="0" cellspacing="0">
	<tr>
		<td align="center">
			등록금 납부 완료를 처리한 정보가 없습니다.
		</td>
	</tr>
</table>
</c:if>

<c:if test="${count > 0}">
<table border="1" width="1000" cellpadding="5" cellspacing="0" align="center"> 
	<tr height="30"> 
		<td align="center"  width="50" >번호</td> 
		<td align="center"  width="100" >학번</td> 
		<td align="center"  width="100" >이름</td>
		<td align="center"  width="200" >대학</td>		
		<td align="center"  width="200" >학과</td>	
		<td align="center"  width="50" >학년</td>	
		<td align="center"  width="50" >학기</td>	
		<td align="center"  width="100" >금액</td>
		<td align="center"  width="100" >상태</td>
		<td align="center"  width="200" >날짜</td>
	</tr>

	<c:forEach var="article" items="${articleList}">
	<tr height="30">
		<td align="center"  width="50" >
			<c:out value="${number}"/>
			<c:set var="number" value="${number - 1}"/>
		</td>
		<td align="center"  width="100"> ${article.stnum} </td>
		<td align="center"  width="100"> ${article.stname} </td>
		<td align="center"  width="200"> ${article.stcollege} </td>
		<td align="center"  width="200"> ${article.stmajor} </td>
		<td align="center"  width="50"> ${article.stgrade} </td>
		<td align="center"  width="50"> ${article.stsemester} </td>
		<td align="center"  width="100"> ${article.stmoney } </td>
		<td align="center"  width="100"> ${article.state }</td>
		<td align="center"  width="200"> ${article.reg_date }</td>
	</tr>
	</c:forEach>
</table>
<br/>
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
		<a href="StudentTuitionPayOkList.khcu?pageNum=${startPage - 10 }">[이전]</a>
	</c:if>

	<c:forEach var="i" begin="${startPage}" end="${endPage}">
		<a href="StudentTuitionPayOkList.khcu?pageNum=${i}">[${i}]</a>
	</c:forEach>

	<c:if test="${endPage < pageCount}">
		<a href="StudentTuitionPayOkList.khcu?pageNum=${startPage + 10}">[다음]</a>
	</c:if>
</c:if>

</center>
</body>
</html>