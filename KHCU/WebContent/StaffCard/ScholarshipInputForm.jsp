<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="/css/Menu.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
<title> ���л� ��� </title>

<script language="JavaScript">
    function checkIt() {
        var userinput = eval("document.userinput");
        
        if(!userinput.studentnum.value) {
            alert("�й��� �Է��ϼ���");
            return false;
        }
        if(userinput.studentnum_hidden.value != userinput.studentnum.value) {
            alert("�й� Ȯ���� ���ּ���");
            return false;
        }
    }
    
    function openConfirmNum(userinput) {
        // url�� ����� �Է� id�� �����մϴ�.
        url = "ScholarStnumCheck.khcu?studentnum=" + userinput.studentnum.value ;
        
        // ���ο� �����츦 ���ϴ�.
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
       <font size="+1" ><b> ���л� ��� </b></font></td>
    </tr>
    <tr>
    	<td>�� ��</td>
    	<td>
    		<select name="schtype">
	   			<option value="�������">�������</option>
	   			<option value="��������">��������</option>
	   			<option value="Ư������">Ư������</option>
			</select>
		</td>
    </tr>
    
    <tr>
       <td>�� ��</td>
       <td>
       		<input type="text" name="studentnum"/>&nbsp;
       		<input type="hidden" name="studentnum_hidden" maxlength="12">
        	<input type="button" name="confirmNum" value="�й� Ȯ��" OnClick="openConfirmNum(this.form)">
      </td>
    </tr>
    <tr>
       <td>���бݾ�</td>
       <td>
       		<input type="text" name="money" maxlength="20" size="30" placeholder=" ���ڸ� �Է� ����" onkeypress='return event.charCode >= 48 && event.charCode <= 57'>
       </td>
    </tr>
    <tr>
      <td>�� ��</td><td><input type="text" name="semester" maxlength="12" readonly></td>
    </tr>    
    <tr>
      <td colspan="2" align="center"> 
      <br>
          <input type="submit" name="confirm" value="��   ��" >
          <input type="reset" name="reset" value="�ٽ��Է�">
      </td>
    </tr>
  </table>
</form>
</body>
</html>