<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!-- security 태그 <security> -->
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"  />
<c:set var="user" value="${SPRING_SECURITY_CONTEXT.authentication.principal}"/>
<c:set var="auth" value="${SPRING_SECURITY_CONTEXT.authentication.authorities}"/>

<script>
	var csrfHeaderName = "${_csrf.headerName}";
	var csrfTokenValue = "${_csrf.token}";
	/* Security Logout(SecurityConfig) : get(x) post(o)*/
	/* 방법 1 :ajax */
	function securityLogout(){
	  	$.ajax({
	  		url : "${contextPath}/logout",
	  		type: "post",
	  		beforeSend: function(xhr){
	              xhr.setRequestHeader(csrfHeaderName, csrfTokenValue)
	          },
	  		success : function(){
	  			location.href="${contextPath}/logoutSuccess";
	  		},
	  		error : function(){ alert("error");}    		
	  	}); 
	}
	/* 방법 2 : js로 post요청 */
	function securityLogoutPost(){
		    let f = document.createElement('form');
		    let obj;
		    obj = document.createElement('input');
		    obj.setAttribute('type', 'hidden');
		    obj.setAttribute('name', '${_csrf.parameterName}');
		    obj.setAttribute('value', '${_csrf.token}');
		
		    f.appendChild(obj);
		    f.setAttribute('method', 'post');
		    f.setAttribute('action', '${contextPath}/logout');
		    document.body.appendChild(f);
		    f.submit();
		}
</script>

<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="${contextPath}/main">회원 전용 게시판</a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a href="${contextPath}/main">Home</a></li>
      <li><a href="#">Page 1</a></li>
      <li><a href="#">Page 2</a></li>
      <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">Page 3 <span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="#">Page 3-1</a></li>
          <li><a href="#">Page 3-2</a></li>
          <li><a href="#">Page 3-3</a></li>
        </ul>
      </li>
      <li><a href="${contextPath}/board">게시판</a></li>
    </ul>
    
    <!-- 로그인을 하지 않은 경우 : 회원가입, 로그인 버튼 -->
    <security:authorize access="isAnonymous()">
	    <ul class="nav navbar-nav navbar-right">
	      <li><a href="${contextPath}/signupForm"><span class="glyphicon glyphicon-user"></span> 회원가입</a></li>
	      <li><a href="${contextPath}/loginForm"><span class="glyphicon glyphicon-log-in"></span> 로그인</a></li>
	    </ul>
    </security:authorize>
    
    <!-- 로그인을 한 경우 -->
    <security:authorize access="isAuthenticated()">
     <ul class="nav navbar-nav navbar-right">
	  <li>
	  		 <!-- 로그인을 한 경우, Security Context Holder에 객체바인딩 된 회원 정보 추출 -->
		  	 <!-- 사진 업로드 한 경우, 회원이미지 추출 -->
			  <c:if test="${!empty user.member.memProfile}">
		    	  <div><a href="${contextPath}/memberImageForm.do"><img class="img-circle" src="${contextPath}/resources/upload/${user.member.memProfile}" style="width: 40px; height: 40px;"/></a></div> 
		 	 </c:if>
		 	 <!-- 사진 업로드 하지 않은 경우, 기본이미지 -->
			  <c:if test="${empty user.member.memProfile}">
		    	  <div><a href="${contextPath}/memberImageForm.do"><img class="img-circle" src="${contextPath}/resources/images/basicProfile.jpeg" style="width: 40px; height: 40px;"/></a></div> 
		 	 </c:if>
	  </li>
	       
      <li>
      	<a> ${user.member.memName}님 환영합니다. (
      	<!-- 해당하는 권한 출력 -->
    	<security:authorize access="hasRole('ROLE_USER')"> USER </security:authorize>
    	<security:authorize access="hasRole('ROLE_MANAGER')"> MANAGER </security:authorize>
    	<security:authorize access="hasRole('ROLE_ADMIN')"> ADMIN </security:authorize> 
    	)
      	</a>
      </li>
      
      <li><a href="${contextPath}/updateForm"><span class="glyphicon glyphicon-wrench"></span> 회원정보 수정</a></li>
      <li><a href="${contextPath}/imageForm"><span class="glyphicon glyphicon-picture"></span> 프로필사진 수정 </a></li>
      <li><a href="javascript:securityLogout()"><span class="glyphicon glyphicon-log-out"></span> Logout</a></li>
     </ul>
     </security:authorize>
     
  </div>
</nav>