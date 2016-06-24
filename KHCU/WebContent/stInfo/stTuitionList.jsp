<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head>
	<title>��ϱ� ������ ����Ʈ</title>
</head>
<body>
<center>
<p>��ϱ� ������ ����Ʈ</p>

<br/>

<table width="80%">
	<tr>
		<td align="center">
			<input type="button" value="��ϱ� ������ �Է�" onclick="javascript:location='stTuitionInputForm.khcu'">
		</td>
	</tr>	
</table>	

<br/>

<c:if test="${count == 0 }">
<table width="80%" border="1">
	<tr>
		<td align="center">
			��ϵ� ��ϱ� ������ ������ �����ϴ�.
		</td>
	</tr>
</table>
</c:if>

<c:if test="${count > 0 }">
<table width="80%" border="1">
	<tr>
		<td align="center" width="100">��ȣ</td>
		<td align="center" width="100">�⵵</td>
		<td align="center" width="100">�б�</td>
		<td align="center" width="100">����</td>
		<td align="center" width="100">����</td>
		<td align="center" width="100">��ϱ�</td>
		<td align="center" width="100">����</td>
		<td align="center" width="100">����</td>
	</tr>
	<c:forEach var="article" items="${articleList}">
	<tr height="30">
		<td align="center" width="100"> ${article.num} </td>
		<td align="center" width="100"> ${article.year} </td>
		<td align="center" width="100"> ${article.semester} </td>
		<td align="center" width="100"> ${article.college} </td>
		<td align="center" width="100"> ${article.major} </td>
		<td align="center" width="100"> ${article.money} </td>
		<td align="center" width="100"><input type="button" value="���� ����" onclick="javascipt:location='stTuitionUpdateForm.khcu?num=${article.num}&pageNum=${currentPage}'"></td>
		<td align="center" width="100"><input type="button" value="���� ����" onclick="javascipt:location='stTuitionDeleteForm.khcu?num=${article.num}&pageNum=${currentPage}'"></td>
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
		<a href="stTuitionList.khcu?pageNum=${startPage - 10 }">[����]</a>
	</c:if>

	<c:forEach var="i" begin="${startPage}" end="${endPage}">
		<a href="stTuitionList.khcu?pageNum=${i}">[${i}]</a>
	</c:forEach>

	<c:if test="${endPage < pageCount}">
		<a href="stTuitionList.khcu?pageNum=${startPage + 10}">[����]</a>
	</c:if>
</c:if>
	
</body>
</html>