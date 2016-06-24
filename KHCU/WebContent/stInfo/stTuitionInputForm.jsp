<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>등록금 고지서 입력</title>
<script language="JavaScript">
	
    function checkIt() {
       
    	var form1 = eval("document.form1");
        if(!form1.year.value ) {
            alert("년도를 입력하세요");
            return false;
        }        
        if(!form1.money.value) {
            alert("금액을 입력하세요");
            return false;
        }             
    }
</script>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
$(function(){
    $('#college').change(function() {   
            $.ajax({                
                url: "/KHCU/Cselectbox2.khcu",                
                type: "POST",
                data: $('#form1').serialize(),
                processData: false,                
        
                success: function(data) {   
                	$('#major').html(data)
					return false;
                }, error: function(jqXHR, textStatus, errorThrown) {
                    alert("실패");
                }           
            });        
    });   
});
</script>
</head>
<body>
<form action="stTuitionInputPro.khcu" method="post" name="form1" id="form1" onSubmit="return checkIt()">
<table border="1" align="center">
	<tr>
		<td>년도</td>
		<td><input type="text" name="year"></td>
	</tr>
	<tr>
		<td>학기</td>
		<td><select name="semester">
			<option value="1">1학기</option>
			<option value="2">2학기</option></select>
		</td>
	</tr>
	<tr>
    	<td>단과대학</td>
		<td><select name="college" id="college">
		    <option value="">--------------------</option>
		    <c:forEach var="colList" items="${colList}" varStatus="i">
		    <option value="${colList.colName}">${colList.colName}</option>          
			</c:forEach></select>
		</td>
 	</tr>
 	<tr>
		<td>전공</td>
		<td><div id="major"></div></td>
    </tr>
    <tr>
    	<td>등록금</td>
    	<td><input type="text" name="money"></td>
    </tr>
</table>
<input type="submit" value="다음">
</form>
</body>
</html>
