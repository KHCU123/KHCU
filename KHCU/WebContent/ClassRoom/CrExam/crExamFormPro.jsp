<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  

<html>
<head>
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.0/jquery.min.js"></script>
	<script type="text/javascript" src="/KHCU/js/jquery.js"></script>
</head>
<body>
    <script>
    $(function(){
    	alert("����� ������ ${correctAnswers } / ${questions }");
    	location.href="crExamContent.khcu";  
    	});

    </script>
</body>
</html>