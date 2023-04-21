<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>test1.jsp</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
  <!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script> -->
</head>
<body>
	<p><br/></p>
	<div class="container">
		<h2>NULL값 처리하기</h2>
		<form name="myform" method="post" action="<%=request.getContextPath()%>/t0421/Test1Ok">
			<p> 전송방식 : post / get
				아이디: <input type="text" name="mid" id="mid"/>
				이름: <input type="text" name="name" id="name"/>
				직업: <input type="text" name="job" id="job"/>
			</p>
			<p>
				<input type="submit" value="전송(post)" class="btn btn-success"/>
				<input type="button" value="전송(get)" onclick="location.href='<%=request.getContextPath()%>/t0421/Test1Ok';" class="btn btn-info"/>
			</p>
		</form>
	</div>
	<p><br/></p>
</body>
</html>