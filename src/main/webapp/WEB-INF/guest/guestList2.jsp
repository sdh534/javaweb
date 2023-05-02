<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<% pageContext.setAttribute("newLine", "\n"); %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>guestList.jsp</title>
	<jsp:include page="/include/bs4.jsp" />
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<style>
		th {
			background-color:#ccc;
			text-align: center;
		}
	</style>
</head>
<body>
<jsp:include page="/include/header.jsp"/>
	<p><br/></p>
	<div class="container">
		<h2 class="text-center"> 방명록 리스트 - 페이징 처리 X  </h2>
		<table class="table table-borderless mb-0">
		<tr>
			<td>
				<c:if test="${sAdmin != 'admin'}"><a href="${ctp}/AdminLogin.gu" class="btn btn-secondary btn-sm mb-0">관리자</a></c:if>
				<c:if test="${sAdmin == 'admin'}"><a href="${ctp}/AdminLogout.gu" class="btn btn-danger btn-sm mb-0">관리자 로그아웃</a></c:if>
			</td>
			<td style="text-align:right;"><a href="${ctp}/GuestInput.gu" class="btn btn-success btn-sm mb-0">글쓰기</a></td>
		</tr>
		</table>
		<hr/>
		<c:forEach var="vo" items="${vos}" varStatus="st">
			<table class="table table-borderless mb-0 mt-0">
				<tr>
					<td>번호: ${vo.idx}</td>
					<td style="text-align:right;">방문IP: ${vo.hostIp}</td>
				</tr>
			</table>
			<table class="table table-bordered mt-0">
				<tr>
					<th style="20%">이름</th>
					<td style="25%">${vo.name}</td>
					<th style="20%">방문일자</th>
					<td style="35%">${fn:substring(vo.visitDate,0,19)}</td>
				</tr>
				<tr>
					<th>E-mail</th>
					<td colspan="3">
					<c:if test="${empty vo.email || fn:length(vo.email)<5 || fn:indexOf(vo.email, '@')==-1  || fn:indexOf(vo.email, '.')==-1}"> - 없음 - </c:if>
					<c:if test="${!empty vo.email && fn:length(vo.email)>=5 && fn:indexOf(vo.email, '@')!=-1  && fn:indexOf(vo.email, '.')!=-1}"> ${vo.email} </c:if>
					</td>
				</tr>
				<tr>
					<th>홈페이지</th>
					<td colspan="3">${vo.homePage}
						<c:if test="${empty vo.homePage || fn:length(vo.homePage)<10 || fn:indexOf(vo.homePage, '.')==-1}"> - 없음 - </c:if>
						<c:if test="${!empty vo.homePage && fn:length(vo.homePage)>=10 && fn:indexOf(vo.homePage, '.')!=-1}"> ${vo.email} </c:if>
					</td>
				</tr>
				<tr>
					<th>방문소감</th>
					<td colspan="3" style="height:150px;">${fn:replace(vo.content, newLine, '<br/>')}</td>
				</tr>
			</table>
		</c:forEach>
	</div>
	<p><br/></p>
<jsp:include page="/include/footer.jsp"/>
</body>
</html>