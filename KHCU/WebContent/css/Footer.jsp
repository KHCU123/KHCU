<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Footer</title>
</head>
<style>
#footer
{
	height: 30px;  /* 메인 메뉴의 높이 */
	width: 900px;  /* 메인 메뉴의 넓이 */
    margin-left: auto;
    margin-right: auto;
}
#footer ul {           /* 메인 메뉴 안의 ul을 설정함: 상위메뉴의 ul+하위 메뉴의 ul */
    list-style-type: none;  /* 메인 메뉴 안의 ul 내부의 목록 표시를 없애줌 */
    margin: 0px;            /* 메인 메뉴 안의 ul의 margin을 없앰 */
    padding: 0px;           /* 메인 메뉴 안의 ul의 padding을 없앰 */
}
#footer ul li {            /* 메인 메뉴 안에 ul 태그 안에 있는 li 태그의 스타일 적용(상위/하위메뉴 모두) */
    color: block;               /* 글씨 색을 회색으로 설정 */
    float: left;                /* 왼쪽으로 나열되도록 설정 */
    line-height: 30px;          /* 텍스트 한 줄의 높이를 30px로 설정 */
    vertical-align: middle;     /* 세로 정렬을 가운데로 설정 */
    text-align: center;         /* 텍스트를 가운데로 정렬 */
   	position: relative; 
	top: 150px;
}
.footerli {           /* 상위 메뉴와 하위 메뉴의 a 태그에 공통으로 설정할 스타일 */
    text-decoration:none;               /* a 태그의 꾸밈 효과 제거 */
    display: block;                     /* a 태그의 클릭 범위를 넓힘 */
    font-size: 11px;                    /* 폰트 사이즈를 12px로 설정 */
    font-weight: bold;                  /* 폰트를 굵게 설정 */
    font-family: "Arial Hebrew", "돋움"; /* 기본 폰트를 영어/한글 순서대로 설정 */
    color: grey;
}
</style>
<body>
<nav id="footer">
<ul>
<li><img src="/KHCU/view/KKHCU.PNG"></li>
   	<li class="footerli">주소 : 서울특별시 강남구 테헤란로 14길 6 남도빌딩 2F, 3F (T: 1544-9970 / F: 070-8290-2889)</li>
   	<li>&nbsp;|&nbsp;</li>
   	<li><a class="footerli" href="/KHCU/Map/Map.jsp">찾아오시는길</a></li>
   	<li>&nbsp;|&nbsp;</li>
   	
	<li><a class="footerli" href="http://www.eclipse.org/" target="_blank">
		<img src="/KHCU/view/eclipse.PNG" style="width:20px;height:20px" border="0"></a></li>
   <li>|</li>
   	<li><a class="footerli" href="http://tomcat.apache.org/" target="_blank">
		<img src="/KHCU/view/tom.PNG" style="width:20px;height:20px" border="0"></a></li>
   <li>|</li>
   	<li><img src="/KHCU/view/or.PNG" style="width:20px;height:20px" border="0"></a></li>
   <li>|</li>
    <li><img src="/KHCU/view/HT.PNG" style="width:20px;height:20px" border="0"></a></li>
</ul>  
</nav>
</body>
</html>