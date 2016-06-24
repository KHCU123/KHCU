<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<% 
request.setCharacterEncoding("euc-kr");
%>
<html>
<head>
	<title> 질문답변 </title>

</head>

<body>
<form name="form1">
<center><b> 질문답변 </b>
<input type="hidden" value="${classcode }" name="classcode" id="classcode"/>
<table width="700">
	<tr>
		<td align="right">
		
			<a href="crQnAWriteForm.khcu?classcode=${classcode}">글쓰기</a>
		</td>
	</tr>
</table>

<c:if test="${count == 0}">
<table width="700" border="1" cellpadding="0" cellspacing="0">
	<tr>
		<td align="center">
			작성된 질문/답변이 없습니다.
		</td>
	</tr>
</table>
</c:if>

<c:if test="${count > 0}">
<table border="1" width="700" cellpadding="0" cellspacing="0" align="center">
	<tr height="30"> 
		<td align="center"  width="50"  >번 호</td> 
		<td align="center"  width="400" >제 목</td>
		<td align="center"	width="100"	>작성자</td>
		<td align="center"  width="100" >작성날짜</td> 
		<td align="center"  width="50" >조 회</td>    
	</tr>

	<c:forEach var="article" items="${articleList}">
	<tr height="30">
		<td align="center"  width="50" >
			<c:out value="${number}"/>
			<c:set var="number" value="${number - 1}"/>
		</td>
		<td  width="400" >
		<c:if test="${sessionScope.memId==article.writer || id==2}">
			&nbsp;<a href="crQnAContent.khcu?num=${article.num}&pageNum=${currentPage}&classcode=${classcode}"> ${article.title} </a>
		</c:if>
		<c:if test="${sessionScope.memId!=article.writer && id!=2 }">
			&nbsp;<a href="crQnACheckPw.khcu?num=${article.num}&pageNum=${currentPage}&classcode=${classcode}">${article.title }</a>
		</c:if>
		</td>
		<td align="center"  width="100"> ${article.writer} </td>
		<td align="center"  width="100">
			<fmt:formatDate value="${article.reg_date}" type="both"  pattern="yyyy-MM-dd"/>
		</td>
		<td align="center"  width="50"> ${article.readcount} </td>
	</tr>
	</c:forEach>
	
</table>
</c:if>
<br/>
	<select name="searchCategory">
		<option value="1" <c:if test="${searchCategory==1}">selected</c:if>>제목</option>
		<option value="2" <c:if test="${searchCategory==2}">selected</c:if>>제목+내용</option>
		<option value="3" <c:if test="${searchCategory==3}">selected</c:if>>글쓴이</option>
	</select>

	<input type="text" value="${search}" name="search" id="search" onkeyup="if(event.keyCode==13){search()}"/>

	<input type="submit" value="검색"/>
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
		<a href="crQnAList.khcu?pageNum=${startPage - 10 }&classcode=${classcode}">[이전]</a>
	</c:if>

	<c:forEach var="i" begin="${startPage}" end="${endPage}">
		<a href="crQnAList.khcu?pageNum=${i}&classcode=${classcode}">[${i}]</a>
	</c:forEach>

	<c:if test="${endPage < pageCount}">
		<a href="crQnAList.khcu?pageNum=${startPage + 10}&classcode=${classcode}">[다음]</a>
	</c:if>
</c:if>

</center>
</form>
</body>
</html>