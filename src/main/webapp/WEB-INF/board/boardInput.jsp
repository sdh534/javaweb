<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>title</title>
	<jsp:include page="/include/bs4.jsp" />
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<script>
		'use strict';
		
		function fCheck(){
			let title = myform.title.value;
			let content = myform.content.value;
			if(title.trim()==""){
				alert("글 제목을 입력해주세요!");
				myform.title.focus();
			}
			else if(content.trim()==""){
				alert("게시글 내용을 입력해주세요!");
				myform.content.focus();
			}
			else {	myform.submit();	}
		}
	</script>
</head>
<body>
<jsp:include page="/include/header.jsp"/>
	<p><br/></p>
	<div class="container">
		<h2 clas="text-center">게 시 판 글 쓰 기 </h2>
		<form name="myform" method="post" action="${ctp}/BoardInputOk.bo">
			<table class="table table-bordered">
				<tr>
					<th>글쓴이</th>
					<td>${sMid}</td>
				</tr>			
				<tr>
					<th>제목</th>
					<td><input type="text" name="title" id="title" placeholder="글 제목을 입력하세요" autofocus required class="form-control"/></td>
				</tr>			
				<tr>
					<th>이메일</th>
					<td><input type="text" name="email" id="email" placeholder="이메일을 입력하세요" required class="form-control"/></td>
				</tr>			
				<tr>
					<th>홈페이지</th>
					<td><input type="text" name="homePage" id="homePage" placeholder="홈페이지 주소를 입력하세요" class="form-control"/></td>
				</tr>			
				<tr>
					<th>글 내용</th>
					<td><textarea rows="6" name="content" id="content" placeholder="글 내용을 입력하세요" required class="form-control"></textarea></td>
				</tr>			
				<tr>
					<th>공개 여부</th>
					<td>
						<input type="radio" name="openSw" id="homePage" value="OK" checked">공개 &nbsp;
						<input type="radio" name="openSw" id="homePage" value="NO" ">비공개 &nbsp;
					</td>
				</tr>		
				<tr>
					<td colspan="2" class="text-center">
						<input type="button" value="글올리기" onclick="fCheck()" class="btn btn-success"/>
						<input type="reset" value="다시입력" class="btn btn-danger"/>
						<input type="button" value="돌아가기" onclick="location.href='${ctp}/BoardList.bo';" class="btn btn-secondary"/>
					</td>
				</tr>					
			</table>
			<input type="hidden" name="hostIp" value="${pageContext.request.remoteAddr}"/>
		</form>
	</div>
	<p><br/></p>
<jsp:include page="/include/footer.jsp"/>
</body>
</html>