<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<jsp:include page="/include/memberCheck.jsp" />
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>memberList.jsp</title>
  <jsp:include page="/include/bs4.jsp" />
</head>
<body>
<jsp:include page="/include/header.jsp"/>
<p><br/></p>
<div class="container">
  <h2>전 체 회 원 리 스 트</h2>
  <table class="table table-hover text-center">
    <tr class="table-dark text-dark">
      <th>번호</th>
      <th>아이디</th>
      <th>성명</th>
      <c:if test="${sMid == 'admin'}">
	      <th>비밀번호</th>
	      <th>포인트</th>
	      <th>최종방문일</th>
      </c:if>
      <th>오늘방문횟수</th>
    </tr>
    <c:forEach var="vo" items="${vos}" varStatus="st">
	    <tr>
	      <td>${vo.idx}</td>
	      <td>${vo.mid}</td>
	      <td>${vo.name}</td>
	      <c:if test="${sMid == 'admin'}">
		      <td>${vo.pwd}</td>
		      <td>${vo.point}</td>
		      <td>${fn:substring(vo.lastDate,0,16)}</td>
	      </c:if>
	      <td>${vo.todayCount}</td>
	    </tr>
    </c:forEach>
    <tr><td colspan="7" class="m-0 p-0"></td></tr>
  </table>
  <br/>
  <div>
    <a href="${ctp}/study/0428_database/memberMain.jsp" class="btn btn-success">돌아가기</a>
  </div>
</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp"/>
</body>
</html>