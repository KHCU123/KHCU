<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
  <script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
		  <script type="text/javascript">
		  
		    $(document).ready(function(){
		    	window.setInterval('callAjax()', 900000); //15분마다 한번씩 함수를 실행한다..!! 
		    });
		    
		    function callAjax(){
		    	 $.ajax({
		 	        type: "post",
		 	        url : "/KHCU/crAutoAttendCheckPro.khcu?classcode=${classcode}",
		 	        success: test,	// 페이지요청 성공시 실행 함수
		 	        error: whenError	//페이지요청 실패시 실행함수
		      	});
		    }
		    function test(aaa){	// 요청성공한 페이지정보가 aaa 변수로 콜백된다. 
		        $('#AutoCheck').html(aaa);	//id가 ajaxReturn인 부분에 넣어라
		    }
		    function whenError(){
		        alert("Error");
		    }

		  </script>
</head>
<body>
	<div id="AutoCheck"></div>
</body>
</html>