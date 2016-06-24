<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script>
	function popupClose(){
		var test = document.form1.test.value;
		alert(test);
		open("/asdfsadf.jsp");
	}
</script>
</head>
<body>
	<form name="form1">
		<input type="text" name="test" value=""/>
		<input type="button" value="검색" name="button" onclick="popupClose()"/>
	</form>
</body>
</html>