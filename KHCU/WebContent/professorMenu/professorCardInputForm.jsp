<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
<title> 교수 등록 </title>

<script language="JavaScript">
	
    function checkIt() {
       
    	var form1 = eval("document.form1");
        if(!form1.pw.value ) {
            alert("비밀번호를 입력하세요");
            return false;
        }
        if(form1.pw.value != form1.pw2.value)
        {
            alert("비밀번호를 동일하게 입력하세요");
            return false;
        }
       
        if(!form1.stname.value) {
            alert("이름을 입력하세요");
            return false;
        }        
    }
    
    function createNum(){
    	
    	var form1 = eval("document.form1");
    	if(!form1.proCollege.value){
    		alert("단과대학을 선택하세요");
    		return false;
    	}
    	if(!form1.proMajor.value){
    		alert("전공을 선택하세요");
    		return false;
    	}

    	 url = "/KHCU/pfcreateNum.khcu?proCollege=" + form1.proCollege.value + "&proMajor=" + form1.proMajor.value +"&proNum" + form1.proNum.value ;
    	open(url, "confirm", 
        "toolbar=no, location=no,status=no,menubar=no,scrollbars=no,resizable=no,width=300, height=200");
    } 

    
</script>


<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
$(function(){
    $('#proCollege').change(function() {   
            $.ajax({                
                url: "/KHCU/pfselectbox2.khcu",                
                type: "POST",
                data: $('#form1').serialize(),
                processData: false,                
        
                success: function(data) {   
                	$('#proMajor').html(data)
					return false;
                }, error: function(jqXHR, textStatus, errorThrown) {
                    alert("실패");
                }           
            });        
    });   
});
</script>


<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    function execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = ''; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수

                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    fullAddr = data.roadAddress;

                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    fullAddr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
                if(data.userSelectedType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('postcode').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('address1').value = fullAddr;

                // 커서를 상세주소 필드로 이동한다.
                document.getElementById('address2').focus();
            }
        }).open();
    }
</script>
</head>

<body>
<br><br>

<form method="post" action="professorCardInputPro.khcu" name="form1" id="form1" onSubmit="return checkIt()">
  <table border="1" align="center">
    <tr> 
    <td colspan="2" height="39" align="center">
       <font size="+1" ><b> 교수 등록 </b></font></td>
    </tr>
    <tr> 
    <td>단과대학</td>
      <td align="center"> 
        <select name="proCollege" id="proCollege">
            <option value="">--------------------</option>
            <c:forEach var="colList" items="${colList}" varStatus="i">
            <option value="${colList.colName}">${colList.colName}</option>          
			</c:forEach>
      		</select>
      </td>
    </tr>
    <tr> 
    <td>전공</td>
      <td align="center"> 
       	<div id="proMajor"></div>
      </td>
    </tr>
    
    <tr>
       <td>교 번</td><td><input type="text" name="proNum" readonly/>&nbsp;<input type="button" value="교번생성" onclick="createNum()"></td>
    </tr>
    <tr>
       <td>이 름</td><td><input type="text" name="proName" maxlength="10" size="30"></td>
    </tr>
    <tr> 
      <td>주민등록번호</td>
      <td align="center"> 
        <input type="text" name="proJumin1" maxlength="10"  size="15">
        -<input type="text" name="proJumin2" maxlength="10"  size="15">
      </td>
    </tr>    
    <tr>
      <td>주소</td> 
      <td align="center"> 
     <input type="text" id="postcode" placeholder="우편번호" name="staffPostcode" size="12">
   <input type="button" onclick="execDaumPostcode()" value="우편번호 찾기"><br>
   <input type="text" id="address1" placeholder="주소" name="staffAddress1" size="30"><br>
   <input type="text" id="address2" placeholder="상세주소" name="staffAddress2" size="30">
      </td>
    </tr>
    
    <tr> 
      <td>핸드폰번호</td>
      <td align="center"> 
        <input type="text" name="proPhone" maxlength="11"  size="30">
      </td>
    </tr>
    
    <tr>
      <td>이메일주소</td> 
      <td align="center"> 
        <input type="text" name="proEmail" maxlength="11"  size="30">
      </td>
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