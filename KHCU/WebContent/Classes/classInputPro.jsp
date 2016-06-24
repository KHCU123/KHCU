<%@ page contentType="text/html;charset=euc-kr" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<% request.setCharacterEncoding("euc-kr");%>

<c:if test="${check == 0}">
	<c:redirect url="proMenu.khcu"/>
</c:if>
<c:if test="${check != 0}">
	<script>
		alert("같은 시간에 다른 강의가 있습니다. 시간설정 다시 해주세요!");
		history.go(-1);
	</script>
</c:if>



	