<!-- t2_SessionSave.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String mid = request.getParameter("mid")==null ? "admin" : request.getParameter("mid");
	String nickName = request.getParameter("nickName")==null ? "관리맨" : request.getParameter("nickName");
	String name = request.getParameter("name")==null ? "관리자" : request.getParameter("name");
	
	session.setAttribute("sMid", mid);
	session.setAttribute("sNickName", nickName);
	session.setAttribute("sName", name);
%>


<script>
	<!--세션은 브라우저 따라감-->
	alert("세션에 저장 완료!! 세션값 : ${sMid}");
	location.href="t2_SessionMain.jsp";
</script>