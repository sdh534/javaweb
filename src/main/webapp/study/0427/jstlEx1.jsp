<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>jstl2.jsp</title>
  <jsp:include page="/include/bs4.jsp" />
	<script>
	'use strict';
	
	function fCheck(){
		let img_id = document.getElementById("img_select").value;
		
		demo.innerHTML = "<img src='${pageContext.request.contextPath}/images/"+img_id+".jpg' width='900px' height='600px'/>"
	}
	
	function fClick(){
		let img_name = document.getElementById("img_name").value == null ? "" : document.getElementById("img_name").value;
		demo.innerHTML="<c:set var='img_name' value="${request.getParameter('img_name')}"/>"
		demo.innerHTML+="${img_name}"
	}
	function fPrint(){

		
	}
	</script>
</head>
<body>
<p><br/></p>
<div class="container">
  <h2>JSTL(Java Standard Tag Library)</h2>
 	<pre>
 		문제: 콤보상자에 숫자 1~6까지를 기억시키고 화면에 보여주세요!<br/>
 		이때 숫자를 선택하면 아래쪽으로 선택한 숫자의 그림 파일을 출력합니다
 	</pre>
 	<hr/>
 	
 	<select name ="img_select" id="img_select" onchange="fCheck()">
 		<c:forEach var="i" begin="1" end="6">
 		<option value="${i}">${i}</option>
 		</c:forEach>
 	</select>
 	<p>그림명: 
	<input type="text" name="img_name" id="img_name"/>
	<input type="button" name="btn_submit" id="btn_submit" value="전송" onclick="fClick()"/>
	<input type="button" name="btn_submit" id="btn_submit" value="출력" onclick="fPrint()"/>
	</p>
	<pre>
		1~6.jpg는 그림 파일 명이다.
 		'그림명'과, '그림파일명'을 저장시켜준다.(여러개를 저장할 수 있도록 처리)
 		마지막으로 '출력'버튼을 클릭하면 아래쪽으로(demo)으로 저장된 모든 그림파일과 그림파일명을 출력한다.
 	</pre>
 	<hr/>
 
	<div id="demo"></div>
	
</div>
<p><br/></p>
</body>
</html>







