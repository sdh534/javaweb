<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>adminLeft</title>
	<jsp:include page="/include/bs4.jsp" />
	<meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body style="background-color: #eee;">
	<p><br/></p>
	<div class="text-center">
		<h5>관리자 메뉴</h5>
		<hr/>
		<p><a href="${ctp}/" target="_top">홈으로</a></p>
		<hr/>
		<p><a href="${ctp}/GuestList.gu" target="adminContent">방명록 리스트</a></p>
		<hr/>
		<p><a href="${ctp}/BoardList.bo" target="adminContent">게시판 리스트</a></p>
		<hr/>
		<p><a href="${ctp}/AdminMemberList.ad" target="adminContent">회원 리스트</a></p>
		
	</div>
	<p><br/></p>
</body>
</html>