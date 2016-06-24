<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="/css/Menu.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<link href='http://fonts.googleapis.com/css?family=News+Cycle:400,700' rel='stylesheet' type='text/css'>
<link href="http://fonts.googleapis.com/css?family=Lobster" rel="stylesheet" type="text/css">
<script src="Tab.js" type="text/javascript"></script>
<head>
<title> KH사이버대학교 </title>
    <link rel="stylesheet" href="css/style.css">
    <!--jQuery 라이브러리 추가-->
    <script src="http://code.jquery.com/jquery-latest.js"></script>
    <!--jQuery 플러그인 추가-->
    <script src="js/jquery.banner.js"></script>
    <!--jQuery 플러그인 옵션 설정 추가-->
    <script src="js/script.js"></script>
    <script src="js/tset.js"></script>
</head>
<style>
@import "compass/css3";

@mixin arrow-down($size: 10px, $color: #fff){
	width: 0; 
	height: 0; 
	border-left: $size solid transparent;
	border-right: $size solid transparent;
	border-top: $size solid $color;
}

@mixin arrow-right($size: 10px, $color: #fff){
	width: 0; 
	height: 0; 
	border-top: $size solid transparent;
	border-bottom: $size solid transparent;
	border-left: $size solid $color;
}

@mixin sans-serif() {
  font-family: "proxima-nova", "helvetica neue", helvetica, arial, sans-serif;
}

@mixin text-smooth()
{
  -webkit-font-smoothing: antialiased;
}

html, body {
  width: 100%;
  height: 100%;
}

body {
  background-color: #13487e;
  @include background-image(linear-gradient(top, rgb(19, 72, 126), rgb(14, 41, 69)));
  @include filter-gradient(rgb(19, 72, 126), rgb(14, 41, 69), vertical);
}

.accordion {
  width: 302px;
  margin: 0 auto;
  padding-top: 50px;
}

/* all accordion styles below here */

.accordion {
  
  dl {
    
    width: 302px;
    @include sans-serif;
    @include text-smooth;
    @include transition-duration(350ms);
    
    &:hover {
      @include box-shadow(0px 0px 10px 3px rgba(0, 0, 0, .25));
    }
    
    dt {
      
      a {
        background-color: #82A1BD;
        position: relative;
        text-transform: uppercase;
        width: 100%;
        height: 50px;
        display: block;
        line-height: 50px;
        text-align: center;
        cursor: pointer;
        font-weight: bold;
        color: #fff;
        text-decoration: none;
        
        .arrow {
            @include arrow-right(6px);
            position: absolute;
            left: 14px; 
            top: 18px;
            
            .cssanimations & {
              @include transition-duration(350ms);

              &.down-anim {
                @include rotate(90deg);
              }
            }
          
            &.down {
              @include arrow-down(6px);
              top: 21px;
              left: 12px;
            }
        }
      }
      
      &.active, &:hover {
        a {
            background-color: #507BA2;
        }
      }
      &.active {
        a {
          @include box-shadow(inset 0px -4px 8px 0px rgba(0, 0, 0, .2));
        }
      }
    }
    
    dd {
      background-color: #ffffff;
      @include background-image(linear-gradient(top, rgb(255, 255, 255), rgb(247, 247, 247)));
      @include filter-gradient(rgb(255, 255, 255), rgb(247, 247, 247), vertical);
      padding: 10px;
      display: none;
      height: 293px;
      
      &.active {
        display: block;
      }
      
      p {
        line-height: 1.4;
      }
    }
    
  }
}
.clsBannerScreen {
    overflow: hidden;
    position: relative;
    height: 150px;
    width: 600px;
    border: 1px solid #e1e1e1;
    cursor: pointer;
    clear: both;
}
 
.clsBannerScreen .images {
    position: absolute;
    display: none;
}
 
ul, li {
    list-style: none;
    margin: 0;
    padding: 0;
    font-size: 10pt;
}
 
.clsBannerButton {
    width: 600px;
    cursor: pointer;
    border-bottom: 1px solid #e1e1e1;
}
 
.clsBannerButton li {
    width: 100px;
    float: left;
    padding: 2px;
    border-right: 1px solid #e1e1e1;
}
 
.clsBannerButton li.fir {
    border-left: 1px solid #e1e1e1;
}
 
.clsBannerButton li.labelOverClass {
    font-weight: bold;
}
.box-radius {
   font-family: Helvetica, Arial, "Lucida Grande", sans-serif;
   font-size: 13px;
   background-color: ivory;
   line-height: 1.5;
   margin: 30px auto;
   width: 200px;
   height: 150px;
   padding: 10px;
   border: 1px solid #cc0000;
   border-radius: 15px;
   -moz-border-radius: 15px;
   -webkit-border-radius: 15px;
   -o-border-radius: 15px;
}

</style>
<body>
<center>
<c:if test="${sessionScope.memId == null}">
<b> 로그인 </b>

<form action="loginPro.khcu" method="post">
<table width="400" border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td width="100" height="30" align="right"> 학번 </td>
		<td width="200" height="30" align="center"><input type="text" name="loginNum"></td>
		<td width="100" height="60" align="left" rowspan="2"><input type="submit" value="로그인" style="width:100%; height:60"></td>
	</tr>
	<tr>
		<td width="100" height="30" align="right"> 비밀번호 </td>
		<td width="200" height="30" align="center"><input type="password" name="loginPw"></td>
	</tr>
	<tr><td colspan="3">&nbsp;</td>
	<tr>
		<td width="400" height="30" align="center" colspan="3">
			<input type="button" value="학번 찾기" onclick="javascipt:location='findIdForm.khcu'" style="width:120">
			<input type="button" value="비밀번호 찾기" onclick="javascipt:location='findPwForm.khcu'" style="width:120">
		</td>
	</tr>
</table>
</form>
</c:if>
<c:if test="${sessionScope.memId != null}">
	<b>${sessionScope.memId} 로그인 성공</b><br>
	<input align="left" type="button" value="강의실" onclick="javascript:location='classes.khcu'">
	<input align="left" type="button" value="커뮤니티" onclick="javascript:location='community.khcu'">
	<input align="left" type="button" value="나의정보" onclick="javascript:location='mypage.khcu'">
	<br />
	<input align="left" type="button" value="로그아웃" onclick="javascript:location='logout.khcu'">
	<input align="left" type="button" value="나의강의보기(교수ver)" onclick="javascript:location='classTimeTable.khcu'">
	<input align="left" type="button" value="강의신청하기(교수ver)" onclick="javascript:location='classInputForm.khcu'">
</c:if>
  
<script src="//ajax.googleapis.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
<!--첫번째 배너-->
<p>&nbsp;</p>
    <p>&nbsp;</p>
    <div id="image_list_1">
        <div class="clsBannerScreen">
            <div class="images" style="display:block">
                <img src="images/DGY.PNG">
            </div>
            <div class="images"><img src="images/OPO.PNG"></div>
            <div class="images"><img src="images/KSD.PNG"></div>
            <div class="images"><img src="images/POD.PNG"></div>
            <div class="images"><img src="images/DOC.PNG"></div>
        </div>
    </div>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
     
    <!--두번째 배너-->
    <div id="image_list_2">
        <div class="clsBannerScreen">
            <div class="images" style="display:block">
                <img src="images/CCC.PNG">
            </div>
            <div class="images"><img src="images/QQQ.PNG"></div>
            <div class="images"><img src="images/EEE.PNG"></div>
            <div class="images"><img src="images/QQQ.PNG"></div>
            <div class="images"><img src="images/QQQ.PNG"></div>
        </div>
 
        <ul class="clsBannerButton" id="label_2">
            <li class="fir">커뮤니티<br>(Community)</li>
            <li>공지사항<br>(Notice)</li>
            <li>강의실<br>(Class)</li>
            <li>성적조회<br>()</li>
            <li>장학금내역조회<br>()</li>
        </ul>
    </div>
     
    <p>&nbsp;</p>
    <p>&nbsp;</p>
     
    <!--세번째 배너-->
    <div id="image_list_3">
        <ul class="clsBannerButton" id="label_3">
            <li><img src="images/1_on.jpg"></li>
            <li><img src="images/2.jpg"></li>
            <li><img src="images/3.jpg"></li>
            <li><img src="images/4.jpg"></li>
            <li><img src="images/5.jpg"></li>
        </ul>
 
        <div class="clsBannerScreen">
            <div class="images" style="display:block">
                <img src="images/google.jpg">
            </div>
            <div class="images"><img src="images/daum.jpg"></div>
            <div class="images"><img src="images/naver.jpg"></div>
            <div class="images"><img src="images/nate.jpg"></div>
            <div class="images"><img src="images/yahoo.jpg"></div>
        </div>
    </div>
    <div class="accordion">
  <dl>
    <dt class="active"><a href="#"><span class="arrow"></span>Quality</a></dt>
    <dd class="active">
      <p>Nullam quis risus eget urna mollis ornare vel eu leo. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean eu leo quam. Pellentesque ornare sem lacinia quam venenatis vestibulum. Nullam quis risus eget urna mollis ornare vel eu leo. Morbi leo risus, porta ac consectetur ac, vestibulum at eros. Curabitur blandit tempus porttitor. Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
    </dd>
    
    <dt><a href="#"><span class="arrow"></span>Products</a></dt>
    <dd>
      <p>Nullam quis risus eget urna mollis ornare vel eu leo. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean eu leo quam. Pellentesque ornare sem lacinia quam venenatis vestibulum. Nullam quis risus eget urna mollis ornare vel eu leo. Morbi leo risus, porta ac consectetur ac, vestibulum at eros. Curabitur blandit tempus porttitor. Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
    </dd>
    
    <dt><a href="#"><span class="arrow"></span>About Us</a></dt>
    <dd>
      <p>Nullam quis risus eget urna mollis ornare vel eu leo. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean eu leo quam. Pellentesque ornare sem lacinia quam venenatis vestibulum. Nullam quis risus eget urna mollis ornare vel eu leo. Morbi leo risus, porta ac consectetur ac, vestibulum at eros. Curabitur blandit tempus porttitor. Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
    </dd>
  </dl>
</div>
</center>
</body>
<%@ include file="/css/Footer.jsp"%>
</html>