<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
$(function(){
    $('#proNum').change(function() {   
            $.ajax({                
                url: "/KHCU/pfNumber.khcu",                
                type: "POST",
                data: $('#proNum').serialize(),
                processData: false,                
        
                success: function(data) {   
                	$('#proNum').html(data)
					return false;
                }, error: function(jqXHR, textStatus, errorThrown) {
                    alert("½ÇÆÐ");
                }           
            });        
    });   
});
</script>



<c:if test="${majcode==0 }">
<input type="text" name="proNum1" id="proNum" ReadOnly/>
</c:if>
<c:if test="${majcode!=0 }">
<input type="text" name="proNum1" id="proNum" value="${proNum}" ReadOnly/>
</c:if>

