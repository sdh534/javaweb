<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>test7.jsp</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
  <!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script> -->
</head>
<body>
	<p><br/></p>
	<div class="container">
		<!-- <form name="myform" method="get" action="../../t8Get"> -->
	<!-- 	<form name="myform" method="post" action="../../t8Post"> -->
		<form name="myform" method="post" action="<%=request.getContextPath()%>/t8p">
			<div>성명 
			<input type="text" name="name" class="form-control">
			</div>
			<div>나이 
			<input type="number" name="age" class="form-control">
			</div>
			<div>
			<input type="submit" value="전송" class="btn mt-3 btn-success">
			</div>
		</form>
	</div>
	<p><br/></p>
</body>
</html>