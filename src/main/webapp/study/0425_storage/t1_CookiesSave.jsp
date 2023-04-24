<!-- t1_CookiesSave.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String mid = "hkd1234";
	String pwd = "1234";
	String job = "학생";
	Cookie cookieMid = new Cookie("cMid", mid); //쿠키변수는 첫글자 c로 사용
	Cookie cookiePwd = new Cookie("cPwd", pwd); //쿠키변수는 첫글자 c로 사용
	Cookie cookieJob = new Cookie("cJob", job); //쿠키변수는 첫글자 c로 사용
	cookieMid.setMaxAge(60*60*24); //쿠키의 만료시간 : 단위(초), 1일(60x60x24=)
	cookiePwd.setMaxAge(60*60*24); //쿠키의 만료시간 : 단위(초), 1일(60x60x24=)
	cookieJob.setMaxAge(60*60*24); //쿠키의 만료시간 : 단위(초), 1일(60x60x24=)
	
	
	//쿠키를 클라이언트에 저장하기(즉, 사용자 컴퓨터에 저장)
	response.addCookie(cookieMid);
	response.addCookie(cookiePwd);
	response.addCookie(cookieJob);
%>

<script>
	alert("쿠키에 저장 완료!!");
	location.href="t1_CookiesMain.jsp";
</script>