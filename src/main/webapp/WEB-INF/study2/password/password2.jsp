<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>password2</title>
	<jsp:include page="/include/bs4.jsp" />
	<meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>
<jsp:include page="/include/header.jsp"/>
	<p><br/></p>
	<div class="container">
		<h2>SHA 암호화 결과</h2>
		<p>
			사용자 아이디 : :${mid} <br/>
			입력한 비밀번호 : ${pwd} <br/>
			~~~~~~~~~~DB작업~~~~~~~~ <br/>
			SHA 암호화 된 비밀번호 : ${shaPwd}<br/>
		</p>
		<hr/>
		<p>
			<a href="${ctp}/Password.st" class="btn btn-secondary">돌아가기</a>
		</p>
	</div>
	<p><br/></p>
<jsp:include page="/include/footer.jsp"/>
</body>
</html>