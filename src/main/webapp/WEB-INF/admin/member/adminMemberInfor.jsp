<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>AdminMemberInfor</title>
	<jsp:include page="/include/bs4.jsp" />
	<meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>
	<p><br/></p>
	<div class="container">
		<h2>회 원 정 보 상 세 보 기 </h2>
		<br/>
		<table class="table">
			<tr><td>아이디 : ${vo.mid}</td></tr>
			<tr><td>별명 : ${vo.nickName}</td></tr>
			<tr><td>성명 : ${vo.name}</td></tr>
			<tr><td>성별 : ${vo.gender}</td></tr>
			<tr><td>생일 : ${vo.birthday}</td></tr>
			<tr><td>전화번호 : ${vo.tel}</td></tr>
			<tr><td>주소 : ${vo.address}</td></tr>
			<tr><td>이메일 : ${vo.email}</td></tr>
			<tr><td>홈페이지 : ${vo.homePage}</td></tr>
			<tr><td>직업 : ${vo.job}</td></tr>
			<tr><td>취미 : ${vo.hobby}</td></tr>
			<tr><td>사진 : <img src="${ctp}/images/member/${vo.photo}" height="100px"/></td></tr>
			<tr><td>자기소개 : ${vo.content}</td></tr>
			<tr><td>정보공개유무 : ${vo.userInfor}</td></tr>
			<tr><td>탈퇴신청여부 : ${vo.userDel}</td></tr>
			<tr><td>포인트 : ${vo.point}</td></tr>
			<tr><td>회원등급 : ${strLevel}</td></tr>
			<tr><td>오늘 접속 횟수 : ${vo.todayCnt}</td></tr>
			<tr><td>총 방문 횟수 : ${vo.visitCnt}</td></tr>
			<tr><td>최초 가입일 : ${vo.startDate}</td></tr>
			<tr><td>최종 접속일 : ${vo.lastDate }</td></tr>
		</table>
	<input type="button" value="돌아가기" onclick="history.back()" class="btn btn-primary"/>
	</div>
	<p><br/></p>
</body>
</html>