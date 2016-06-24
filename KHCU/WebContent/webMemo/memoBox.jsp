<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
   

<center>
<c:if test="${count == 0 }">
<table border="1" bordercolor="d5d5d5" width="700" height="150" cellspacing="0" cellpadding="0 align="center">
<tr border="1" bordercolor="d5d5d5">
   <td border="1" bordercolor="d5d5d5" align="center">
	쪽지함이 비어있습니다.
   </td>
</tr>
</table>
</c:if>


<c:if test="${count > 0 }">
<table border="1" width="600">
<tr >
	<th align="center" >번호</th>
	<th align="center" >보낸사람</th>
	<th align="center" >내용</th>
	<th align="center" >날짜</th>
	<th align="center" >쪽지종류</th>	
</tr>

<c:forEach var="article1" items="${articleList1}">
<c:if test="${article1.memoType == 'normal'}">
	<tr height="30">
	<td align="center" width="60">
		<c:out value="${number}"/>
		<c:set var="number" value="${number -1 }"/>
	</td>
 	<td align="center" width="120">${article1.sender}</td>
 	<td align="center" width="180">
 	&nbsp;<a href="memoContent.khcu?num=${article1.num}">${article1.message}</a></td>
 	<td align="center" width="180">
 		<fmt:formatDate value="${article1.reg_date}" type="both"  pattern="yyyy-MM-dd"/>
 	</td>
 	<td align="center" width="120">${article1.memoType}</td> 	 	
</tr>
</c:if>

<c:if test="${article1.memoType != 'normal'}">
	<tr height="30">
	<td align="center" width="60">
		<c:out value="${number}"/>
		<c:set var="number" value="${number -1 }"/>
	</td>
 	<td align="center" width="120">${article1.sender}</td>
 	<td align="center" width="180">
 	&nbsp; 완료된 쪽지 시험 입니다. </td>
 	<td align="center" width="180">
 		<fmt:formatDate value="${article1.reg_date}" type="both"  pattern="yyyy-MM-dd"/>
 	</td>
 	<td align="center" width="120">${article1.memoType}</td> 	 	
</tr>
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
		<a href="memoBox.khcu?pageNum=${startPage - 10}">[이전]</a>
	</c:if>
	
	<c:forEach var="i" begin="${startPage }" end="${endPage }">
		<a href="memoBox.khcu?pageNum=${i}">${i}</a>
	</c:forEach>
	
	<c:if test="${endPage < pageCount }">
		<a href="memoBox.khcu?pageNum=${startPage + 10}">[다음]</a>
	</c:if>
</c:if>
<br/>

<input type="button" value="메인으로" onclick="javascript:location='main.khcu'">

</center>
</body>  
    