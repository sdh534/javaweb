<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
  String mid = session.getAttribute("sMid")==null ? "" : (String) session.getAttribute("sMid");
  if(mid.equals("")) {
  	out.print("<script>");
  	out.print("alert('로그인후 사용하세요.');");
  	out.print("location.href='"+request.getContextPath()+"/study/0425_storage/t7_Login_ex.jsp';");
  	out.print("</script>");
  }
%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>t7_member_ex.jsp</title>
  <jsp:include page="/include/bs4.jsp" />
</head>
<body>
<p><br/></p>
<div class="container">
  <h2>이곳은 회원방입니다.</h2>
  <hr/>
  ${sMid}님 로그인 중이십니다. / 총 방문자수 : ${totalVisitCount}명
  <hr/>
  <p><img src="${pageContext.request.contextPath}/images/1.jpg" width="200px"/></p>
  <hr/>
  <p><a href="<%=request.getContextPath()%>/t0425/T7_LoginOut_ex" class="btn btn-danger">로그아웃</a></p>
</div>
<p><br/></p>
</body>
</html>