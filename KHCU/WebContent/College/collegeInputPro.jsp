<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="${check == 0}">
	<c:redirect url="collegeList.khcu"/>
</c:if>
<c:if test="${check == 1}">
	<script>
		alert("이미 동일한 이름의 학과가 등록되어 있습니다.");
		history.go(-1);
	</script>
</c:if>
