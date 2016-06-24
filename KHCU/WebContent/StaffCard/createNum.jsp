<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
$(function(){
    $('#staffNum').click(function() {   
            $.ajax({                
                url: "/KHCU/staffNumber.khcu",                
                type: "POST",
                data: $('#form1').serialize(),
                processData: false,                
        
                success: function(data) {   
                	$('#staffNum').html(data)
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
	 	var a = document.create.staffNum1.value;
	 	opener.document.userinput.staffNum.value= a ;
		self.close();
	}
 </script>
<title>학번생성</title>
</head>
<body>
<form name="create" id="form1" method="post">
	<div id="staffNum"><input type="button" value="사번자동생성"></div>
	<input type="hidden" name="staffNum" value="<fmt:formatDate value="${year}" pattern="yy"/>${0}${staffDep}${staffcode}"/>
	<input type="hidden" name="staffDep" value="${staffDep }"/>
	<br/>
	<input type="button" value="확인" onclick="setid();">
</form>
</body>
</html>