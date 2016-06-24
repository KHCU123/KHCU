<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="/css/Menu.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
	<title> ��ϱ� ���� �Ϸ� ó�� ����Ʈ </title>
</head>

<body>
<center><b> ��ϱ� ���� �Ϸ� ó�� ����Ʈ </b>

<c:if test="${count == 0}">
<table width="1000" border="1" cellpadding="0" cellspacing="0">
	<tr>
		<td align="center">
			��ϱ� ���� �ϷḦ ó���� ������ �����ϴ�.
		</td>
	</tr>
</table>
</c:if>

<c:if test="${count > 0}">
<table border="1" width="1000" cellpadding="5" cellspacing="0" align="center"> 
	<tr height="30"> 
		<td align="center"  width="50" >��ȣ</td> 
		<td align="center"  width="100" >�й�</td> 
		<td align="center"  width="100" >�̸�</td>
		<td align="center"  width="200" >����</td>		
		<td align="center"  width="200" >�а�</td>	
		<td align="center"  width="50" >�г�</td>	
		<td align="center"  width="50" >�б�</td>	
		<td align="center"  width="100" >�ݾ�</td>
		<td align="center"  width="100" >����</td>
		<td align="center"  width="200" >��¥</td>
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
		<a href="StudentTuitionPayOkList.khcu?pageNum=${startPage - 10 }">[����]</a>
	</c:if>

	<c:forEach var="i" begin="${startPage}" end="${endPage}">
		<a href="StudentTuitionPayOkList.khcu?pageNum=${i}">[${i}]</a>
	</c:forEach>

	<c:if test="${endPage < pageCount}">
		<a href="StudentTuitionPayOkList.khcu?pageNum=${startPage + 10}">[����]</a>
	</c:if>
</c:if>

</center>
</body>
</html>