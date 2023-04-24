<!-- t1_CookiesDelete.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
	Cookie[] cookies = request.getCookies();

for(int i=0; i<cookies.length; i++){
	cookies[i].setMaxAge(0); //쿠키의 만료시간을 0으로 설정해 쿠키제거
	response.addCookie(cookies[i]);
}
%>


<script>
	alert("쿠키 삭제 완료!!");
	location.href="t1_CookiesMain.jsp";
</script>