<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="/css/Menu2.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
	<title> 자유게시판 </title>
</head>

<style>
#customers {
    font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
    border-collapse: collapse;
    
}
#customers td, #customers th {
    border: 1px solid #EAEAEA;
    text-align: left;
    padding: 8px;
}
#customers tr:nth-child(even){
	background-color: #FFFFFF
}
#customers tr:hover {
	background-color: #EAEAEA;
}
#customers th {
    padding-top: 12px;
    padding-bottom: 12px;
    background-color: #FFFFFF;
    color: white;
}
#customers a{
	text-decoration:none; 
	font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
}
</style>

<body>
<center><b> 자유게시판 </b>

<table width="700">
	<tr>
		<td align="right">
			<a href="comBoardWriteForm.khcu">글쓰기</a>
		</td>
	</tr>
</table>

<c:if test="${count == 0}">
<table width="700" border="1" cellpadding="0" cellspacing="0">
	<tr>
		<td align="center">
			작성된 글이 없습니다.
		</td>
	</tr>
</table>
</c:if>

<c:if test="${count > 0}">
<table id="customers" border="1" width="700" cellpadding="0" cellspacing="0" align="center"> 
	<tr height="30"> 
		<td align="center"  width="50"  >번 호</td> 
		<td align="center"  width="100" >분 류</td> 
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
		<td align="center"  width="100"> ${article.category} </td>
		<td  width="400" >
			&nbsp;<a href="comBoardContent.khcu?num=${article.num}&pageNum=${currentPage}"> ${article.title} </a> 
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
		<a href="comBoardList.khcu?pageNum=${startPage - 10 }">[이전]</a>
	</c:if>

	<c:forEach var="i" begin="${startPage}" end="${endPage}">
		<a href="comBoardList.khcu?pageNum=${i}">[${i}]</a>
	</c:forEach>

	<c:if test="${endPage < pageCount}">
		<a href="comBoardList.khcu?pageNum=${startPage + 10}">[다음]</a>
	</c:if>
</c:if>

</center>
</body>
</html>