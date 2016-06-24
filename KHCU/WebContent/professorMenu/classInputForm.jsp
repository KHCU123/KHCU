<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
    <script>
    function selectTime(userinput) {
    	
    	if (userinput.classType.value == 2) {
            alert("라이브강의만 시간선택이 가능합니다.");
            return;
        }

        // url과 사용자 입력 id를 조합합니다.
        url = "classInputForm2.khcu";
        
        // 새로운 윈도우를 엽니다.
        open(url, "confirm", 
        "toolbar=no, location=no,status=no,menubar=no,scrollbars=no,resizable=no,width=200, height=350");
    }
</script>

    
    <center>
    
    <br><br>
    
    <form action="classInputPro.khcu" method="post" name="userinput">

    <table border="1" align="center">
    
    	<tr>
    		<td>강의명</td> <td colspan="2"><input type="text" name="className"></td>
    		<td>강의유형</td> <td colspan="2"><select name="classType">
							<option value="1">라이브 강의</option>
							<option value="2">녹화 강의</option>				
							</select>
						<input type="button" value="강의시간선택" onclick="selectTime(this.form)">
						</td> 
    		
    	</tr>
    	
    	<tr>
    		<td>학기</td> <td colspan="2"><select name="semester">
							<option value="1">1학기</option>
							<option value="2">2학기</option>				
							</select>
						</td> 

			<td>학년</td> <td colspan="2"><select name="classGrade">
							<option value="1">1학년</option>
							<option value="2">2학년</option>	
							<option value="3">3학년</option>		
							<option value="4">4학년</option>			
							</select>
						</td> 
    	</tr>
    
    	<tr>

    		<td>강의시간</td> <td colspan="2"><input type="text" name="classTime"></td>
    		<td>학점</td> <td colspan="2"><input type="text" name="credit"></td>
    	</tr> 
    	
 
    	
    	<tr>
    		<td>최대인원</td> <td colspan="2"><input type="text" name="maxNum"></td> <td>평가기준</td> <td colspan="2"><input type="text" name="plan_score" placeholder="중간고사/기말고사/퀴즈/과제/출결"></td>
    	</tr>
    	
    	<tr>
    		<td>단과대학</td> <td colspan="2"><input type="text" name="college"></td> <td>학과</td> <td colspan="2"><input type="text" name="major"></td>
    	</tr>

    	<tr>
    		<td>교재</td> <td colspan="5"><input type="text" name="plan_book"></td>
    	</tr>
    	
    	<tr>
    		<td>강의목표</td> <td colspan="5"><textarea cols="50" rows="4" name="plan_goal"> </textarea></td>
    	</tr>
    	
	
    	<tr align="center">
    	<td colspan="6"> 강의 계획서 </td>
    	<tr>
    	
    	<tr>
    		<td>1 주차</td> <td colspan="2"><input type="text" name="plan_w1"></td> 
    		<td>9 주차</td> <td colspan="2"><input type="text" name="plan_w9"></td>
    	</tr>
    	
    	<tr>
    		<td>2 주차</td> <td colspan="2"><input type="text" name="plan_w2"></td> 
    		<td>10 주차</td> <td colspan="2"><input type="text" name="plan_w10"></td>
    	</tr>
    	
    	<tr>
    		<td>3 주차</td> <td colspan="2"><input type="text" name="plan_w3"></td> 
    		<td>11 주차</td> <td colspan="2"><input type="text" name="plan_w11"></td>
    	</tr>
    	
    	<tr>
    		<td>4 주차</td> <td colspan="2"><input type="text" name="plan_w4"></td> 
    		<td>12 주차</td> <td colspan="2"><input type="text" name="plan_w12"></td>
    	</tr>
    	
    	<tr>
    		<td>5 주차</td> <td colspan="2"><input type="text" name="plan_w5"></td> 
    		<td>13 주차</td> <td colspan="2"><input type="text" name="plan_w13"></td>
    	</tr>
    	
    	<tr>
    		<td>6 주차</td> <td colspan="2"><input type="text" name="plan_w6"></td> 
    		<td>14 주차</td> <td colspan="2"><input type="text" name="plan_w14"></td>
    	</tr>
    	
    	<tr>
    		<td>7 주차</td> <td colspan="2"><input type="text" name="plan_w7"></td> 
    		<td>15 주차</td> <td colspan="2"><input type="text" name="plan_w15"></td>
    	</tr>
    	
    	<tr>
    		<td>8 주차</td> <td colspan="2"><input type="text" name="plan_w8"></td> 
    		<td>16 주차</td> <td colspan="2"><input type="text" name="plan_w16"></td>
    	</tr> 	
    	
    </table>
    	
    	<br>
    	
    	
    	<br>
    	
    
    <input type="submit" value="다음">
    
   </form>
    
    </center>