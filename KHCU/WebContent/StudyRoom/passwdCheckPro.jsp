<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${check != 1 }">
	<script>
		alert("��й�ȣ�� �ٸ��ϴ�.");
		history.go(-1);
	</script>
</c:if>
<c:if test="${check == 1 }">
	<c:redirect url="studyRoomEnter.khcu?num=${num}"/>
</c:if>
