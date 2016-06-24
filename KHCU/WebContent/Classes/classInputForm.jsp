<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
    <script language="JavaScript">
	
    function checkIt() {
       
    	var form1 = eval("document.form1");
        if(!form1.className.value ) {
            alert("강의명을 입력하세요");
            return false;
        }        
        if(!form1.maxNum.value) {
            alert("최대인원을 입력하세요");
            return false;
        }    
        if(!form1.plan_score.value) {
            alert("평가기준을 입력하세요");
            return false;
        }          

    }
   
    
    function selectTime(form1) {
    	
    	if (form1.classType.value == 2) {
    		document.form1.classTime.value="녹화강의";
    		self.close();
        }
    	
    	if (form1.classType.value == 1) {
        url = "classInputForm2.khcu";
        open(url, "confirm", 
        "toolbar=no, location=no,status=no,menubar=no,scrollbars=no,resizable=no,width=200, height=350");
    	}
    }
    
function createNum(){
    	
    	var form1 = eval("document.form1");
    	if(!form1.college.value){
    		alert("단과대학을 선택하세요");
    		return false;
    	}
    	if(!form1.major.value){
    		alert("전공을 선택하세요");
    		return false;
    	}

    	 url = "/KHCU/classcreateNum.khcu?college=" + form1.college.value + "&major=" + form1.major.value +"&classCode" + form1.classCode.value ;
    	open(url, "confirm", 
        "toolbar=no, location=no,status=no,menubar=no,scrollbars=no,resizable=no,width=300, height=200");
    } 
    
    
</script>

<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
$(function(){
    $('#college').change(function() {   
            $.ajax({                
                url: "/KHCU/Cselectbox2.khcu",                
                type: "POST",
                data: $('#form1').serialize(),
                processData: false,                
        
                success: function(data) {   
                	$('#major').html(data)
					return false;
                }, error: function(jqXHR, textStatus, errorThrown) {
                    alert("실패");
                }           
            });        
    });   
});
</script>

    
    <center>
    
    <br><br>
    
    <form action="classInputPro.khcu" method="post" name="form1" id="form1" onSubmit="return checkIt()">

    <table border="1" align="center">
    
    <tr>
    	<td>강의코드</td><td colspan="2"><input type="text" name="classCode" readonly/>&nbsp;<input type="button" value="강의코드생성" onclick="createNum()"></td>
    	<td>교수명</td> <td colspan="2">${proDTO.proName}</td>
    	<input type="hidden" name="pfName" value="${proDTO.proName}">
    	<input type="hidden" name="pfNum" value="${proDTO.proNum}">
    	<input type="hidden" name="state" value="대기중">
    </tr>
    
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

    		<td>강의시간</td> <td colspan="2"><input type="text" name="classTime" placeholder="녹화강의는 시간입력이 필요 없습니다."></td>

    		<td>학점</td> <td colspan="2"><input type="text" name="credit"></td>
    	</tr> 
    	
    	
 
    	
    	<tr>
    		<td>최대인원</td> <td colspan="2"><input type="text" name="maxNum"></td> 
    		<td>평가기준</td> <td colspan="2"><input type="text" name="plan_score" placeholder="중간고사/기말고사/퀴즈/과제/출결"></td>
    	</tr>
    	
    	<tr>
    		<td>단과대학</td>
		      <td align="center" colspan="2"> 
		        <select name="college" id="college">
		            <option value="">--------------------</option>
		            <c:forEach var="colList" items="${colList}" varStatus="i">
		            <option value="${colList.colName}">${colList.colName}</option>          
					</c:forEach>
		      		</select>
		      </td>
 
		    <td>전공</td>
		      <td align="center" colspan="2"> 
		       	<div id="major"></div>
		      </td>
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
    
    <input type="button" value="리스트보기" onclick="javascript:window.location='classTimeTable.khcu'">
    
   </form>
    
    </center>