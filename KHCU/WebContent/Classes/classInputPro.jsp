<%@ page contentType="text/html;charset=euc-kr" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<% request.setCharacterEncoding("euc-kr");%>

<c:if test="${check == 0}">
	<c:redirect url="proMenu.khcu"/>
</c:if>
<c:if test="${check != 0}">
	<script>
		alert("���� �ð��� �ٸ� ���ǰ� �ֽ��ϴ�. �ð����� �ٽ� ���ּ���!");
		history.go(-1);
	</script>
</c:if>



	