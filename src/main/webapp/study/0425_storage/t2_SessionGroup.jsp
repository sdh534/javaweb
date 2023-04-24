<!-- t2_SessionGroup.jsp -->
<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
	//String name = (String) session.getAttribute("sName");
	
	Enumeration names = session.getAttributeNames();
	while(names.hasMoreElements()){
		String name = (String) names.nextElement();
		out.println("세션명 : " + name + "<br/>");
	}
%>

<jsp:include page="/include/bs4.jsp"></jsp:include>
<p>
	<a href="t2_SessionMain.jsp" class="btn btn-success">돌아가기</a>
</p>