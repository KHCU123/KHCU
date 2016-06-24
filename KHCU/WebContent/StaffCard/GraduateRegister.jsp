<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="/css/Menu.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${sessionScope.checkId == 1}">
<c:redirect url="GraduateRegList.khcu"/>
</c:if>
<c:if test="${sessionScope.checkId != 1}">
<c:redirect url="GraduateConfirm.khcu"/>
</c:if>