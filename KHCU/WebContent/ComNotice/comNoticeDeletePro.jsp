<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<c:if test="${check == 1}">
	<script>
		alert("������ �Ϸ�Ǿ����ϴ�.");
		window.location.href='comNoticeList.khcu?pageNum=${pageNum}';
	</script>
</c:if>
<c:if test="${check != 1}">
	<script>
		alert("��й�ȣ�� ���� �ʽ��ϴ�.");
		history.go(-1);
	</script>
</c:if>