<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
    
    <center>


   <table border="1">
   
    	
    	<tr align="center">
    		<td colspan="6">강의시간</td>     		
    	</tr>   	
    	
    	<tr>
    		<td></td>
    		<td>월</td>
    		<td>화</td>
    		<td>수</td>
    		<td>목</td>
    		<td>금</td>    		
    	</tr>
    	
    	<tr align="center">
    		<td>9:00~10:00</td>
    		<td><input type="checkbox" name="classTime" value="mon1"></td>
    		<td><input type="checkbox" name="classTime" value="tue1"></td>
    		<td><input type="checkbox" name="classTime" value="wed1"></td>
    		<td><input type="checkbox" name="classTime" value="thu1"></td>
    		<td><input type="checkbox" name="classTime" value="fri1"></td>    		
    	</tr>
    	
    	<tr align="center">
    		<td>10:00~11:00</td>
    		<td><input type="checkbox" name="classTime" value="mon2"></td>
    		<td><input type="checkbox" name="classTime" value="tue2"></td>
    		<td><input type="checkbox" name="classTime" value="wed2"></td>
    		<td><input type="checkbox" name="classTime" value="thu2"></td>
    		<td><input type="checkbox" name="classTime" value="fri2"></td>    	
    	</tr>
    	
    	<tr align="center">
    		<td>11:00~12:00</td>
    		<td><input type="checkbox" name="classTime" value="mon3"></td>
    		<td><input type="checkbox" name="classTime" value="tue3"></td>
    		<td><input type="checkbox" name="classTime" value="wed3"></td>
    		<td><input type="checkbox" name="classTime" value="thu3"></td>
    		<td><input type="checkbox" name="classTime" value="fri3"></td>    		
    	</tr>
    	
    	<tr align="center">
    		<td>12:00~13:00</td>
    		<td><input type="checkbox" name="classTime" value="mon4"></td>
    		<td><input type="checkbox" name="classTime" value="tue4"></td>
    		<td><input type="checkbox" name="classTime" value="wed4"></td>
    		<td><input type="checkbox" name="classTime" value="thu4"></td>
    		<td><input type="checkbox" name="classTime" value="fri4"></td>    		
    	</tr>
    	
    	<tr align="center">
    		<td>13:00~14:00</td>
    		<td><input type="checkbox" name="classTime" value="mon5"></td>
    		<td><input type="checkbox" name="classTime" value="tue5"></td>
    		<td><input type="checkbox" name="classTime" value="wed5"></td>
    		<td><input type="checkbox" name="classTime" value="thu5"></td>
    		<td><input type="checkbox" name="classTime" value="fri5"></td>    	
    	</tr>
    	
    	<tr align="center">
    		<td>14:00~15:00</td>
    		<td><input type="checkbox" name="classTime" value="mon6"></td>
    		<td><input type="checkbox" name="classTime" value="tue6"></td>
    		<td><input type="checkbox" name="classTime" value="wed6"></td>
    		<td><input type="checkbox" name="classTime" value="thu6"></td>
    		<td><input type="checkbox" name="classTime" value="fri6"></td>    		
    	</tr>
    	
    	<tr align="center">
    		<td>15:00~16:00</td>
    		<td><input type="checkbox" name="classTime" value="mon7"></td>
    		<td><input type="checkbox" name="classTime" value="tue7"></td>
    		<td><input type="checkbox" name="classTime" value="wed7"></td>
    		<td><input type="checkbox" name="classTime" value="thu7"></td>
    		<td><input type="checkbox" name="classTime" value="fri7"></td>    	
    	</tr>
    	
    	<tr align="center">
    		<td>16:00~17:00</td>
    		<td><input type="checkbox" name="classTime" value="mon8"></td>
    		<td><input type="checkbox" name="classTime" value="tue8"></td>
    		<td><input type="checkbox" name="classTime" value="wed8"></td>
    		<td><input type="checkbox" name="classTime" value="thu8"></td>
    		<td><input type="checkbox" name="classTime" value="fri8"></td>    		
    	</tr>
    	
    	<tr align="center">
    		<td>17:00~18:00</td>
    		<td><input type="checkbox" name="classTime" value="mon9"></td>
    		<td><input type="checkbox" name="classTime" value="tue9"></td>
    		<td><input type="checkbox" name="classTime" value="wed9"></td>
    		<td><input type="checkbox" name="classTime" value="thu9"></td>
    		<td><input type="checkbox" name="classTime" value="fri9"></td>    	
    	</tr>
    	

    	</table>
    	
    	<input type="button" value="확인" onclick="setTime()">

    	
    	</center>
    	
    	<script language="javascript">

  function setTime()
    {	
	var time_checkbox = document.getElementsByName("classTime");
	var selectTime='';
	var cc = 0;
	
	for(var i = 0; i<time_checkbox.length ; i++){
		
		if(time_checkbox[i].checked==true){
			cc++;
			selectTime = time_checkbox[i].value + ',' + selectTime;
		}		
		if(cc>3){
			alert("최대 3학점 까지 강의 가능합니다.")
			return;
		}
	}	

    	opener.document.userinput.classTime.value=selectTime;
    	opener.document.userinput.credit.value=cc;
		self.close();
		}
	
</script>
    	