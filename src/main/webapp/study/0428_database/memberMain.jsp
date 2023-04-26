<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="/include/memberCheck.jsp"></jsp:include>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
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
		<h2>회원 전용방</h2>
		<p> 현재 ${sMid}(${sName})님 로그인중이십니다.</p>
		<hr/>		
		<p>보유 포인트 :${sPoint} </p>
		<p>최근 접속 일자 : ${fn:substring(sLastDate,0,16)} </p>
		<p>오늘 접속 횟수 : ${sTodayCount}회 </p>
		<p><img src="${ctp}/images/5.jpg" width="300px"></p>
		<hr/>
		<div>
			<a href="${ctp}/database/Logout">로그아웃</a>
		</div>
	</div>
	<p><br/></p>
</body>
</html>