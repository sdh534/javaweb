<!-- suRes.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>suRes.jsp</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
  <!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script> -->

<script>
	alert('정렬 완료!!');
</script>
</head>
<body>
	<p><br/></p>
	<div class="container">
		<h2>전송된 값 출력하기</h2>
		<span>입력한 숫자: <b> ${sort_before_su} </b></span> <br/>
		<span>입력한 숫자 정렬: <b> ${sort_su} </b></span>
		<p class="text-center"><a href="<%=request.getContextPath()%>/study/0420/self/su.jsp" class="btn btn-success">돌아가기</a></p>
	</div>
	<p><br/></p>
</body>
</html>