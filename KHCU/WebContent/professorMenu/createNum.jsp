<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
$(function(){
    $('#proNum').click(function() {   
            $.ajax({                
                url: "/KHCU/pfNumber.khcu",                
                type: "POST",
                data: $('#form1').serialize(),
                processData: false,                
        
                success: function(data) {   
                	$('#proNum').html(data)
					return false;
                }, error: function(jqXHR, textStatus, errorThrown) {
                    alert("����");
                }           
            });        
    });   
});
</script>
<script language="javascript">
 function setid()
    {		
	 	var a = document.create.proNum1.value;
	 	opener.document.form1.proNum.value= a ;
		self.close();
	}
 </script>
<title>�й�����</title>
</head>
<body>
<form name="create" id="form1" method="post">
	<div id="proNum"><input type="button" value="�й��ڵ�����"></div>
	<input type="hidden" name="proNum" value="<fmt:formatDate value="${year}" pattern="yy"/>${colcode}${majcode}${professorcode}${a}"/>
	<input type="hidden" name="proCollege" value="${colname }"/>
	<input type="hidden" name="proMajor" value="${majname }"/>
	<br/>
	<input type="button" value="�ݱ�" onclick="setid();">
</form>
</body>
</html>