<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"  />
<c:set var="user" value="${SPRING_SECURITY_CONTEXT.authentication.principal}"/>
<c:set var="auth" value="${SPRING_SECURITY_CONTEXT.authentication.authorities}"/> <!-- 권한값만 들어가있다. -->
    
<!DOCTYPE html>
<html lang="en">
<head>
  <title>메인 화면</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  
   <script type="text/javascript">
   
	$(document).ready(function() {
		/* 회원가입 성공 메세지 */
		if(${msg1 != null}) {
				$("#modalTitle").text("${msg1}");
				$("#modalContent").html("<span style='color: green;'> 로그인 해주세요 !</span>");
				$("#myModal").modal("show");
			}
		
		/* 로그인 성공 메세지 */
		if(${user != null}) {
		    $.ajax({
	  			url : "member/${user.member.memIdx}",
	  			type : "get",
	  			dataType : "json",
	  			success : function(member) {
	  				/* alert(member.memID); */
	  				if(${msg2 != null}) {	
		  				$("#modalTitle").text("${msg2}");
		  				$("#modalContent").html("<span style='color: green;'> "+member.memName+"님 환영합니다. </span>");
		  				$("#myModal").modal("show");
	  				}
	  			},
	  			error : function() {
	  				alert("error");
	  			}
	  		});
		}
		
		/* 로그아웃 성공 메세지 */
		if(${msg3 != null}) {
				$("#modalTitle").text("${msg3}");
				$("#modalContent").html("<span style='color: red;'> Bye ~ </span>");
				$("#myModal").modal("show");
			}
	});  
   </script>
   
</head>
<body>
<!-- 상단 nav바 -->
<jsp:include page="common/header.jsp"/>     

 <div class="container">
  <h3>회원 전용 게시판</h3>
  <!-- 로그인 O -->
  <h4 style="color:blue;"> <c:if test="${user.member.memName != null}"> ${user.member.memName}님 환영합니다.</c:if></h4>
  <!-- 로그인 X -->
  <h4 style="color:red;"> <c:if test="${user.member.memName == null}"> 로그인 해주세요 !</c:if></h4>
  <p>게시판 + 회원관리 : 권한 -> 회원가입, 로그인 기능 구현</p>
</div>
 
<div class="container">
  <div class="panel panel-default">
    <div>
    	<img src="${contextPath}/resources/images/background.jpeg" style="width: 100%; height: 800px;"/>
    </div>
    <div class="panel-body"> <!-- 탭 메뉴 -->
		<ul class="nav nav-tabs">
		  <li class="active"><a data-toggle="tab" href="#home">Home</a></li>
		  <li><a data-toggle="tab" href="#menu1">게시판</a></li>
		  <li><a data-toggle="tab" href="#menu2">공지사항</a></li>
		</ul>		
		<div class="tab-content">
		  <div id="home" class="tab-pane fade in active">
		    <h3>HOME</h3>
		    <p></p>
		  </div>
		  <div id="menu1" class="tab-pane fade">
		    <h3>게시판</h3>
		    <p>Some content in menu 1.</p>
		  </div>
		  <div id="menu2" class="tab-pane fade">
		    <h3>공지사항</h3>
		    <p>Some content in menu 2.</p>
		  </div>
		</div>
    </div>
    <div class="panel-footer"> ainokks071@gmail.com </div>
  </div>
</div>

<!-- 모달창 -->
<jsp:include page="common/modal.jsp"/>
<!-- 위의 자바스크립트에서 id로 접근 -->
<!-- <div id="myModal" class="modal fade" role="dialog">
<h4 id="modalTitle" class="modal-title">모달 창 제목 뿌려주기</h4>
<p id="modalContent"> 모달 내용 뿌려주기</p> -->
 </body>
</html>
