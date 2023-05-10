<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<% pageContext.setAttribute("newLine", "\n"); %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>boardContent.jsp</title>
  <jsp:include page="/include/bs4.jsp" />
  <style>
    th {
      text-align: center;
      background-color: #eee;
    }
  </style>
  <script>
    'use strict';
    
    function goodCheck() {
    	// location.href = "${ctp}/BoardGoodCheck.bo?idx=${vo.idx}";  // 일반처리한것... 아래는 aJax처리
    	
    	$.ajax({
    		type  : "post",
    		url   : "${ctp}/BoardGoodCheckAjax.bo",
    		data  : {idx : ${vo.idx}},
    		success:function(res) {
    			if(res == "0") alert("이미 좋아요 버튼을 클릭하셨습니다.");
    			else location.reload();
    		},
    		error : function() {
    			alert("전송 오류~~");
    		}
    	});
    }
    
    function goodCheckPlus() {
    	$.ajax({
    		type  : "post",
    		url   : "${ctp}/BoardGoodPlusMinus.bo",
    		data  : {
    			idx : ${vo.idx},
    			goodCnt : 1
    		},
    		success:function() {
    			location.reload();
    		}
    	});
    }
    
    function goodCheckMinus() {
    	$.ajax({
    		type  : "post",
    		url   : "${ctp}/BoardGoodPlusMinus.bo",
    		data  : {
    			idx : ${vo.idx},
    			goodCnt : -1
    		},
    		success:function() {
    			location.reload();
    		}
    	});
    }
    
    function goodSwitchCheck(count) {
    	$.ajax({
    		type  : "post",
    		url   : "${ctp}/BoardGoodPlusMinus.bo",
    		data  : {
    			idx : ${vo.idx},
    			goodCnt : count
    		},
    		success:function() {
    			location.reload();
    		}
    	});
    }
    
    function boardDelete(){
    	let ans = confirm("현재 게시글을 삭제하시겠습니까?");
    	if(ans) location.href = "${ctp}/BoardDelete.bo?idx=${vo.idx}&pag=${pag}&pageSize=${pageSize}&nickName=${vo.nickName}";
    }
    
    //댓글달기 aJax처리 
    function replyCheck(){
    	let content = $("#content").val();
    	if(content.trim()==""){
    		alert("댓글을 입력하세요.");
    		$("#content").focus();
    		return false;
    	}
    	let query = {
    			boardIdx : ${vo.idx},
    			mid : '${sMid}',
    			nickName : '${sNickName}',
    			content : content,
    			hostIp : '${pageContext.request.remoteAddr}'
    	}
    	
    	$.ajax({
    		type: "post",
    		url : "${ctp}/BoardReplyInput.bo",
    		data: query,
				success : function(res){
					if(res == "1") {
						alert("댓글이 입력되었습니다.");
						location.reload();
					}
				},
    		error : function(){
    			alert("댓글 입력 실패~");
    		}
    	});
    }
    
    function replyDelete(idx){
      let ans = confirm("덧글을 삭제하시겠습니까?");
    	if(!ans) return false;

    	$.ajax({
    		type: "post",
    		url : "${ctp}/BoardReplyDelete.bo",
    		data: {
    			replyIdx : idx
    		},
				success : function(res){
					if(res == "1") {
						alert("댓글이 삭제되었습니다.");
						location.reload();
					}
				},
    		error : function(){
    			alert("댓글 삭제 실패~");
    		}
    	});
    }
  </script>
</head>
<body>
<jsp:include page="/include/header.jsp" />
<p><br/></p>
<div class="container">
  <h2 class="text-center">글 내 용 보 기</h2>
  <br/>
  <table class="table table-borderless m-0 p-0">
    <tr>
      <td class="text-right">접속IP : ${vo.hostIp}</td>
    </tr>
  </table>
  <table class="table table-bordered">
    <tr>
      <th>글쓴이</th>
      <td>${vo.nickName}</td>
      <th>글쓴날짜</th>
      <td>${fn:substring(vo.wDate,0,fn:length(vo.wDate)-2)}</td>
    </tr>
    <tr>
      <th>글제목</th>
      <td colspan="3">${vo.title}</td>
    </tr>
    <tr>
      <th>전자메일</th>
      <td>${vo.email}</td>
      <th>조회수</th>
      <td>${vo.readNum}</td>
    </tr>
    <tr>
      <th>홈페이지</th>
      <td>${vo.homePage}</td>
      <th>좋아요</th>
      <td>
        ${vo.good} /
        <a href="javascript:goodCheck()">
          <c:if test="${sSw == '1'}"><font color="#f00" size="5">♥</font></c:if>
          <c:if test="${sSw != '1'}"><font color="#000" size="5">♥</font></c:if>
        </a> /
        <a href="javascript:goodCheckPlus()">👍</a>
        <a href="javascript:goodCheckMinus()">👎</a> /
        <%-- 
        <c:if test="${sGoodSwitch == 1}"><a href="javascript:goodSwitchCheck(1)">👍</a></c:if>
        <c:if test="${sGoodSwitch == -1}"><a href="javascript:goodSwitchCheck(-1)">👎</a></c:if>
         --%>
      </td>
    </tr>
    <tr>
      <th>글내용</th>
      <td colspan="3" style="height:220px">${fn:replace(vo.content, newLine, "<br/>")}</td>
    </tr>
    <tr>
      <td colspan="4" class="text-center">
      	<c:if test="${flag=='search'}">
        <input type="button" value="돌아가기" onclick="location.href='${ctp}/BoardSearch.bo?pag=${pag}&pageSize=${pageSize}&search=${search}&searchString=${searchString}';" class="btn btn-primary"/>
        </c:if>
      	<c:if test="${flag!='search'}">
        <input type="button" value="돌아가기" onclick="location.href='${ctp}/BoardList.bo?pag=${pag}&pageSize=${pageSize}';" class="btn btn-primary"/>
	        <c:if test="${sMid == vo.mid || sLevel==0}">
		        <input type="button" value="수정하기" onclick="location.href='${ctp}/BoardUpdate.bo?idx=${vo.idx}&pag=${pag}&pageSize=${pageSize}';" class="btn btn-success"/>
		        <input type="button" value="삭제하기" onclick="boardDelete()" class="btn btn-danger"/>
	        </c:if>
        </c:if>
      </td>
    </tr>
  </table>
  <!-- 댓글 리스트 -->
  <div class = "container">
		<table class="table table-hover text-left">
			<tr>
				<th>&nbsp;작성자</th>			
				<th>댓글내용</th>
				<th>작성일자</th>
				<th>접속IP</th>
			</tr>		
			<c:forEach var="replyVo" items="${replyVos}" varStatus="st">
				<tr>
					<td>
					${replyVo.nickName}
					<c:if test="${sMid == replyVo.mid || sLevel == 0}">
						(<a href="javascript:replyDelete(${replyVo.idx})" title="덧글 삭제">삭제</a>)
					</c:if>
					</td>
					<td>${fn:replace(replyVo.content,newLine, "<br/>")}</td>
					<td>${fn:substring(replyVo.wDate,0,19) }</td>
					<td>${replyVo.hostIp }</td>
				</tr>
			</c:forEach>
		</table>
  </div>
  <!-- 댓글 입력창 -->
  <form name="replyForm">
  	<table class="table table-center">
  		<tr>
  			<td style="width:85%" class="text-left">
  				<b>댓글:</b>
  				<textarea rows="4" name="content" id="content" class="form-control"></textarea>
  			</td>
  			<td style="width:15%">
  				<br/>
  				<p> 작성자 : ${sNickName}</p>
  				<p><input type="button" value="댓글달기" onclick="replyCheck()" class="btn btn-info btn-sm"></p>
  			</td>
  		</tr>
  	</table>
  </form>
  <!-- 이전글/ 다음글 처리 -->
  <c:if test="${flag!='search'}">
  <table class="table table-borderless">
    <tr>
      <td>
        <c:if test="${nextVo.nextIdx != 0}">
        	☝ <a href="${ctp}/BoardContent.bo?idx=${nextVo.nextIdx}&pag=${pag}&pageSize=${pageSize}">다음글 : ${nextVo.nextTitle}</a><br/>
        </c:if>
        <c:if test="${preVo.preIdx != 0}">
        	👇 <a href="${ctp}/BoardContent.bo?idx=${preVo.preIdx}&pag=${pag}&pageSize=${pageSize}">이전글 : ${preVo.preTitle}</a><br/>
        </c:if>
      </td>
    </tr>
  </table>
  </c:if>
</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp" />
</body>
</html>