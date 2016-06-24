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
								<td colspan="4">수강신청내역</td>
								<td>몇년도</td>
								<td>몇학기</td>
								<td>조회</td>
							</tr>
							
							<tr>
							</tr>
							
							<tr>
								<td colspan="7">기본인적사항</td>
							</tr>
							
							<tr>
								<td width="10%">학번</td>
								<td width="20%">${stDTO.studentnum}</td>
								<td width="15%">이름</td>
								<td width="20%">${stDTO.stname}</td>
								<td width="15%">학년</td>
								<td colspan="2">${stDTO.stgrade }</td>
							</tr>
							
							<tr>
								<td width="10%">소속대학</td>
								<td width="20%">${stDTO.stcollege }</td>
								<td width="15%">학부(학과)</td>
								<td width="20%">${stDTO.stmajor }</td>
								<td width="15%">부전공</td>
								<td colspan="2">${stDTO.stminor }</td>
							</tr>
							
							<tr>
								<td width="10%">학적상태</td>
								<td width="20%">${stDTO.ststate }</td>
								<td width="15%">주민등록번호</td>
								<td colspan="4">${stDTO.stjumin1 }-${dto.stjumin2 }</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
			
			<hr>
			
			<form name="search" action="stClassTime.khcu" method="post">
				<select name="classGrade" onChange="selectGrade()">
				<option value="1">1학년</option>
				<option value="2">2학년</option>		
				<option value="3">3학년</option>
				<option value="4">4학년</option>				
				</select>
				
				<select name="semester" onChange="selectSemester()">
				<option value="1">1학기</option>
				<option value="2">2학기</option>				
				</select>
			</form>

			<table border="1" width="90%">
				<tr>
					<td colspan="9">몇학년 몇학기</td>
				</tr>
				<tr>
					<td width="10%">강의코드</td>
					<td width="10%">담당교수</td>
					<td width="10%">전공</td>
					<td width="10%">강의이름</td>
					<td width="10%">학년</td>
					<td width="10%">학점</td>
					<td width="10%">강의시간</td>
					<td width="10%">강의타입</td>
					<td width="10%">강의계획서</td>
				</tr>

				<c:forEach var="list" items="${articleList}">
				<tr>

					<td>${list.classCode}</td> <td>${list.pfName }</td> <td>${list.major}</td> 
					<td>${list.className}</td> <td>${list.classGrade}</td> <td>${list.credit}</td> 
					<td>${list.classTime}</td> <td>${list.classType }</td> 
					<td><a href="/KHCU/classPlanner.khcu?classCode=${list.classCode}">강의계획서</a></td> 
				</tr>
				</c:forEach>
				
			</table>
			
			
			</center>

		
		<br>
<br>


    <table border="1" align="center">
 
    	
    	<tr align="center">
    		<td colspan="6" width="450">강의시간</td>     		
    	</tr>   	
    	
    	<tr>
    		<td width="100"></td>
    		<td width="70" align="center" >월</td>
    		<td width="70" align="center">화</td>
    		<td width="70" align="center">수</td>
    		<td width="70" align="center">목</td>
    		<td width="70" align="center">금</td>    		
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
