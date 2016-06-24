<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="/css/Menu.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
	<title> ���л� ���� ����Ʈ </title>
</head>

<body>
<center><b> ���л� ���� ����Ʈ </b>

<table width="700">
	<tr>
		<td align="center">
			<input type="button" value="���л� ����ϱ�" onclick="javascript:location='ScholarshipInputForm.khcu'">			
		</td>
	</tr>
</table>

<c:if test="${count == 0}">
<table width="700" border="1" cellpadding="0" cellspacing="0">
	<tr>
		<td align="center">
			��ϵ� ���л��� �����ϴ�.
		</td>
	</tr>
</table>
</c:if>

<c:if test="${count > 0}">
<table border="1" width="800" cellpadding="5" cellspacing="0" align="center"> 
	<tr height="30"> 
		<td align="center"  width="50"  >�� ȣ</td> 
		<td align="center"  width="150" >�� ��</td> 
		<td align="center"  width="200" >�� ��</td>
		<td align="center"  width="150" >���бݾ�</td>
		<td align="center"  width="100" >�� ��</td> 
		<td align="center"  width="150" >�� ¥</td>
		
	</tr>

	<c:forEach var="article" items="${articleList}">
	
	<tr height="30">
		<td align="center"  width="50" >
			<c:out value="${number}"/>
			<c:set var="number" value="${number - 1}"/>
		</td>
		<td align="center"  width="150"> ${article.studentnum} </td>
		<td align="center"  width="200"> ${article.schtype} </td>
		<td align="center"  width="150"> ${article.money} </td>
		<td align="center"  width="100"> ${article.semester} </td>						
		<td align="center"  width="150">
			<fmt:formatDate value="${article.year}" type="both"  pattern="yyyy-MM-dd"/></td>
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
		<a href="ScholarshipList.khcu?pageNum=${startPage - 10 }">[����]</a>
	</c:if>

	<c:forEach var="i" begin="${startPage}" end="${endPage}">
		<a href="ScholarshipList.khcu?pageNum=${i}">[${i}]</a>
	</c:forEach>

	<c:if test="${endPage < pageCount}">
		<a href="staffCardList.khcu?pageNum=${startPage + 10}">[����]</a>
	</c:if>
</c:if>

</center>
</body>
</html>