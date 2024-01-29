<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"  />
    
<!DOCTYPE html>
<html>
<head>
  <title>회원 가입 화면</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <script type="text/javascript">
  
	$(document).ready(function() {
	  	/* 회원가입 실패 modal */
		if(${!empty msg1}) {
			$("#modalTitle").text("${msg1}");
			$("#modalContent").html("<span style='color: red;'> ${msg2} </span>");
			$("#myModal").modal("show");
		}
	});  
  
	/* 아이디 중복확인(ajax) */ 
	function idDuplicated() {
    	const memID = $("#memID").val();
    	/* 아무것도 입력하지 않고, 중복확인버튼 클릭한 경우 */
    	if(memID == '') {
    		alert("아이디를 입력하세요");
    		return;
    	}
    	
		$.ajax({
			url : "${contextPath}/member/idDuplicated",
			type : "get",
			data : { "memID" : memID },
  			success : function(id) {
  				   /* ID 중복일 경우 : 해당 ID 반환
  				 	  중복이 아닐 경우 : 빈문자열 반환 */
				if(id == '') {
	 				$("#modalTitle").text("ID 중복 확인");
	 				$("#modalContent").html("<span style='color: green;'> 사용 가능한 아이디입니다.</span>");
	 				$("#myModal").modal("show");
				} else {
					$("#modalTitle").text("ID 중복 확인");
	 				$("#modalContent").html("<span style='color: red;'> 중복된 아이디입니다.</span>");
	 				$("#myModal").modal("show");
	  			}
  			},	
			error : function() { alert("error"); }
		});
	}
  
  	/* onkeyup : input에 키보드를 눌렀다 뗄 때마다 실행 */
	function passwordCheck() {
		const pwd1 = $("#memPassword1").val();
		const pwd2 = $("#memPassword2").val();
		/* pwd2 비밀번호확인 input이 비어있으면(= pwd1만 입력하고 있을때는) 실행X */
		if(pwd2 != '') {
			if(pwd1 != pwd2) {
				$("#passMessage").text("비밀번호가 일치하지않습니다.");
				$("#passMessage").css("color", "red");
			} else {
				$("#passMessage").text("비밀번호가 일치합니다.");
				$("#passMessage").css("color", "green");
				/* pwd1과 pwd2가 일치한다면, hidden -> name = memPassword=''에 비밀번호 값 대입 */
				$("#memPassword").val(pwd1);
			}
		}
	}
  
  /* 회원가입 등록버튼 클릭 시 */
  function registerCheck() {
	  /* 나이는 int인데, 아무것도 입력하지 않고 서버로 넘어가면 -> null이 된다. 따라서 에러 발생 !!
	     프론트단에서 해결해주는 게 좋겠다. */

	  const memID = $("#memID").val();
	  const memPassword1 = $("#memPassword1").val();
	  const memPassword2 = $("#memPassword2").val();
	  const memName = $("#memName").val();
	  const memAge = $("#memAge").val();
	  const memEmail = $("#memEmail").val();
	  
	  const memGender = $("input[name=memGender]:radio:checked").length < 1
	  
	  const auth1 = $('input:checkbox[id="auth1"]').is(":checked");
	  const auth2 = $('input:checkbox[id="auth2"]').is(":checked");
	  const auth3 = $('input:checkbox[id="auth3"]').is(":checked");
	  
	  /* 1. 입력 누락체크 : 하나라도 누락이 있는 경우 return false  */
	  if(memID == '' || memPassword1 == '' || memPassword2 == '' || memName == '' || memAge == '' || memGender == true || 
	     memAge <= 0 || memAge > 120 || memEmail == '' ||
	    (auth1 == false && auth2 == false && auth3 == false)) {
		  
		$("#modalTitle").text("회원가입 실패");
		$("#modalContent").html("<span style='color: red;'> 모든 정보를 입력해주세요. </span>");
		$("#myModal").modal("show");
		  return false;
	  }
	  
	  /* 2. 비밀번호 일치여부 체크 : 입력 누락은 없지만, 비밀번호 다른 경우 return false */
	  if(memPassword1 != memPassword2) {
		$("#modalTitle").text("회원가입 실패");
		$("#modalContent").html("<span style='color: red;'> 비밀번호가 일치하지 않습니다. 다시 입력해주세요. </span>");
		$("#myModal").modal("show");
		 return false;
	  }
	  
	  /* 여기까지 입력 누락, 비밀번호 일치여부 통과  */
	  
	  /* 3. 아이디 중복 체크 */
		$.ajax({
			url : "${contextPath}/member/idDuplicated",
			type : "get",
			data : { "memID" : memID },
  			success : function(id) {
				/* ID 중복일 경우 : 해당 ID 반환
			 	중복이 아닐 경우 : 빈문자열 반환 */
				if(id != '') {
	 				$("#modalTitle").text("회원가입 실패");
	 				$("#modalContent").html("<span style='color: red;'> 중복된 아이디입니다. 다시 입력해주세요.</span>");
	 				$("#myModal").modal("show");
	 			 	return false;
				}
				/* 모든 검사 통과, form 전송 : /member/signUp */
				document.frm.submit();
  			},	
			error : function() { alert("error"); }
		});
  }
  </script>
</head>

<jsp:include page="../common/header.jsp"></jsp:include>

<body>
<div class="container">
  <h2>회원 가입 화면</h2>
  <div class="panel panel-default">
    <div class="panel-heading">SignUp</div>
    <div class="panel-body" id="writeForm" >
	  <form name="frm" action="${contextPath}/member/signUp" method="post">
			<!--스프링시큐리티가 적용되면, 모든 POST방식에는 CSRF 토큰을 넘겨줘야한다.   -->
	 	  <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
	 	  <input type="hidden" id="memPassword" name="memPassword" value=""/>
		  <input type="hidden" id="memProfile" name="memProfile" value=""/>
		  <input type="hidden" id="authType" name="authType" value=""/>
	  
          <table class="table table-bordered" style="text-align: center; border: 1px solid #dddddd;">
           <tr>
             <td style="width: 110px; vertical-align: middle;">아이디</td>
             <td><input type="text" id="memID" name="memID" class="form-control" maxlength="20" placeholder="아이디를 입력하세요."/></td>
             <td style="width: 110px;"><button type="button" class="btn btn-primary btn-sm" onclick="idDuplicated()">중복확인</button></td>
           </tr>
           
           <tr>
             <td style="width: 110px; vertical-align: middle;">비밀번호</td>
             																			  <!--input에 입력할 때마다 함수 호출  -->
             <td colspan="2"><input type="password" id="memPassword1" name="memPassword1" onkeyup="passwordCheck()" class="form-control" maxlength="20" placeholder="비밀번호를 입력하세요."/></td>            
           </tr>
           <tr>
             <td style="width: 110px; vertical-align: middle;">비밀번호확인</td>
             <td colspan="2"><input type="password" id="memPassword2" name="memPassword2" onkeyup="passwordCheck()" class="form-control" maxlength="20" placeholder="비밀번호를 확인하세요."/></td>            
           </tr>
           
            <tr>
             <td style="width: 110px; vertical-align: middle;">사용자 이름</td>
             <td colspan="2"><input type="text" id="memName" name="memName" class="form-control" maxlength="20" placeholder="이름을 입력하세요."/></td>            
           </tr>
           <tr>
             <td style="width: 110px; vertical-align: middle;">나이</td>
             <td colspan="2"><input type="number" id="memAge" name="memAge" class="form-control" maxlength="20" placeholder="나이를 입력하세요."/></td>            
           </tr>
           <tr>
             <td style="width: 110px; vertical-align: middle;">성별</td>
             <td colspan="2">
                <div class="form-group" style="text-align: center; margin: 0 auto;">
                    <div class="btn-group" data-toggle="buttons">
                       <label class="btn btn-primary active">
                         <input type="radio" name="memGender" autocomplete="off" value="남자" />남자
                       </label>
                        <label class="btn btn-primary">
                         <input type="radio" name="memGender" autocomplete="off" value="여자"/>여자
                       </label>
                    </div>                    
                </div>
             </td>            
           </tr> 
           
           <tr>
             <td style="width: 110px; vertical-align: middle;">이메일</td>
             <td colspan="2"><input type="text" id="memEmail" name="memEmail" class="form-control" maxlength="20" placeholder="이메일을 입력하세요."/></td>            
           </tr>
           
           <tr>
             <td style="width: 110px; vertical-align: middle;">사용자 권한</td>
             <td colspan="2">
                <input type="checkbox" id="auth1" name="authList[0].authType" value="ROLE_USER"> ROLE_USER
	            <input type="checkbox" id="auth2" name="authList[1].authType" value="ROLE_MANAGER"> ROLE_MANAGER
	            <input type="checkbox" id="auth3" name="authList[2].authType" value="ROLE_ADMIN"> ROLE_ADMIN           
           </tr>
           <tr>
             <td colspan="3" style="text-align: left;">
                <span id="passMessage" style="color: red"> </span>   <input type="button" class="btn btn-primary btn-sm pull-right" onclick="registerCheck()" value="등록" />
             </td>             
           </tr>
           
         </table>
         
      </form>    
    </div>
    
    <div class="panel-footer">ainokks071@gmail.com</div>
    
	<jsp:include page="../common/modal.jsp"/>
  </div>
</div>
</body>
</html>