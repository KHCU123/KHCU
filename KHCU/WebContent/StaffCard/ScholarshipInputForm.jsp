<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="/css/Menu.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
<title> 장학생 등록 </title>

<script language="JavaScript">
    function checkIt() {
        var userinput = eval("document.userinput");
        
        if(!userinput.studentnum.value) {
            alert("학번을 입력하세요");
            return false;
        }
        if(userinput.studentnum_hidden.value != userinput.studentnum.value) {
            alert("학번 확인을 해주세요");
            return false;
        }
    }
    
    function openConfirmNum(userinput) {
        // url과 사용자 입력 id를 조합합니다.
        url = "ScholarStnumCheck.khcu?studentnum=" + userinput.studentnum.value ;
        
        // 새로운 윈도우를 엽니다.
        open(url, "confirm", 
        "toolbar=no, location=no,status=no,menubar=no,scrollbars=no,resizable=no,width=300, height=200");
    }
    
</script>

</head>

<body>
<br><br>

<form method="post" action="ScholarshipInputPro.khcu" name="userinput" onSubmit="return checkIt()">
  <table border="1" align="center">
    <tr> 
    <td colspan="2" height="39" align="center">
       <font size="+1" ><b> 장학생 등록 </b></font></td>
    </tr>
    <tr>
    	<td>분 류</td>
    	<td>
    		<select name="schtype">
	   			<option value="성적우수">성적우수</option>
	   			<option value="봉사장학">봉사장학</option>
	   			<option value="특별장학">특별장학</option>
			</select>
		</td>
    </tr>
    
    <tr>
       <td>학 번</td>
       <td>
       		<input type="text" name="studentnum"/>&nbsp;
       		<input type="hidden" name="studentnum_hidden" maxlength="12">
        	<input type="button" name="confirmNum" value="학번 확인" OnClick="openConfirmNum(this.form)">
      </td>
    </tr>
    <tr>
       <td>장학금액</td>
       <td>
       		<input type="text" name="money" maxlength="20" size="30" placeholder=" 숫자만 입력 가능" onkeypress='return event.charCode >= 48 && event.charCode <= 57'>
       </td>
    </tr>
    <tr>
      <td>학 기</td><td><input type="text" name="semester" maxlength="12" readonly></td>
    </tr>    
    <tr>
      <td colspan="2" align="center"> 
      <br>
          <input type="submit" name="confirm" value="등   록" >
          <input type="reset" name="reset" value="다시입력">
      </td>
    </tr>
  </table>
</form>
</body>
</html>