<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Menu</title>
<link rel="stylesheet" type="text/css">
</head>
<style>
#topp{
	margin-left: auto;
	margin-right: auto;
   	position: relative; 
   	height: 130px;
    width: 300px;   
     
}
.toppa{
	text-decoration:none; 
	text-align: center;	
	
}

#topMenu {
        height: 30px; 
        width: 944px;  
        margin-right: auto;
        margin-left: auto;
        overflow : visible;
}
#MenuCg {
    color: Black;               
    float: left;               
    line-height: 25px;         
    vertical-align: middle;     
    text-align: center;         
    position: relative;  
}
.submenu {             
    position: absolute;     
    height: 0px;            
    overflow: hidden;       
    transition: height .2s; 
    -webkit-transition: height .2s; 
    -moz-transition: height .2s; 
    -o-transition: height .2s; 
}
.MenuCg:hover .submenu { 
    height: 250px;          
}
#topMenu ul {           
    list-style-type: none; 
    margin: 0px;           
    padding: 0px;          
}
#topMenu ul li {            
    color: Black;               
    float: left;               
    line-height: 25px;         
    vertical-align: middle;     
    text-align: center;         
    position: relative;        
}
.menuLink, .submenuLink {          
    text-decoration:none;               
    display: block;                    
    width: 130px;                      
    font-size: 12px;                    
    font-weight: bold;                  
    font-family: "Arial Hebrew", "����"; 
    font:  Georgia Bold, Sans-Serif;
}
.menuLink {    
    color: Black;
}
.submenuLink {          
    color: #353535;            
    background-color: #F6F6F6;    
    border: solid 1px #D5D5D5;   
    margin-top: -1px;           
}  
.longLink {     
    width: 190px;  
}
.submenu {             
    position: absolute;     
    height: 0px;            
    overflow: hidden;       
    transition: height .2s; 
    -webkit-transition: height .2s; 
    -moz-transition: height .2s; 
    -o-transition: height .2s; 
}

#SideMenu{
	position: fixed;
	right: 0px;
}
#SideMenu{
	position: fixed;
	top: 270px;
	right: 0px;
	border:2px solid #FAF4C0; 
	width: 110px;
}
.SideMenua{
	margin-left: auto;
	margin-right: auto;
	margin: 0px;
	text-decoration:none;               
    display: block;                    
    width: 100px;      
    color: grey;                
    font-size: 14px;                    
    font-weight: bold;                  
    font-family: "Arial Hebrew", "����"; 
    font:  Georgia Bold, Sans-Serif;
  	line-height: 35px;
}

</style>
<body>

<center>
<span id="topp">
	<a class="toppa" href="/KHCU/main.khcu">
  		<img src="/KHCU/view/KHCU.PNG" border="0">
 	</a>
</span>
</center>

<nav id="topMenu" >
<div style="border:1px solid #ff6600; border-width:2px 1px"></div>
    <ul>
        <li class="MenuCg">
            <a class="menuLink"> �кμҰ� </a>
            <ul class="submenu">
            	<li><a class="submenuLink" href="/KHCU/HHH/Architecture.jsp">�����а�</a></li>
            	<li><a class="submenuLink" href="/KHCU/HHH/Electron.jsp">���ڱ���</a></li>
            	<li><a class="submenuLink" href="/KHCU/HHH/Com.jsp">��ǻ�Ͱ��а�</a></li>
            	<li><a class="submenuLink" href="/KHCU/HHH/Statute.jsp">���а�</a></li>
            	<li><a class="submenuLink" href="/KHCU/HHH/Management.jsp">�濵�а�</a></li>
            	<li><a class="submenuLink" href="/KHCU/HHH/Economics.jsp">�����а�</a></li>
            	<li><a class="submenuLink" href="/KHCU/HHH/SocialWelfare.jsp">��ȸ�����а�</a></li>
            	<li><a class="submenuLink" href="/KHCU/HHH/Design.jsp">�������а�</a></li>
            	<li><a class="submenuLink" href="/KHCU/HHH/Music.jsp">���ǰ�</a></li>
            	<li><a class="submenuLink" href="/KHCU/HHH/Korean.jsp">������а�</a></li>
            	<li><a class="submenuLink" href="/KHCU/HHH/English.jsp">������а�</a></li>
            	<li><a class="submenuLink" href="/KHCU/HHH/Japan.jsp">�Ϻ����а�</a></li>
            	<li><a class="submenuLink" href="/KHCU/HHH/Chinese.jsp">�߱����а�</a></li>
            	<li><a class="submenuLink" href="/KHCU/HHH/Physics.jsp">�����а�</a></li>
            	<li><a class="submenuLink" href="/KHCU/HHH/Mathematics.jsp">���а�</a></li>
            	<li><a class="submenuLink" href="/KHCU/HHH/Food.jsp">��ǰ������а�</a></li>
            </ul>
        </li>
        <li>&nbsp;</li>
        <li class="topMenuLi">
            <a class="menuLink" href="/KHCU/stMenu.khcu"> �л� </a>
        </li>
        <li>&nbsp;</li>
        <li class="topMenuLi">
            <a class="menuLink" href="/KHCU/proMenu.khcu"> ���� </a>
        </li>
        <li>&nbsp;</li>
        <li class="topMenuLi">
            <a class="menuLink" href="/KHCU/staffMenu.khcu"> ������ </a>
        </li>
        <li>&nbsp;</li>
        <li class="topMenuLi">
            <a class="menuLink" href="/KHCU/comJobList.khcu"> ������� </a>
        </li>
        <li>&nbsp;</li>
        <li class="topMenuLi">
            <a class="menuLink" href="/KHCU/collegeList.khcu"> ���� </a>
        </li>
        <li>&nbsp;</li>
        <li class="topMenuLi">
            <a class="menuLink" href="/KHCU/CrMain.khcu"> ���ǽ� </a>
        </li>
    </ul>
</nav>
<div style="border:1px solid #FAECC5;width:944px;margin-right: auto;margin-left: auto;"></div>
<br> <br> <br> 
</body>
</html>