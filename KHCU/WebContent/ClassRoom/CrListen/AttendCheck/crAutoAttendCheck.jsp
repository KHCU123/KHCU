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
		    	window.setInterval('callAjax()', 900000); //15�и��� �ѹ��� �Լ��� �����Ѵ�..!! 
		    });
		    
		    function callAjax(){
		    	 $.ajax({
		 	        type: "post",
		 	        url : "/KHCU/crAutoAttendCheckPro.khcu?classcode=${classcode}",
		 	        success: test,	// ��������û ������ ���� �Լ�
		 	        error: whenError	//��������û ���н� �����Լ�
		      	});
		    }
		    function test(aaa){	// ��û������ ������������ aaa ������ �ݹ�ȴ�. 
		        $('#AutoCheck').html(aaa);	//id�� ajaxReturn�� �κп� �־��
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