<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>title</title>
	<jsp:include page="/include/bs4.jsp" />
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<style>
		th {
			text-align: center;
			background-color: #eee;
		}
	</style>
	<script>
		'use strict';
		
		function goodCheck(){
			location.href = "${ctp}/BoardGoodCheck.bo?idx=${vo.idx}";
		}
	</script>
</head>
<body>
<jsp:include page="/include/header.jsp"/>
	<p><br/></p>
	<div class="container">
		<h2 class="text-center"> 글 내 용 보 기 </h2>
		<table class="table table-bordered">
			<tr>
				<th>글쓴이</th>
				<td>${vo.mid}</td>
				<th>글쓴날짜</th>
				<td>${fn:substring(vo.wDate,0,fn:length(vo.wDate)-2)}</td>
			</tr>
			<tr>
				<th>글제목</th>
				<td colspan="3">${vo.title}</td>
			</tr>
			<tr>
				<th>이메일</th>
				<td>${vo.email}</td>
				<th>조회수</th>
				<td>${vo.readNum}</td>
			</tr>
			<tr>
				<th>홈페이지</th>
				<td>${vo.homePage}</td>
				<th>좋아요</th>
				<td>
					${vo.good}(<a href="javascript:goodCheck()">👍</a>)
				</td>
			</tr>
			<tr>
				<th>글내용</th>
				<td colspan="3" style="height:300px">${fn:replace(vo.content,newLine,"<br/>")}</td>
			</tr>
			<tr>
				<td colspan="4" class="text-center">
					<input type="button" value="돌아가기" onclick="location.href='${ctp}/BoardList.bo';" class="btn btn-primary"/>
				</td>
			</tr>
		</table>
	</div>
	<p><br/></p>
<jsp:include page="/include/footer.jsp"/>
</body>
</html>