<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
$(function(){
    $('#staffNum').change(function() {   
            $.ajax({                
                url: "/KHCU/staffNumber.khcu",                
                type: "POST",
                data: $('#staffNum').serialize(),
                processData: false,                
        
                success: function(data) {   
                	$('#staffNum').html(data)
					return false;
                }, error: function(jqXHR, textStatus, errorThrown) {
                    alert("½ÇÆÐ");
                }           
            });        
    });   
});
</script>



<c:if test="${staffDep==0 }">
<input type="text" name="staffNum1" id="staffNum" ReadOnly/>
</c:if>
<c:if test="${staffDep!=0 }">
<input type="text" name="staffNum1" id="staffNum" value="${staffNum}" ReadOnly/>
</c:if>

