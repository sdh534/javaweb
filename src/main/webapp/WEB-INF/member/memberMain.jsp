<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>memberMain.jsp</title>
  <jsp:include page="/include/bs4.jsp" />
  <style>
    .viewCheck {
      color: red;
    }
    #memberInfo1, #memberInfo2 {
      float: left;
    }
    #memberInfo3, #memberInfo4 {
      clear: both;
    }
  </style>
</head>
<body>
<jsp:include page="/include/header.jsp" />
<p><br/></p>
<div class="container">
  <h2>회 원 전 용 방</h2>
  <hr/>
  <c:if test="${sLevel == 1}">
    <pre>
      <font size="5" color="blue"><b>정회원 자동 등업조건</b></font>
      <div>
        1. 방명록에 5건 이상의 글 올리기
        2. 방문횟수가 10회 이상일것
      </div>
      앞의 2가지 조건이 만족되면 자동 정회원으로 등업처리 됩니다.
		  <hr/>
    </pre>
  </c:if>
  <c:if test="${sLevel == 2 && visitCnt <= 15}">
    <font color="red"><b>정회원</b> 등업을 축하합니다.</font>
	  <hr/>
  </c:if>
  <div id="memberInfo1" class="mr-5">
    <p>현재 <font color="blue">${sNickName}</font>(${strLevel})님 로그인 중이십니다.</p>
    <p>누적 포인트 : <span class="viewCheck">${point}</span></p>
    <p>최종 방문일자 : <span class="viewCheck">${fn:substring(sLastDate,0,fn:length(sLastDate)-2)}</span></p>
    <p>총 방문횟수 : <span class="viewCheck">${visitCnt}</span></p>
    <p>오늘 방문횟수 : <span class="viewCheck">${todayCnt}</span></p>
  </div>
  <div id="memberInfo2">
    <p>회원사진<br/><img src="${ctp}/images/member/${photo}" width="200px"/></p>
  </div>
  <hr id="memberInfo4" />
  <div id="memberInfo3">
	  <h4>활동내역</h4>
	  <p>방명록에 올린글수 : <span class="viewCheck">${guestCnt}</span> 건</p>
	  <p>게시판에 올린글수 : <span class="viewCheck">
	                       <c:if test="${boardCnt == 0}">${boardCnt}</c:if>
	                       <c:if test="${boardCnt != 0}"><a href="${ctp}/BoardSearchMember.bo">${boardCnt}</a></c:if>
	                     </span>건</p>
	  <p>자료실에 올린글수 : <span class="viewCheck">${pdsCnt}</span> 건</p>
  </div>
</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp" />
</body>
</html>