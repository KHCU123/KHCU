<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
$(function(){
    $('#studentnum').click(function() {   
            $.ajax({                
                url: "/KHCU/stNumber.khcu",                
                type: "POST",
                data: $('#form1').serialize(),
                processData: false,                
        
                success: function(data) {   
                	$('#studentnum').html(data)
					return false;
                }, error: function(jqXHR, textStatus, errorThrown) {
                    alert("실패");
                }           
            });        
    });   
});
</script>
<script language="javascript">
 function setid()
    {		
	 	var a = document.create.studentnum1.value;
	 	opener.document.form1.studentnum.value= a ;
		self.close();
	}
 </script>
<title>학번생성</title>
</head>
<body>
<form name="create" id="form1" method="post">
	<div id="studentnum"><input type="button" value="학번자동생성"></div>
	<input type="hidden" name="studentnum" value="<fmt:formatDate value="${year}" pattern="yy"/>${colcode}${majcode}${studentcode}${a}"/>
	<input type="hidden" name="stcollege" value="${colname }"/>
	<input type="hidden" name="stmajor" value="${majname }"/>
	<br/>
	<input type="button" value="닫기" onclick="setid();">
</form>
</body>
</html>