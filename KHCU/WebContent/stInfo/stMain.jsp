<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head><title>�л�����</title>

</head>
<body>
<script type="text/javascript" src="http://www.stalk.io/stalk.js" charset="utf-8"></script>
<script language="javascript">
	STALK.init();
</script>
<c:if test="${sessionScope.memId != null}">
	<input type="button" value="���νŻ�����" onclick="javascript:location='stCard.khcu'"/>
	<input type="button" value="�̹��б� ������ȸ" onclick="javascript:location='stScore.khcu'"/>
	<input type="button" value="��ü ������ȸ" onclick="javascript:location='stAllScore.khcu'"/>
	<input type="button" value="���а���" onclick="javascript:location='stHuhak.khcu'"/>
	<input type="button" value="���б� ����" onclick="javascript:location='stCard.khcu'"/>
	<input type="button" value="���� öȸ����" onclick="javascript:location='stDropClass.khcu'"/>
</c:if>
</body>
</html>