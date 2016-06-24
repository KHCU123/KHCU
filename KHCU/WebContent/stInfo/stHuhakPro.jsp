<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="${check!=0}">
   <script> 
     alert("신청내역이 존재합니다.");
      history.go(-1);
   </script>
</c:if>
<c:if test="${check==0 }">
<c:redirect url="stHuhak.khcu"/>
</c:if>