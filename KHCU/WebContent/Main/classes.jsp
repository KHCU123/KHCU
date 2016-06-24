<!DOCTYPE html><html lang="ko"><head>
<%@ include file="/css/Menu.jsp"%>   
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
  
 <title></title>    
  <link rel="stylesheet" href="../css/bootstrap.css">   
  <link rel="stylesheet" href="../css/bootstrap-theme.css">   
  <script  src="http://code.jquery.com/jquery-latest.min.js"></script>
  <script  src="http://code.jquery.com/js/bootstrap.js"></script> 
  <script  src="http://code.jquery.com/js/collie.js"></script> 
 
  <script>       
  $(document).ready(function() {            
	  var c = document.getElementById("myCanvas");            
	  var ctx = c.getContext("2d");            
	  var deleteflag='N';   //지우개 기능 넣어보기            
	  var drawStatus = false;            
	  $('#myCanvas').mousedown(function (e) {                
		  if (e.button==0) {                    
			  drawStatus = true;                    
			  ctx.beginPath();                    
			  ctx.moveTo(e.offsetX, e.offsetY);                    
			  $('#offsetx').val(e.offsetX);  //좌표 값                    
			  $('#offsety').val(e.offsetY);  //좌표 값                
			  }            
		  });            
	  $('#myCanvas').mousemove(function(e){                
		  // 그릴 수 있으면 그린다.                
		  if (drawStatus){                    
			  if(deleteflag=='N'){                        
				  ctx.strokeStyle = "black";                        
				  ctx.lineWidth = 2;                    
				  }else{                        
					  ctx.strokeStyle = "white";                        
					  ctx.lineWidth = 10;                    
					  }                    
			  ctx.lineTo(e.offsetX, e.offsetY);                   
			  ctx.stroke();                    
			  $('#offsetx').val(e.offsetX);  //좌표 값                    
			  $('#offsety').val(e.offsetY);  //좌표 값                
			  }            
		  });            
	  $('#myCanvas').mouseup(function(e){                
		  // 버튼 up 이면 그릴 수 없다고 선언               
		  drawStatus = false;            
		  });            
	  $('#delete').click(function(){               
		  alert('지우개 모드입니다');               
		  deleteflag='Y';            
		  });            
	  $('#ini').click(function(){                
		  alert('다시 그리기 모드로 바꿉니다.');                
		  deleteflag='N';            
		  });        
	  });    
  </script></head>
  <body>
  <form class="form-horizontal">    
  <div class="form-group">        
  <canvas id="myCanvas" width="500" height="400" style="border:1px solid #d3d3d3;"></canvas>    
  </div>    
  <div class="form-group">        
  <label for="offsetx" class="col-sm-2 control-label">X 마우스 좌표 값</label>        
  <div class="col-sm-3">            
  <input type="text" class="form-control" id="offsetx">       
   </div>    
   </div>    
   <div class="form-group">        
   <label for="offsety" class="col-sm-2 control-label">Y 마우스 좌표 값</label>        
   <div class="col-sm-3">            
   <input type="text" class="form-control" id="offsety">
           </div>
               </div>
               </form>
               <button id="delete" class="btn btn-default">지우개</button>
               <button id="ini" class="btn btn-default">지우개취소</button>
               </body>
               </html>