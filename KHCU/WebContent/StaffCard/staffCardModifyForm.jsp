<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="/css/Menu.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
<title> 교직원 수정 </title>

<script language="JavaScript">

    function checkIt() {
        var userinput = eval("document.userinput");
        
        if(!userinput.pw1.value) {
            alert("비밀번호를 입력하세요");
            return false;
        }
        
        if(userinput.pw1.value != userinput.pw2.value)
        {
            alert("비밀번호를 동일하게 입력하세요");
            return false;
        }
        
    }
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

<form method="post" action="staffCardModifyPro.khcu?staffNum=${staffNum}" name="userinput" enctype="multipart/form-data" onSubmit="return checkIt()">
  <table border="1" align="center">
    <tr> 
    <td colspan="2" height="39" align="center">
       <font size="+1" ><b> 교직원 수정 </b></font></td>
    </tr>
    <tr>
    	<td>소 속</td>
    	<td>${article.staffDep}</td>
    </tr>
    
    <tr>
       <td>사 번</td><td>${article.staffNum}</td>
    </tr>
    
    <tr>
       <td>비밀번호</td><td><input type="password" id="pw1" name="staffPw" maxlength="12" size="30"></td>
    </tr>
    
    <tr>
       <td>비밀번호확인</td><td><input type="password" id="pw2" maxlength="12" size="30"></td>
    </tr>
    
    <tr>
       <td>이름</td><td>${article.staffName}</td>
    </tr>
    
    <tr> 
      <td>주민등록번호</td>
      <td align="center">${article.staffJumin1} - ${article.staffJumin2}</td>
    </tr>
    
    <tr>
      <td>주소</td> 
      <td align="center"> 
     <input type="text" id="postcode" placeholder="우편번호" name="staffPostcode" size="12" value="${article.staffPostcode }">
   	<input type="button" onclick="execDaumPostcode()" value="우편번호 찾기"><br>
   <input type="text" id="address1" placeholder="주소" name="staffAddress1" size="30" value="${article.staffAddress1 }"><br>
   <input type="text" id="address2" placeholder="상세주소" name="staffAddress2" size="30" value="${article.staffAddress2 }">
      </td>
    </tr>
    
    <tr> 
      <td>핸드폰번호</td>
      <td align="center"> 
        <input type="text" name="staffPhone" maxlength="11"  size="30" value="${article.staffPhone}">
      </td>
    </tr>
    
    <tr>
      <td>이메일주소</td> 
      <td align="center"> 
        <input type="text" name="staffEmail" maxlength="11"  size="30" value="${article.staffEmail}">
      </td>
    </tr>
    
    <tr>
    	<td>사진등록</td>
    	<td>
    		<input type="file" name="staffProfile">
    	</td>
    </tr>
    <tr>
      <td colspan="2" align="center"> 
      <br>
          <input type="submit" name="confirm" value="수   정" >
          <input type="reset" name="reset" value="다시입력">
      </td>
    </tr>

  </table>
</form>
</body>
</html>