<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>title</title>
	<jsp:include page="/include/bs4.jsp" />
</head>
<body>
	<p><br/></p>
	<div class="container">
		<table class="table table-bordered">
			<tr>
				<th>성명</th>
				<td>${name}</td>
			</tr>
			<tr>
				<th>취미</th>
				<td>${hobbies[0]} /${hobbies[1]} /${hobbies[2]} / ${hobbies[3]}/${hobbies[4]}</td>
			</tr>
		</table>
		
    <p><a href="${pageContext.request.contextPath}/study/0427/form2.jsp" class="btn btn-danger">돌아가기</a></p>
	</div>
	<p><br/></p>
</body>
</html>