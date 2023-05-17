<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>pdsList.jsp</title>
  <jsp:include page="/include/bs4.jsp" />
  <script>
    'use strict';
    
    // part선택시 해당 part만 불러오기
    function partCheck() {
    	let part = partForm.part.value;
    	location.href = "${ctp}/PdsList.pds?part="+part;
    }
    
    // 다운로드횟수 증가처리(AJAX)
    function downNumCheck(idx, fSName) {
    	$.ajax({
    		type : "post",
    		url  : "${ctp}/PdsDownNumCheck.pds",
    		data : {idx : idx},
    		success : function() {
    			location.reload();
    		},
    		error : function() {
    			alert("전송오류!!");
    		}
    	});
    }
    
    // 파일 삭제처리(ajax)
    function pdsDeleteCheck(idx, fSName) {
    	let ans = confirm("선택된 자표파일을 삭제하시겠습니까?");
    	if(!ans) return false;
    	
    	let pwd = prompt("비밀번호를 입력하세요?");
    	let query = {
    			idx : idx,
    			fSName : fSName,
    			pwd : pwd
    	}
    	
    	$.ajax({
    		type : "post",
    		url  : "${ctp}/PdsDeleteCheck.pds",
    		data : query,
    		success:function(res) {
    			if(res == "1") {
    				alert('삭제되었습니다.');
    				location.reload();
    			}
    			else {
    				alert("삭제 실패~");
    			}
    		},
    		error : function() {
    			alert("전송 실패~");
    		}
    	});
    }
  </script>
</head>
<body>
<jsp:include page="/include/header.jsp" />
<p><br/></p>
<div class="container">
  <h2 class="text-center">자 료 실 리 스 트(${part})</h2>
  <br/>
  <table class="table table-borderless">
    <tr>
      <td style="width:20%" class="text-left">
        <form name="partForm">
          <select name="part" onchange="partCheck()" class="form-control">
            <option ${part=="전체" ? "selected" : ""}>전체</option>
            <option ${part=="학습" ? "selected" : ""}>학습</option>
            <option ${part=="여행" ? "selected" : ""}>여행</option>
            <option ${part=="음식" ? "selected" : ""}>음식</option>
            <option ${part=="기타" ? "selected" : ""}>기타</option>
          </select>
        </form>
      </td>
      <td class="text-right">
        <a href="${ctp}/PdsInput.pds?part=${part}" class="btn btn-success">자료올리기</a>
      </td>
    </tr>
  </table>
  <table class="table table-hover text-center">
    <tr class="table-dark text-dark">
      <th>번호</th>
      <th>자료제목</th>
      <th>올린이</th>
      <th>올린날짜</th>
      <th>분류</th>
      <th>파일명(크기)</th>
      <th>다운수</th>
      <th>비고</th>
    </tr>
    <c:forEach var="vo" items="${vos}" varStatus="st">
      <tr>
        <td>${vo.idx}</td>
        <td>${vo.title}</td>
        <td>${vo.nickName}</td>
        <td>${vo.fDate}</td>
        <td>${vo.part}</td>
        <td>
          <c:set var="fNames" value="${fn:split(vo.fName,'/')}"/>
          <c:set var="fSNames" value="${fn:split(vo.fSName,'/')}"/>
          <c:forEach var="fName" items="${fNames}" varStatus="st">
            <a href="${ctp}/images/pds/${fSNames[st.index]}" download="${fName}" onclick="downNumCheck(${vo.idx})">${fName}</a><br/>
          </c:forEach>
          (<fmt:formatNumber value="${vo.fSize/1024}" pattern="#,##0" />KByte)
        </td>
        <td>${vo.downNum}</td>
        <td>
        <a href="${ctp}/PdsTotalDown.pds?idx=${vo.idx}" class="badge badge-info">전체다운</a><br/>
        <a href="javascript:pdsDeleteCheck('${vo.idx}','${vo.fSName}')" class="badge badge-danger">삭제</a>
        <a href="javascript:pdsDeleteCheck('${vo.idx}','${vo.fSName}')" class="badge badge-warning">삭제2(모달)</a>
        </td>
      </tr>
    </c:forEach>
    <tr><td colspan="8" class="m-0 p-0"></td></tr>
  </table>
</div>

<!-- 블록페이지 -->

<p><br/></p>
<jsp:include page="/include/footer.jsp" />
</body>
</html>