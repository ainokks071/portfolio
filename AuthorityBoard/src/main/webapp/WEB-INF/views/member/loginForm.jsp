<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"  />

<!DOCTYPE html>
<html lang="en">
<head>
  <title>로그인 화면</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  	<script type="text/javascript" defer>
		/* console.log("${param.error}"); */
		/* 로그인 실패 modal */
		$(document).ready(function() {
		 	if(${param.error != null}) {
				$("#modalTitle").text("로그인 실패(spring security)");
				$("#modalContent").html("<span style='color: red;'> 일치하는 회원이 없습니다. 다시 로그인해주세요. </span>");
				$("#myModal").modal("show");
		 	}
		});  
	</script>
</head>
<body>
 
<jsp:include page="../common/header.jsp"></jsp:include>
 
<div class="container">
  <h2>로그인 화면</h2>
  <div class="panel panel-default">
    <div class="panel-heading">Login</div>
    <div class="panel-body">
      <!-- Security loginProcessingUrl("/login") -->
      <form action="${contextPath}/login" method="post">
      	 <!--스프링시큐리티가 적용되면, 모든 POST방식에는 CSRF 토큰을 넘겨줘야한다.   -->
      	 <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
         <table class="table table-bordered" style="text-align: center; border: 1px solid #dddddd;">
           <tr>
             <td style="width: 110px; vertical-align: middle;">아이디</td><!-- Security : name = username  -->
             <td><input type="text" id="memID" name="username" class="form-control" maxlength="20" placeholder="아이디를 입력하세요."/></td>
           </tr>
           <tr>
             <td style="width: 110px; vertical-align: middle;">비밀번호</td><!-- Security : name = password  -->
             <td colspan="2"><input type="password" id="memPassword" name="password" class="form-control" maxlength="20" placeholder="비밀번호를 입력하세요."/></td>            
           </tr>      
           <tr>
             <td colspan="2" style="text-align: left;">
                <input type="submit" class="btn btn-primary btn-sm pull-right" value="로그인"/>
             </td>             
           </tr>
         </table>
      </form> 
    </div>
    <div class="panel-footer">ainokks071@gmail.com</div>
  </div>
</div>

<jsp:include page="../common/modal.jsp"/>

</body>
</html>