<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="/css/Menu.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>입학지원서</title>
</head>
<style>
#customers {
    font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
    border-collapse: collapse;
    
}
#customers td, #customers th {
    border: 1px solid #EAEAEA;
    text-align: left;
    padding: 8px;
}
#customers tr:nth-child(even){
	background-color: #FFFFFF
}
#customers tr:hover {
	background-color: #EAEAEA;
}
#customers th {
    padding-top: 12px;
    padding-bottom: 12px;
    background-color: #FFFFFF;
    color: white;
}
#customers a{
	text-decoration:none; 
	font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
}
</style>
<script language="javascript">
  function send()
  {
   var count=0;
   for (i=0; i<document.myform.rhkstla.length; i++ )
   {
    if (document.myform.rhkstla[i].checked==true)
     {
      count++;
     }
   } 
   if (count>3)
   {
    alert("3개까지만 선택하세요");
    for (i=0; i<document.myform.rhkstla.length; i++ )
    {
    document.myform.rhkstla[i].checked=false;
    }
   }
  }
 </script>
<body>
<center><b> 입학지원서 </b>
<table id="customers" border="1" width="900" cellspacing="0" cellpadding="0" align="center">
<tr>
<td width="80" align="center"> 성명 </td>
<td width="300"><input type="text" name="title" size="30"> </td>
</tr>
<tr>
<td width="80" align="center"> 생년월일 </td>
  <td>
  <input type="checkbox" name="rhkstla" value="남자" onclick="send();">남자</input>
  <input type="checkbox" name="rhkstla" value="여자" onclick="send();">여자</input>
  <input type="text" name="title" size="30">
   (790309로 작성)
  </td>
</tr>
<tr>
<td width="80" align="center"> 비밀번호 </td>
<td width="300"><input type="text" name="title" size="30"> </td>
</tr>
<tr>
<td width="80" align="center"> 휴대전화 </td>
<td>
  <input type="checkbox" name="rhkstla" value="남자" onclick="send();">국내</input>
  <input type="checkbox" name="rhkstla" value="여자" onclick="send();">국외</input>
  <input type="text" name="title" size="30">
  (-없이작성해주세요)
  </td>
</tr>
<tr>
<td width="80" align="center"> 지원학과선택 </td>
<td>
  <input type="checkbox" name="rhkstla" value="건축학과" onclick="send();">건축학과</input>
  <input type="checkbox" name="rhkstla" value="전자기계과" onclick="send();">전자기계과</input>
  <input type="checkbox" name="rhkstla" value="컴퓨터공학과" onclick="send();">컴퓨터공학과</input>
  <input type="checkbox" name="rhkstla" value="법학과" onclick="send();">법학과</input>
  <input type="checkbox" name="rhkstla" value="경영학과" onclick="send();">경영학과</input>
  <br>
  <input type="checkbox" name="rhkstla" value="경제학과" onclick="send();">경제학과</input>
  <input type="checkbox" name="rhkstla" value="사회복지학과" onclick="send();">사회복지학과</input>
  <input type="checkbox" name="rhkstla" value="디자인학과" onclick="send();">디자인학과</input>
  <input type="checkbox" name="rhkstla" value="실용음악과" onclick="send();">실용음악과</input>
  <input type="checkbox" name="rhkstla" value="국문학과" onclick="send();">국문학과</input>
  <br>
  <input type="checkbox" name="rhkstla" value="영문학과" onclick="send();">영문학과</input>
  <input type="checkbox" name="rhkstla" value="일본어학과" onclick="send();">일본어학과</input>
  <input type="checkbox" name="rhkstla" value="중국어학과" onclick="send();">중국어학과</input>
  <input type="checkbox" name="rhkstla" value="물리학과" onclick="send();">물리학과</input>
  <input type="checkbox" name="rhkstla" value="수학과" onclick="send();">수학과</input>
  <br>
  <input type="checkbox" name="rhkstla" value="식품생명과학과" onclick="send();">식품생명과학과</input>
</td>
</tr>
<tr>
<td width="80" align="center"> 장학자격 </td>
<td>
<input type="checkbox" name="rhkstla" value="직장인" onclick="send();">직장인</input>
  <input type="checkbox" name="rhkstla" value="개인사업자" onclick="send();">개인사업자</input>
  <input type="checkbox" name="rhkstla" value="전문계 고교졸업자" onclick="send();">전문계 고교졸업자</input>
  <input type="checkbox" name="rhkstla" value="농어촌거주자" onclick="send();">농.어촌거주자</input>
  <input type="checkbox" name="rhkstla" value="전업주부" onclick="send();">전업주부</input>
  <br>
  <input type="checkbox" name="rhkstla" value="공인외국어시험성적우수자" onclick="send();">공인외국어시험성적우수자</input>
  <input type="checkbox" name="rhkstla" value="고교졸업생진학장려" onclick="send();">고교졸업생진학장려</input>
  <input type="checkbox" name="rhkstla" value="만학도" onclick="send();">만학도</input>
  <input type="checkbox" name="rhkstla" value="다문화가정" onclick="send();">다문화과정</input>
  <br>
  <input type="checkbox" name="rhkstla" value="해당사항없음" onclick="send();">해당사항없음</input>
</td>
</tr>
</table>
</center>
<br><br>
<table border="1" width="900" style='border-left:0;border-right:0;border-bottom:0;border-top:0' cellspacing="0" cellpadding="0" align="center">
<tr>
<td> * 모집인원이 없는 학과는 비활성 처리되어 선택할 수 없습니다. </td>
</tr>
<tr>
<td> * 체크 항목은 필수입력사항이므로 신중히 작성해 주시기 바랍니다. </td>
</tr>
<tr>
<td> * 지원서 작성을 마지막 단계까지 완료하신 지원자들은 승인 후 강좌 수강이 가능합니다. </td>
</tr>
<br>
<tr>
<td> * 음악학과(피아노전공) 지원동기 및 학업계획 평가 시, 지원자의 피아노연주 기초소양능력을 확인합니다. </td>
</tr>
<tr>
<td> * 입시지정곡은 자유곡(고전소나타 빠른악장, 바흐작품, 낭만시대 작품 권유. 작곡가는 무관하며 체르니 및 하농스케일과 같은 연습곡은 지양)이며, 
              지원서 4단계에서 동영상파일을 업로드하여 주시기 바랍니다. </td>
</tr>
</table>
<br>
<table align="center">
    <tr>
		<td align="center" colspan="2"> 
			<input type="submit" value="지원서 제출" OnClick="window.location='entranceList.jsp'">
		</td>
	</tr>
</table>
</body>
</html>