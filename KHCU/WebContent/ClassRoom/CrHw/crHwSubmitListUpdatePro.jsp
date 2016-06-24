<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
	alert("과제 점수가 업데이트 되었습니다.");
	history.go(-1);
</script>
<c:redirect url="crHwSubmitList.khcu?classcode=${classcode }"/>