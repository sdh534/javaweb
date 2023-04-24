<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>test1.jsp</title>
	<jsp:include page="/include/bs4.jsp" />
</head>
<body>
	<p><br/></p>
	<div class="container">
			<h2> 회원정보 </h2>
	<%-- 		<form name="myform" method="post" action="<%=request.getContextPath()%>/t0424/test1Ok"> --%>
			<form name="myform" method="post" action="${pageContext.request.contextPath}/t0424/test1Ok">
				<p>
					성명 : <input type="text" name="name" value="홍길동" autofocus class="form-control"/>
				</p>
				<p>
					나이 : <input type="text" name="age" value="13" class="form-control"/>
				</p>
				<p>
					성별 : <input type="radio" name="gender" value="남자"checked/>남자
								<input type="radio" name="gender" value="여자"/>여자
				</p>
				<p>
					직업 : <select name="job" class="form-control">
									<option value="">선택</option>
									<option>학생</option>
									<option>회사원</option>
									<option>공무원</option>
									<option>군인</option>
									<option>프리랜서</option>
									<option>기타</option>
								</select>
				</p>
				<p>
					주소 : <input type="text" name="address" value="청주" autofocus class="form-control"/>
				</p>
				<p>
					<input type="submit" value="전송" class="btn btn-primary"/>
				</p>
			</form>
	</div>
	<p><br/></p>
</body>
</html>