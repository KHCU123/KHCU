<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    

<div id="proMajor">
         <select name="proMajor">
         <option value="">-------------</option>
         <c:forEach var="majList" items="${majList}">
          <option value="${majList.majName}">${majList.majName}</option>
         </c:forEach>
         </select>
</div>
