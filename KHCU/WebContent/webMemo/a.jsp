<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
   

<c:if test="${count == 0 }">
<table border="1" bordercolor="d5d5d5" width="700" height="150" cellspacing="0" cellpadding="0">
<tr border="1" bordercolor="d5d5d5">
   <td border="1" bordercolor="d5d5d5" align="center">
	�������� ����ֽ��ϴ�.
   </td>
</tr>
</table>
</c:if>

#�Ϲ�����#
<c:if test="${count > 0 }">
<table border="1" width="300">
<tr >
	<th align="center" >��ȣ</th>
	<th align="center" >�������</th>
	<th align="center" >����</th>
	<th align="center" >��¥</th>
	<th align="center" >��������</th>	
</tr>

<c:forEach var="article1" items="${articleList1}">
<c:if test="${mt==1}">
<c:if test="${article1.memoType=='normal'}">
	<tr height="30">
	<td align="center" width="30">
		<c:out value="${number}"/>
		<c:set var="number" value="${number -1 }"/>
	</td>
 	<td align="center" width="60">${article1.sender}</td>
 	<td align="center" width="90">${article1.message}</td>
 	<td align="center" width="90">${article1.reg_date}</td>
 	<td align="center" width="60">${article1.memoType}</td> 	 	
</tr>
</c:if>
</c:if>
</c:forEach>
</table>

<br>

#��������#
<table border="1" width="300">
<tr >
	<th align="center" >��ȣ</th>
	<th align="center" >�������</th>
	<th align="center" >����</th>
	<th align="center" >��¥</th>
	<th align="center" >��������</th>	
</tr>

<c:forEach var="article1" items="${articleList1}">
<c:if test="${mt==2}">
<c:if test="${article1.memoType=='exam'}">
	<tr height="30">
	<td align="center" width="30">
		<c:out value="${number}"/>
		<c:set var="number" value="${number -1 }"/>
	</td>
 	<td align="center" width="60">${article1.sender}</td>
 	<td align="center" width="90">${article1.message}</td>
 	<td align="center" width="90">${article1.reg_date}</td>
 	<td align="center" width="60">${article1.memoType}</td> 	 	
</tr>
</c:if>
</c:if>
</c:forEach>
</table>

<br>
	<c:set var="pageCount" value="${count / pageSize + (count % pageSize == 0 ? 0 : 1) }"/>
	<c:set var="pageBlock" value="${10 }"/>
	<fmt:parseNumber var="result" value="${currentPage/10 }" integerOnly="true"/>
	<c:set var="startPage" value="${result * 10 + 1 }"/>
	<c:set var="endPage" value="${startPage + pageBlock -1 }"/>
	<c:if test="${endPage > pageCount }">
		<c:set var="endPage" value="${pageCount }"/>
	</c:if>
	
	<c:if test="${startPage > 10 }">
		<a href="memoBox.khcu?pageNum=${startPage - 10}">[����]</a>
	</c:if>
	
	<c:forEach var="i" begin="${startPage }" end="${endPage }">
		<a href="memoBox.khcu?pageNum=${i}">${i}</a>
	</c:forEach>
	
	<c:if test="${endPage < pageCount }">
		<a href="memoBox.khcu?pageNum=${startPage + 10}">[����]</a>
	</c:if>
</c:if>
<br/>

<input type="button" value="��������" onclick="javascript:location='main.khcu'">

</center>
</body>  
    