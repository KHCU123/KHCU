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

<table width="700">
	<tr>
		<td align="center">
			<input type="button" value="������ ����ϱ�" onclick="javascript:location='staffCardInputForm.khcu'">			
		</td>
	</tr>
</table>

<c:if test="${count == 0}">
<table width="700" border="1" cellpadding="0" cellspacing="0">
	<tr>
		<td align="center">
			��ϵ� ������ ������ �����ϴ�.
		</td>
	</tr>
</table>
</c:if>

<c:if test="${count > 0}">
<table border="1" width="900" cellpadding="5" cellspacing="0" align="center"> 
	<tr height="30"> 
		<td align="center"  width="50"  >�� ��</td> 
		<td align="center"  width="100" >�� ��</td> 
		<td align="center"  width="100" >�� ��</td>
		<td align="center"  width="100" >�ֹι�ȣ</td>
		<td align="center"  width="100" >��ȭ��ȣ</td> 
		<td align="center"  width="250" >�ּ�</td>
		<td align="center"  width="100" >��������</td>
		<td align="center"  width="100" >�� ¥</td>
		
	</tr>

	<c:forEach var="article" items="${articleList}">
	
	<tr>
		<td align="center" colspan="8">
			<input type="button" value="�׽�Ʈ ������ ����" onclick="javascipt:location='testDeleteForm.khcu?staffNum=${article.staffNum}&pageNum=${currentPage}'">
			<input type="button" value="������ ���� ��������" onclick="javascipt:location='staffCardModifyForm.khcu?staffNum=${article.staffNum}&pageNum=${currentPage}'">
		</td>
	</tr>
	
	<tr height="30">
		<td align="center"  width="50"> ${article.staffNum} </td>
		<td align="center"  width="100" rowspan="2"> ${article.staffDep} </td>
		<td align="center"  width="100" rowspan="2"> ${article.staffName} </td>
		<td align="center"  width="100" rowspan="2"> ${article.staffJumin1} - * </td>
		<td align="center"  width="100" rowspan="2"> ${article.staffPhone} </td>
		<td align="center"  width="250" rowspan="2"> ${article.staffPostcode} <br>
										 ${article.staffAddress1} &nbsp;&nbsp; ${article.staffAddress2} <br>
										 ${article.staffEmail} </td>
		
		<td align="center"  width="100"> ${article.staffState} </td>							
		<td align="center"  width="100" rowspan="2">
			<fmt:formatDate value="${article.staffReg_date}" type="both"  pattern="yyyy-MM-dd"/></td>
	</tr>
	<tr>
		<td align="center" width="50">
			<img src="/KHCU/StaffCard/photo/${article.staffProfileName}" width="50" height="50">
		</td>
		<td align="center" width="100">
			<input type="button" value="���" onclick="javascript:location='staffCardStateUpdatePro.khcu?staffNum=${article.staffNum}'">
		</td>
	<tr>
			
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
		<a href="staffCardList.khcu?pageNum=${startPage - 10 }">[����]</a>
	</c:if>

	<c:forEach var="i" begin="${startPage}" end="${endPage}">
		<a href="staffCardList.khcu?pageNum=${i}">[${i}]</a>
	</c:forEach>

	<c:if test="${endPage < pageCount}">
		<a href="staffCardList.khcu?pageNum=${startPage + 10}">[����]</a>
	</c:if>
</c:if>

</center>
</body>
</html>