<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>jstl2.jsp</title>
  <jsp:include page="/include/bs4.jsp" />
</head>
<body>
<p><br/></p>
<div class="container">
  <h2>JSTL(Java Standard Tag Library)</h2>
  <h3>반복처리(core라이브러리를 사용... - forEach문)</h3>
  <pre>
    사용법1 : < c : forEach var="변수" begin="초기값" end="최종값" step="증감값" varStatus="매개변수" >
             < /c : forEach >
    사용법2 : < c : forEach var="변수" items="$ {배열/객체명}" varStatus="매개변수" >
             < /c : forEach >
    사용법3 : < c : forTokens var="변수" items="$ {배열/객체명}" delims="구분기호" >
             < /c : forEach >
  </pre>
  <hr/>
  <p>사용예 1-1:<br/>
    <c:forEach var="i" begin="1" end="10" step="1">
      ${i}. 안녕 / 
    </c:forEach>
  </p>
  <p>사용예 1-2:<br/>
    <c:forEach var="i" begin="5" end="10" step="1" varStatus="st">
      ${i} : ${st.index} : ${st.count} : ${st.first} : ${st.last} 안녕 / 
    </c:forEach>
  </p>
  <p>사용예 2-1:<br/>
<%
    String[] cards = {"국민","BC","농협","비자","LG","삼성"};
		pageContext.setAttribute("cards", cards);
    //String hobbys = "등산/낚시/수영/바둑/영화감상/음악감상";
%>
    <c:forEach var="card" items="${cards}">
    	${card} / 
    </c:forEach>
  </p>
  <p>사용예 2-2:<br/>
    <c:forEach var="card" items="${cards}" varStatus="st">
   		${st.index + 1}.${card} / 
   		<%-- ${st.count}.${card} / --%> 
    </c:forEach>
  </p>
<%    
	String hobbys = "등산/낚시/수영/바둑/영화감상/음악감상";
	pageContext.setAttribute("hobbys", hobbys);
%>
	<p>사용예 3-1:<br/>
    <c:forTokens var="hobby" items="${hobbys}" delims="/">
    	${hobby} :
    </c:forTokens>
  </p>
	<p>사용예 3-2:<br/>
    <c:forTokens var="hobby" items="${hobbys}" delims="/" varStatus="st">
    	${st.count}.${hobby} :
    </c:forTokens>
  </p>
  <hr/>
  <p> 문제1: 전송된 취미중에서 바둑은 빨강, 수영은 파랑, 나머지는 그대로 출력<br/>
   <c:forTokens var="hobby" items="${hobbys}" delims="/">
   	<c:choose>
		<c:when test="${hobby =='바둑'}"><font color='red'">바둑</font></c:when>
		<c:when test="${hobby =='수영'}"><font color='blue'">수영</font></c:when>
		<c:otherwise>${hobby}</c:otherwise>
		</c:choose>
    </c:forTokens>
    
    <p> 여기는 전송된 값을 받아옴!!! <br/>
   	<c:choose>
		<c:when test="${param.hobby.equals('바둑')}"><span style="color:red">바둑</span></c:when>
		<c:when test="${param.hobby.equals('수영')}"><span style="color:blue">수영</span></c:when>
		<c:otherwise>${param.hobby}</c:otherwise>
		</c:choose>
  	</p>
  	
  <hr/>
  <h3>구구단 연습</h3>
  <c:forEach var="i" begin="1" end="9">
  	7 x ${i} = ${7*i} <br/>
  </c:forEach>	
  <hr/>
  <h3>이중 forEach문을 활용한 구구단 </h3>
  <table class="table table-bordered">
  <c:forEach var="i" begin="1" end="9">
  	<br/><tr><td>
  	<c:forEach var="j" begin="1" end="9">
			${i} x ${j} = ${j*i} 
		<br/>  	
  	</c:forEach> </td></tr>
  </c:forEach>	
  </table>
  <hr/>
  
  
  <h3>그림 6장을 1줄에 3장씩 찍어보자</h3>
  <c:forEach var="i" begin="1" end="6">
  	<img src="${pageContext.request.contextPath}/images/${i}.jpg" width="100px" height="100px"/>
  	<c:if test="${i%3==0}"><br/></c:if>
  </c:forEach>
  <h3>그림 6장을 1줄에 3장씩 찍어보자 ~이중for문~</h3>
  <c:forEach var="i" begin="1" end="2">
	  <c:forEach var="j" begin="1" end="3">
	  	<img src="${pageContext.request.contextPath}/images/${j}.jpg" width="100px" height="100px"/>
	  </c:forEach>
	  <br/>
  </c:forEach>
  
  작업끝~~~~~<br/>
</div>
<p><br/></p>
</body>
</html>







