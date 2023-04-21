<!-- schedule.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style>
	#img1, #img2, #img3{
		display:inline-block;
	}
</style>
<h2>이곳은 사진첩 입니다.</h2>
<hr/>
	<div class="list">
		<div name="image" id="img1"><img src="<%=request.getContextPath()%>/images/3.jpg" width="100px" height="100px"/></div>
		<div name="image" id="img2"><img src="<%=request.getContextPath()%>/images/4.jpg" width="100px" height="100px"/></div>
		<div name="image" id="img3"><img src="<%=request.getContextPath()%>/images/5.jpg" width="100px" height="100px"/></div>
	</div>

<hr/>
<p> 멋진 시간 되세요 </p>