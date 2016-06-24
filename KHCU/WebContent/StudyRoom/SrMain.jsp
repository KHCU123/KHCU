<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="/css/Menu.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
	<title> 스터디룸 </title>
</head>
<script>
function createRoom(){
	 url = "/KHCU/createStudyRoom.khcu";
	open(url, "create", 
    "toolbar=no, location=no,status=no,menubar=no,scrollbars=no,resizable=no,width=400, height=400");
} 
</script>
<body>
<center>
<table width="700">
	<tr>
		<td align="center">
			<c:if test="${sessionScope.memId != null}">
			<input type="button" value="스터디룸 만들기" onclick="createRoom()"/>
			</c:if>
		</td>
	</tr>
</table>

<c:if test="${count == 0}">
<table width="700" border="1" cellpadding="0" cellspacing="0">
	<tr>
		<td align="center">
			생성된 스터디룸이 존재하지 않습니다.
		</td>
	</tr>
</table>
</c:if>

<c:if test="${count > 0}">
<table border="1" width="700" cellpadding="0" cellspacing="0" align="center"> 
	<tr height="30"> 
		<td align="center"  width="50"  >번 호</td>
		<td align="center"  width="400" >이 름</td>
		<td align="center"  width="150" >생성자</td>
		<td align="center"  width="100" >생성날짜</td>
	</tr>

	<c:forEach var="article" items="${articleList}">
	<tr height="30">
		<td align="center"  width="50" >
			<c:out value="${number}"/>
			<c:set var="number" value="${number - 1}"/>
		</td>
		<td  width="400" >
			&nbsp;<a href="passwdCheck.khcu?num=${article.num}"> ${article.roomTitle} </a> 
		</td>
		<td align="center"  width="150">${article.creater}</td>
		<td align="center"  width="100">
			<fmt:formatDate value="${article.reg_date}" type="both"  pattern="yyyy-MM-dd"/>
		</td>
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
		<a href="SrMain.khcu?pageNum=${startPage - 10 }">[이전]</a>
	</c:if>

	<c:forEach var="i" begin="${startPage}" end="${endPage}">
		<a href="SrMain.khcu?pageNum=${i}">[${i}]</a>
	</c:forEach>

	<c:if test="${endPage < pageCount}">
		<a href="SrMain.khcu?pageNum=${startPage + 10}">[다음]</a>
	</c:if>
</c:if>

</center>

</body>
</html>