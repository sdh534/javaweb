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
</head>
<body>
	<p><br/></p>
	<div class="container">
		<%!  //jsp 변수와 메소드를 선언하는 곳
			int tot =0;
		%>
		<h2>1 ~ 100 까지의 합을 구하세요...</h2>
		<%
			for(int i=0; i<=100; i++){
				tot += i;
			}
			out.println("1부터 100까지의 합 : "+ tot);
		%>
		<hr/>
		일에서 백까지의 합은? <%=tot%> 입니다.
	</div>
	<p><br/></p>
</body>
</html>