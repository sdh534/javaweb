<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>title</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
  <!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script> -->
  
  <script>
  	'use strict';
  	
  	function fCheck(){
  		let su1 = document.getElementById("su1").value;
  		let su2 = document.getElementById("su2").value;
  		let su3 = document.getElementById("su3").value;
  		let su4 = document.getElementById("su4").value;
  		let su5 = document.getElementById("su5").value;
  		
  		if(isNaN(su1)||isNaN(su2)||isNaN(su3)||isNaN(su4)||isNaN(su5)){
  			alert("5개의 숫자만 입력해주세요.");
  		}
  		else{
  			myform.submit();
  		}
  	}
  </script>
</head>
<body>
	<p><br/></p>
	<div class="container">
	<h2> 5개의 수 정렬하기</h2>
		<form name = "myform" method="post" action="<%=request.getContextPath()%>/t0420/SuOk">
			<div class="border">
				<div>
					수 1 : <input type="number" name="su" id="su1" class="form-control"/>
				</div>			
				<div>
					수 2 : <input type="number" name="su" id="su2" class="form-control"/>
				</div>			
				<div>
					수 3 : <input type="number" name="su" id="su3" class="form-control"/>
				</div>			
				<div>
					수 4 : <input type="number" name="su" id="su4" class="form-control"/>
				</div>			
				<div>
					수 5 : <input type="number" name="su" id="su5" class="form-control"/>
				</div>			
				<div class="text-center">
					<input type="button" value="전송" onclick="fCheck()" class="btn btn-primary mr-3"/>
					<input type="reset" value="다시 입력" class="btn btn-secondary"/>
				</div>
			</div>
		</form>
	</div>
	<p><br/></p>
</body>
</html>