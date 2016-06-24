<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="/css/Menu.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
	<title> ���� ���� ����Ʈ </title>
</head>

<body>
<center><b> ���� ���� ����Ʈ </b>

<table width="700">
	<tr>
		<td align="center">
			<input type="button" value="���� ���� ����ϱ�" onclick="javascript:location='collegeInputForm.khcu'">			
		</td>
	</tr>
</table>

<c:if test="${count == 0}">
<table width="700" border="1" cellpadding="0" cellspacing="0">
	<tr>
		<td align="center">
			��ϵ� ���� ������ �����ϴ�.
		</td>
	</tr>
</table>
</c:if>

<c:if test="${count > 0}">
<table border="1" width="700" cellpadding="5" cellspacing="0" align="center"> 
	<tr height="30"> 
		<td align="center"  width="100" >�ܰ����� �ڵ�</td> 
		<td align="center"  width="200" >�ܰ����� �̸�</td> 
		<td align="center"  width="100" >�а� �ڵ�</td>
		<td align="center"  width="300" >�а� �̸�</td>		
	</tr>

	<c:forEach var="article" items="${articleList}">
	<tr>
		<td align="center" colspan="8">
			<input type="button" value="�׽�Ʈ �а� ���� ����" onclick="javascipt:location='testCollegeDeleteForm.khcu?majCode=${article.majCode}&majName=${article.majName}&pageNum=${currentPage}'">
		</td>
	</tr>
	<tr height="30">
		<td align="center"  width="100"> ${article.colCode} </td>
		<td align="center"  width="200"> ${article.colName} </td>
		<td align="center"  width="100"> ${article.majCode} </td>
		<td align="center"  width="300"> ${article.majName} </td>
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
		<a href="collegeList.khcu?pageNum=${startPage - 10 }">[����]</a>
	</c:if>

	<c:forEach var="i" begin="${startPage}" end="${endPage}">
		<a href="collegeList.khcu?pageNum=${i}">[${i}]</a>
	</c:forEach>

	<c:if test="${endPage < pageCount}">
		<a href="collegeList.khcu?pageNum=${startPage + 10}">[����]</a>
	</c:if>
</c:if>

</center>
</body>
</html>