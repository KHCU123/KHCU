<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
<title> 쪽지 보내기 </title>

<script language="JavaScript">
	
    function checkIt() {
       
    	var form1 = eval("document.form1");
        if(!form1.addressee.value ) {
            alert("받는 사람이 없습니다.");
            return false;
        }        
        var content_length = getByteLength(document.form1.message.value);
        if( 0 == content_length ){
         alert("내용을 등록하지 않으셨습니다.");
         return false;
        }
        
        function getByteLength(s){  // 글자를 바이트로 체크. 영어,숫자는 글자당 1byte 한글은 글자당2byte
        	 var len = 0;
        	 if ( s == null ) return 0;
        	 for(var i=0;i<s.length;i++){
        	  var c = escape(s.charAt(i));
        	  if ( c.length == 1 ) len ++;
        	  else if ( c.indexOf("%u") != -1 ) len += 2;
        	  else if ( c.indexOf("%") != -1 ) len += c.length/3;
        	 }
        	 return len;
        	}
    }    
</script>

</head>

<body>
<br><br>

<form method="post" action="memoExamPro.khcu" name="form1" id="form1" onSubmit="return checkIt()">
  <table border="1" align="center">
    <tr> 
    <td colspan="4" height="39" align="center">
       <font size="+1" ><b> 쪽지시험 보내기 </b></font></td>
    </tr>    
    <tr>
       <td>보내는 사람</td><td><input type="text" name="sender" value="${sender}" size="20" readonly /></td>
       <td>쪽지 유형</td><td><input type="text" name="memoType" value="exam" readonly /></td>
    </tr>
    <tr>
       <td>받는 사람</td><td colspan="3"><input type="text" name="addressee" value="${addressee}" size="55"></td>
    </tr>
    <tr>
    	<td>내용</td> <td colspan="3"><textarea cols="50" rows="4" name="message" id="message"></textarea></td>
    </tr>           
    <tr>
      <td colspan="4" align="center"> 
<input type="hidden" name="ref" value="${ref}">
          <input type="submit" name="confirm" value="보내기" >
          <input type="reset" name="reset" value="다시입력">
      </td>
    </tr>

  </table>
</form>
</body>
</html>