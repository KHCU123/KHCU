<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="/css/Menu.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
	<title> ������ ���� ����Ʈ </title>
</head>

<body>
<center><b> ������ ���� ����Ʈ </b>

<c:if test="${count == 0}">
<table width="1000" border="1" cellpadding="0" cellspacing="0">
	<tr>
		<td align="center">
			��ϵ� ������ ������ �����ϴ�.
		</td>
	</tr>
</table>
</c:if>

<c:if test="${count > 0}">
<table border="1" width="1000" cellpadding="5" cellspacing="0" align="center"> 
	<tr height="30"> 
		<td align="center"  width="50" >�й�</td> 
		<td align="center"  width="100" >�̸�</td> 
		<td align="center"  width="100" >����</td>
		<td align="center"  width="100" >�а�</td>		
		<td align="center"  width="100" >����(��)</td>	
		<td align="center"  width="150" >����ó</td>	
		<td align="center"  width="400" >�ּ�</td>
		<td align="center"  width="100" >�����Ͻ�</td>
	</tr>

	<c:forEach var="article" items="${articleList}">
	<tr height="30">
		<td align="center"  width="50"> ${article.studentnum} </td>
		<td align="center"  width="100"> ${article.stname} </td>
		<td align="center"  width="100"> ${article.stcollege} </td>
		<td align="center"  width="100"> ${article.stmajor} </td>
		<td align="center"  width="100"> ${article.stminor} </td>
		<td align="center"  width="150"> ${article.stphone} </td>
		<td align="center"  width="400"> ${article.stpostcode}<br> ${article.staddress1} <br> ${article.staddress2 } </td>
		<td align="center"  width="100">
			<fmt:formatDate value="${article.reg_date}" type="both"  pattern="yyyy-MM-dd"/></td>
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
		<a href="GraduateList.khcu?pageNum=${startPage - 10 }">[����]</a>
	</c:if>

	<c:forEach var="i" begin="${startPage}" end="${endPage}">
		<a href="GraduateList.khcu?pageNum=${i}">[${i}]</a>
	</c:forEach>

	<c:if test="${endPage < pageCount}">
		<a href="GraduateList.khcu?pageNum=${startPage + 10}">[����]</a>
	</c:if>
</c:if>

</center>
</body>
</html>