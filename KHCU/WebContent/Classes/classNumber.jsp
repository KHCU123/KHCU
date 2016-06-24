<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
$(function(){
    $('#classCode').change(function() {   
            $.ajax({                
                url: "/KHCU/classNumber.khcu",                
                type: "POST",
                data: $('#classCode').serialize(),
                processData: false,                
        
                success: function(data) {   
                	$('#classCode').html(data)
					return false;
                }, error: function(jqXHR, textStatus, errorThrown) {
                    alert("½ÇÆÐ");
                }           
            });        
    });   
});
</script>



<c:if test="${majcode==0 }">
<input type="text" name="classCode1" id="classCode" ReadOnly/>
</c:if>
<c:if test="${majcode!=0 }">
<input type="text" name="classCode1" id="classCode" value="${classCode}" ReadOnly/>
</c:if>

