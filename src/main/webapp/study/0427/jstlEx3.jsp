<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%
	String atom = "Welcome to My Homepage!";
	pageContext.setAttribute("atom", atom);
	
	String search = request.getParameter("search")==null ? "":request.getParameter("search");
	pageContext.setAttribute("search", search);
%>
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
	<pre>
	0         1         2   
	012345678901234567890123
	Welcome to My Homepage!
	</pre>
	<p> 찾고자 하는 단어를 입력하세요
	<form name="myform" method="post" action="">
		<input type="text" name="search" id="search"/>
		<input type="submit" value="찾기"/>
	</p>
	</form>
	<div>입력하신 단어는 ... ${search}</div>
	<c:set var="cnt" value="0"/>
	완벽 일치(대소문자 구분) :
      <c:forEach var="i" begin="0" end="${fn:length(atom)-1}">
      	<c:if test="${fn:substring(atom,i,i+1) == search}">
      		<c:set var="cnt" value="${cnt + 1}"/>
      		 ${i}번째 /
      	</c:if>
      </c:forEach>
  <br/>
  알파벳 일치(대소문자 구분x) : 
        <c:forEach var="i" begin="0" end="${fn:length(atom)-1}">
      	<c:if test="${fn:substring(atom,i,i+1) == search}">
      		<c:set var="cnt" value="${cnt + 1}"/>
      		 ${i}번째 /
      	</c:if>
      </c:forEach>
	</div>
	<p><br/></p>
</body>
</html>