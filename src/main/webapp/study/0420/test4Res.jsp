<!-- test4Res.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>test4Res.jsp</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
  <!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script> -->
  <style>
  	th, td{
  		text-align:center;
  	}
  	th{
  		background-color: #ccc;
  	}
  </style>
<script>
	alert('${name}님의 자료가 저장되었습니다!');
</script>
</head>
<body>
	<p><br/></p>
	<div class="container">
		<h2>전송된 값 출력하기</h2>
		<table class="table table-bordered"> 
			<tr>
				<th>성명</th>
				<td>${name}</td> <%-- JSP안에서는 JSP 주석으로 / $ {} 혹은 달러 앞 한칸 띄우기  --%>
			</tr>
			<tr>
				<th>나이</th>
				<td>${age}</td>
			</tr>
			<tr>
				<th>성별</th>
				<td>${gender}</td>
			</tr>
			<tr>
				<th>취미</th>
				<td>${strHobby}</td>
			</tr>
			<tr>
				<th>아이피</th>
				<td>${hostIp}</td>
			</tr>
		</table>
		<p class="text-center"><a href="<%=request.getContextPath()%>/study/0420/test4.jsp" class="btn btn-success">돌아가기</a></p>
		<p class="text-center"><a href="<%=request.getContextPath()%>/study/0420/test4out.jsp?name=${name}" class="btn btn-danger">로그아웃</a></p>
	</div>
	<p><br/></p>
</body>
</html>