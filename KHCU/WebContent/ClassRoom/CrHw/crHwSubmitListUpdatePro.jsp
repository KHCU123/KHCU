<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
	alert("���� ������ ������Ʈ �Ǿ����ϴ�.");
	history.go(-1);
</script>
<c:redirect url="crHwSubmitList.khcu?classcode=${classcode }"/>