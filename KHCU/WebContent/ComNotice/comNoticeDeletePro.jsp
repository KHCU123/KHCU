<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<c:if test="${check == 1}">
	<script>
		alert("삭제가 완료되었습니다.");
		window.location.href='comNoticeList.khcu?pageNum=${pageNum}';
	</script>
</c:if>
<c:if test="${check != 1}">
	<script>
		alert("비밀번호가 맞지 않습니다.");
		history.go(-1);
	</script>
</c:if>