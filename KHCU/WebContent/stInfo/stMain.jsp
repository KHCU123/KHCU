<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head><title>학사정보</title>

</head>
<body>
<script type="text/javascript" src="http://www.stalk.io/stalk.js" charset="utf-8"></script>
<script language="javascript">
	STALK.init();
</script>
<c:if test="${sessionScope.memId != null}">
	<input type="button" value="개인신상정보" onclick="javascript:location='stCard.khcu'"/>
	<input type="button" value="이번학기 성적조회" onclick="javascript:location='stScore.khcu'"/>
	<input type="button" value="전체 성적조회" onclick="javascript:location='stAllScore.khcu'"/>
	<input type="button" value="휴학관리" onclick="javascript:location='stHuhak.khcu'"/>
	<input type="button" value="장학금 내역" onclick="javascript:location='stCard.khcu'"/>
	<input type="button" value="성적 철회내역" onclick="javascript:location='stDropClass.khcu'"/>
</c:if>
</body>
</html>