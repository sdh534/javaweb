<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>memberList.jsp</title>
	<jsp:include page="/include/bs4.jsp" />
	<meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>
<jsp:include page="/include/header.jsp"/>
	<p><br/></p>
	<div class="container">
		<h2>전체 회원 리스트</h2>
		<br/>
		<table class="table table-hover">
			<tr class="table-dark text-dark">
				<th>번호</th>
				<th>아이디</th>
				<th>별명</th>
				<th>성명</th>
				<th>성별</th>
			</tr>
			<c:forEach var="vo" items="${vos}" varStatus="st">
				<tr>
					<td>${vo.idx}</td>
					<td>${vo.mid}</td>
					<td>${vo.nickName}</td>
					<td>
						<c:if test="${vo.userInfor=='공개'}">	${vo.name}</c:if>
						<c:if test="${vo.userInfor!='공개'}">비공개</c:if>					
					</td>
					<td>${vo.gender}</td>
				</tr>
			</c:forEach>
		</table>
	</div>
	<p><br/></p>
<jsp:include page="/include/footer.jsp"/>
</body>
</html>