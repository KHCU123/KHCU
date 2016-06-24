<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
$(function(){
    $('#studentnum').change(function() {   
            $.ajax({                
                url: "/KHCU/stNumber.khcu",                
                type: "POST",
                data: $('#studentnum').serialize(),
                processData: false,                
        
                success: function(data) {   
                	$('#studentnum').html(data)
					return false;
                }, error: function(jqXHR, textStatus, errorThrown) {
                    alert("½ÇÆÐ");
                }           
            });        
    });   
});
</script>



<c:if test="${majcode==0 }">
<input type="text" name="studentnum1" id="studentnum" ReadOnly/>
</c:if>
<c:if test="${majcode!=0 }">
<input type="text" name="studentnum1" id="studentnum" value="${studentnum}" ReadOnly/>
</c:if>

