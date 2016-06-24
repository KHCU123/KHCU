<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<script type="text/javascript" src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
<script type="text/javascript">

 window.onload=function(){
		document.search.classGrade.value="${classGrade}";
		document.search.semester.value="${semester}";
	}
 
 function selectGrade(){
	 document.search.action = "/KHCU/stClassTime.khcu";
	 document.search.submit();
	}
 function selectSemester(){
	 document.search.action = "/KHCU/stClassTime.khcu";
	 document.search.submit();
	}  
 
 </script>


		<center>
			<table width="90%">
				<tr>
					<td>
						<table border="1" width="100%">
							<tr>
								<td colspan="4">������û����</td>
								<td>��⵵</td>
								<td>���б�</td>
								<td>��ȸ</td>
							</tr>
							
							<tr>
							</tr>
							
							<tr>
								<td colspan="7">�⺻��������</td>
							</tr>
							
							<tr>
								<td width="10%">�й�</td>
								<td width="20%">${stDTO.studentnum}</td>
								<td width="15%">�̸�</td>
								<td width="20%">${stDTO.stname}</td>
								<td width="15%">�г�</td>
								<td colspan="2">${stDTO.stgrade }</td>
							</tr>
							
							<tr>
								<td width="10%">�ҼӴ���</td>
								<td width="20%">${stDTO.stcollege }</td>
								<td width="15%">�к�(�а�)</td>
								<td width="20%">${stDTO.stmajor }</td>
								<td width="15%">������</td>
								<td colspan="2">${stDTO.stminor }</td>
							</tr>
							
							<tr>
								<td width="10%">��������</td>
								<td width="20%">${stDTO.ststate }</td>
								<td width="15%">�ֹε�Ϲ�ȣ</td>
								<td colspan="4">${stDTO.stjumin1 }-${dto.stjumin2 }</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
			
			<hr>
			
			<form name="search" action="stClassTime.khcu" method="post">
				<select name="classGrade" onChange="selectGrade()">
				<option value="1">1�г�</option>
				<option value="2">2�г�</option>		
				<option value="3">3�г�</option>
				<option value="4">4�г�</option>				
				</select>
				
				<select name="semester" onChange="selectSemester()">
				<option value="1">1�б�</option>
				<option value="2">2�б�</option>				
				</select>
			</form>

			<table border="1" width="90%">
				<tr>
					<td colspan="9">���г� ���б�</td>
				</tr>
				<tr>
					<td width="10%">�����ڵ�</td>
					<td width="10%">��米��</td>
					<td width="10%">����</td>
					<td width="10%">�����̸�</td>
					<td width="10%">�г�</td>
					<td width="10%">����</td>
					<td width="10%">���ǽð�</td>
					<td width="10%">����Ÿ��</td>
					<td width="10%">���ǰ�ȹ��</td>
				</tr>

				<c:forEach var="list" items="${articleList}">
				<tr>

					<td>${list.classCode}</td> <td>${list.pfName }</td> <td>${list.major}</td> 
					<td>${list.className}</td> <td>${list.classGrade}</td> <td>${list.credit}</td> 
					<td>${list.classTime}</td> <td>${list.classType }</td> 
					<td><a href="/KHCU/classPlanner.khcu?classCode=${list.classCode}">���ǰ�ȹ��</a></td> 
				</tr>
				</c:forEach>
				
			</table>
			
			
			</center>

		
		<br>
<br>


    <table border="1" align="center">
 
    	
    	<tr align="center">
    		<td colspan="6" width="450">���ǽð�</td>     		
    	</tr>   	
    	
    	<tr>
    		<td width="100"></td>
    		<td width="70" align="center" >��</td>
    		<td width="70" align="center">ȭ</td>
    		<td width="70" align="center">��</td>
    		<td width="70" align="center">��</td>
    		<td width="70" align="center">��</td>    		
    	</tr>
    	

    	
    	<tr align="center">
    		<td>9:00~10:00</td>
    		<td bgcolor="${mon1a}">${mon1}</td>
    		<td bgcolor="${tue1a}">${tue1}</td>
    		<td bgcolor="${wed1a}">${wed1}</td>
    		<td bgcolor="${thu1a}">${thu1}</td>
    		<td bgcolor="${fri1a}">${fri1}</td>    		
    	</tr>
    	
    	
    	<tr align="center">
    		<td>10:00~11:00</td>
    		<td bgcolor="${mon2a}">${mon2}</td>
    		<td bgcolor="${tue2a}">${tue2}</td>
    		<td bgcolor="${wed2a}">${wed2}</td>
    		<td bgcolor="${thu2a}">${thu2}</td>
    		<td bgcolor="${fri2a}">${fri2}</td>      	
    	</tr>
    	
    	<tr align="center">
    		<td>11:00~12:00</td>
    		<td bgcolor="${mon3a}">${mon3}</td>
    		<td bgcolor="${tue3a}">${tue3}</td>
    		<td bgcolor="${wed3a}">${wed3}</td>
    		<td bgcolor="${thu3a}">${thu3}</td>
    		<td bgcolor="${fri3a}">${fri3}</td>     		
    	</tr>
    	
    	<tr align="center">
    		<td>12:00~13:00</td>
    		<td bgcolor="${mon4a}">${mon4}</td>
    		<td bgcolor="${tue4a}">${tue4}</td>
    		<td bgcolor="${wed4a}">${wed4}</td>
    		<td bgcolor="${thu4a}">${thu4}</td>
    		<td bgcolor="${fri4a}">${fri4}</td>    		
    	</tr>
    	
    	<tr align="center">
    		<td>13:00~14:00</td>
    		<td bgcolor="${mon5a}">${mon5}</td>
    		<td bgcolor="${tue5a}">${tue5}</td>
    		<td bgcolor="${wed5a}">${wed5}</td>
    		<td bgcolor="${thu5a}">${thu5}</td>
    		<td bgcolor="${fri5a}">${fri5}</td>     	
    	</tr>
    	
    	<tr align="center">
    		<td>14:00~15:00</td>
    		<td bgcolor="${mon6a}">${mon6}</td>
    		<td bgcolor="${tue6a}">${tue6}</td>
    		<td bgcolor="${wed6a}">${wed6}</td>
    		<td bgcolor="${thu6a}">${thu6}</td>
    		<td bgcolor="${fri6a}">${fri6}</td>   		
    	</tr>
    	
    	<tr align="center">
    		<td>15:00~16:00</td>
    		<td bgcolor="${mon7a}">${mon7}</td>
    		<td bgcolor="${tue7a}">${tue7}</td>
    		<td bgcolor="${wed7a}">${wed7}</td>
    		<td bgcolor="${thu7a}">${thu7}</td>
    		<td bgcolor="${fri7a}">${fri7}</td>   
    	</tr>
    	
    	<tr align="center">
    		<td>16:00~17:00</td>
    		<td bgcolor="${mon8a}">${mon8}</td>
    		<td bgcolor="${tue8a}">${tue8}</td>
    		<td bgcolor="${wed8a}">${wed8}</td>
    		<td bgcolor="${thu8a}">${thu8}</td>
    		<td bgcolor="${fri8a}">${fri8}</td>     		
    	</tr>
    	
    	<tr align="center">
    		<td>17:00~18:00</td>
    		<td bgcolor="${mon9a}">${mon9}</td>
    		<td bgcolor="${tue9a}">${tue9}</td>
    		<td bgcolor="${wed9a}">${wed9}</td>
    		<td bgcolor="${thu9a}">${thu9}</td>
    		<td bgcolor="${fri9a}">${fri9}</td>   	
    	</tr>
    	</table>		
