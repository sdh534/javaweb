<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	int aCount = application.getAttribute("aCount")==null? 0 : (int)application.getAttribute("aCount");
	int sCount = session.getAttribute("sCount")==null? 0 : (int)session.getAttribute("sCount");
	
	aCount ++;
	sCount ++;
	application.setAttribute("aCount", aCount);
	session.setAttribute("sCount", sCount);
%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>t4_StorageTest.jsp</title>
	<jsp:include page="/include/bs4.jsp" />
</head>
<body>
	<p><br/></p>
	<div class="container">
		<h2>방문카운트 비교하기</h2>
		<p>
			어플리케이션 카운트 : ${aCount}
		</p>
		<p>
			세션 카운트 : ${sCount}
		</p>
		<hr/>
		<p>
			<a href="t4_ApplicationStart.jsp">어플리케이션 카운트 초기화</a>
		</p>
		<p>
			<a href="t4_SessionStart.jsp">세션 카운트 초기화</a>
		</p>
	</div>
	<p><br/></p>
</body>
</html>