<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"  />
<c:set var="user" value="${SPRING_SECURITY_CONTEXT.authentication.principal}"/>
<c:set var="authList" value="${SPRING_SECURITY_CONTEXT.authentication.authorities}"/>

<!DOCTYPE html>
<html lang="en">
<head>
  <title>Board</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  
 <!-- 게시물 리스트 조회(JOIN : 게시판 + 회원정보) : boardList() -->
 <script type="text/javascript" >
	$(document).ready(function() {
		boardList();
	});
	
	function boardList() {
		$.ajax({
			url : "board/list",
		  	type : "get",
		  	dataType : "json",
		  	success : makeView,
		  	error : function() {
		  		alert("error");
		  	}
		});
	}
	
	function makeView(boardList) {
		console.log(boardList);
		let listHtml="<table class='table table-bordered'>";
			listHtml+="<thead>";	
	  	    listHtml+="<tr>";
	  	    listHtml+="<th>번호</th>";
	  	    listHtml+="<th>제목</th>";
	  	    listHtml+="<th>작성자</th>";
	  	    listHtml+="<th>작성일</th>";
		    listHtml+="<th>조회수</th>";
   	        listHtml+="</tr>";
	  	    listHtml+="</thead>";
	  	    
		/* 게시판 컬럼 표시 여부 : [brd_idx]O [brd_Title]O [brd_Indate]O [brd_Count]O  / [brd_Content]X */
		/* 작성자[mem_Name]은 회원 테이블과 JOIN하여 조회 */
  	    $.each(boardList, function(index, board) {
			listHtml+="<tbody>";
  	    	listHtml+="<tr>";
 	  	    listHtml+="<td>"+board.brdIdx+"</td>";			/* 게시물 제목 클릭 시, 게시판 번호 전달하여 상세페이지 open  */
  	    	listHtml+="<td id='boardTitle"+board.brdIdx+"'><a href='javascript:boardCountAndContent(" + board.brdIdx + ")'>" + board.brdTitle + "</a></td>";
  	    										/* board.member.memIdx(FK)를 전달 -> 회원 + 권한 join에 필요 */
  	    										/* 문제점 : 자바스크립트 함수 호출 시, 문자열로 값 넘기는 것은 좋지 않다. -> 숫자로 전달하자. */
  	        listHtml+="<td> <a href='javascript:getMember(" + board.member.memIdx + ")'>" + board.member.memName + "</a> </td>";
  	        	/* indate = 2023-12-18 12:34:33 문자열 -> 자바스크립트 문자열 자르기 */
  	        	/* 문자열 자르기 방법1 substr(시작위치, 길이); */
  	        	/* 문자열 자르기 방법2 split(' ')[0] : 2023-12-18 19:12:33 -> 공백을 기준으로 앞[0], 뒤[1] */
  	        listHtml+="<td>"+board.brdIndate.substr(0, 16)+"</td>";
  	        listHtml+="<td id='boardCount"+board.brdIdx+"'>"+board.brdCount+"</td>";
  	        listHtml+="</tr>";
  	        
  	        									/* 상세페이지 초기상태 : "display: none" */
            listHtml+="<tr id='content" + board.brdIdx + "' style='display: none'>";
    	    listHtml+="<td>내용</td>";
    	    listHtml+="<td colspan='4'>";
    	    listHtml+="<textarea id='textArea"+board.brdIdx+"' readonly rows='7' class='form-control'> </textarea>";
	    	listHtml+="<br/>";
	    	
	    	/* 로그인을 한 경우와 하지 않은 경우 */
	    	if(${!empty user}) {
	    		/* 로그인을 했는데, ADMIN인 경우와 AMDIN이 아닌 경우 */
	    		if(${fn:contains(authList, 'ROLE_ADMIN')}) {
	    			/* 로그인을 하고, AMDIN이고, 내 글인 경우와 내 글이 아닌 경우 */
	    			if("${user.member.memID}" == board.member.memID) {
						listHtml+="<span id='updateBtn"+board.brdIdx+"'><button class='btn btn-primary btn-sm' onclick='boardUpdateForm("+board.brdIdx+")'>수정화면</button></span>&nbsp;"; /* nbsp; : 공백 */
						listHtml+="<button class='btn btn-warning btn-sm' onclick='boardDelete("+board.brdIdx+")'>삭제</button>&nbsp;";
						listHtml+="<button class='btn btn-info btn-sm' onclick='boardList()'>리스트로</button>";
	    			} else {
						listHtml+="<span id='updateBtn"+board.brdIdx+"'><button disabled class='btn btn-primary btn-sm' onclick='boardUpdateForm("+board.brdIdx+")'>수정화면</button></span>&nbsp;";
						listHtml+="<button class='btn btn-warning btn-sm' onclick='boardDelete("+board.brdIdx+")'>삭제</button>&nbsp;";
						listHtml+="<button class='btn btn-info btn-sm' onclick='boardList()'>리스트로</button>";
	    			}
	    		} else {
	    			/* 로그인을 하고, ADMIN이 아니고, 내 글인 경우와 내 글이 아닌 경우*/
	    			if("${user.member.memID}" == board.member.memID) {
						listHtml+="<span id='updateBtn"+board.brdIdx+"'><button class='btn btn-primary btn-sm' onclick='boardUpdateForm("+board.brdIdx+")'>수정화면</button></span>&nbsp;";
						listHtml+="<button class='btn btn-warning btn-sm' onclick='boardDelete("+board.brdIdx+")'>삭제</button>&nbsp;";
						listHtml+="<button class='btn btn-info btn-sm' onclick='boardList()'>리스트로</button>";
	    			} else {
						listHtml+="<span id='updateBtn"+board.brdIdx+"'><button disabled class='btn btn-primary btn-sm' onclick='boardUpdateForm("+board.brdIdx+")'>수정화면</button></span>&nbsp;";
						listHtml+="<button disabled class='btn btn-warning btn-sm' onclick='boardDelete("+board.brdIdx+")'>삭제</button>&nbsp;";
						listHtml+="<button class='btn btn-info btn-sm' onclick='boardList()'>리스트로</button>";
	    			}
	    		}
	    	} else {
			 	listHtml+="<span id='updateBtn"+board.brdIdx+"'><button disabled class='btn btn-primary btn-sm' onclick='boardUpdateForm("+board.brdIdx+")'>수정화면</button></span>&nbsp;";
				listHtml+="<button disabled class='btn btn-warning btn-sm' onclick='boardDelete("+board.brdIdx+")'>삭제</button>&nbsp;";
			 	listHtml+="<button class='btn btn-info btn-sm' onclick='boardList()'>리스트로</button>";
	    	}

	    	
    	    listHtml+="</td>";
    	    listHtml+="</tr>";
		}); /*반복문 끝*/
	  	    
	  	/* 로그인을 한 회원만 글쓰기 가능 */		
	  	if(${!empty user}) {
			listHtml+="<tr>";
			listHtml+="<td colspan='5'>";
																 	   /* 숨겨져있던 글쓰기 form 열기/닫기 */
			listHtml+="<button class='btn btn-primary btn-sm' onclick='openForm()'>글쓰기</button>";
			listHtml+="<button class='btn btn-warning btn-sm' onclick='closeForm()'>닫기</button>";
			listHtml+="</td>";
			listHtml+="</tr>";
	  	}
	  	    
  	    listHtml+="</tbody>";
	 	listHtml+="</table>";
	 	$("#viewList").html(listHtml);
	 	
     	/* boardList() 호출 시, 항상 글쓰기 form은 감춰야한다. */
	 	closeForm();
	}
  
	/* 회원 간단 조회 절차
	  		1. memIdx로 특정 [회원 + 권한] JOIN으로 조회하기.
	  		2. 권한은 authList에 담겨있으니, 반복문으로 추출할 것.
	  		3. modal창에 정보를 출력. */
	function getMember(memIdx) {
		$.ajax({
			url : "member/" + memIdx,
			type : "get",
			dataType : "JSON",
	        success : function(member) {
	        	let str = "<span> <b>회원 권한</b> : ";
	        	let picture = "";
		            for(let i = 0; i< member.authList.length; i++) {
		            	let authType = member.authList[i].authType;
		            	str += authType;
		            	str += " ";
		            }
	          	str += "</br> <b>회원 아이디</b> : ";
	          	str += member.memID;
	          	str += "</br></br> <b>회원 성별</b> : ";
	          	str += member.memGender;
	          	str += "</br> <b>회원 이메일</b> : ";
	          	str += member.memEmail;
	          	
	          	/* 로그인을 한 경우, 글 작성자 사진 보여주기 */
		    	if(${!empty user}) {
		          	str += "</br></br> <b>회원 사진</b> </br>";
		          	str += "</span>";
		          	/* 사진 없는 경우  */
		          	if(member.memProfile == "") {
			          	picture += "<img src='${contextPath}/resources/images/basicProfile.jpeg' style='width: 300px; height: 300px;'/>";
		          	} else {
			          	picture += "<img src='${contextPath}/resources/upload/"+member.memProfile+"' style='width: 300px; height: 300px;'/>";
		          	}
		    	} else {
		          	str += "</br></br> <b>회원 사진</b> </br>";
		          	str += "</span>";
		          	picture += "<img src='${contextPath}/resources/images/basicProfile.jpeg' style='width: 300px; height: 300px;'/>";
		    	}          	
	          	
			    $("#modalTitle").text("회원 정보");
	            $("#modalContent").html(str);
	            $("#modalPicture").html(picture);
	            $("#myModal").modal("show");
			    },
			    error : function() {
			  	alert("error");
			    }
		    });
		}
	
	/* 게시판 조회수 1 증가 직후, 게시판 상세보기 */
	function boardCountAndContent(brdIdx) {
 		  if($("#content" + brdIdx).css("display")=="none") {
 			$.ajax({
 				url : "board/count/content/"+brdIdx,
 				type : "put",
 	 			beforeSend: function(xhr){
 					xhr.setRequestHeader(csrfHeaderName, csrfTokenValue)
 				},
 				success : function(board) {
					        $("#textArea"+board.brdIdx).val(board.brdContent);
							$("#boardCount"+board.brdIdx).text(board.brdCount);
				 	    	$("#content"+board.brdIdx).css("display","table-row");
						},
				error : function () {
				        	alert("error");
				        }
				});
 		  } else {
 		    $("#content" + brdIdx).css("display","none");
 			$("#textArea" + brdIdx).attr("readonly", true);
 		  }
	}
	
/* 기존코드(중첩ajax) : 게시판 조회수 1 증가 직후, 게시판 상세보기 */
/* 	function boardCountAndContent(brdIdx) {
 		  if($("#content" + brdIdx).css("display")=="none") {
 			$.ajax({
 				url : "board/count/"+brdIdx,
 				type : "put",
 	 			beforeSend: function(xhr){
 					xhr.setRequestHeader(csrfHeaderName, csrfTokenValue)
 				},
 				success : function() {
					$.ajax({
						url : "board/content/" + brdIdx,
						type : "get",
						dataType : "json",
						success : function(board) {
					        $("#textArea"+board.brdIdx).val(board.brdContent);
							$("#boardCount"+board.brdIdx).text(board.brdCount);
				 	    	$("#content"+board.brdIdx).css("display","table-row");
						},
				        error : function () {
				        	alert("error");
				        }
					});
 				},
 			  	error : function() { alert("error"); }
 		    });
 		  } else {
 		    $("#content" + brdIdx).css("display","none");
 			$("#textArea" + brdIdx).attr("readonly", true);
 		  }
	}
*/
   	
	/* ajax POST(GET 제외한 모든 방식) CSRF 토큰 */
	var csrfHeaderName = "${_csrf.headerName}";
	var csrfTokenValue = "${_csrf.token}";
  
	/* 수정화면버튼 클릭 이벤트 : 1)textarea readonly false로 변경 2) 제목 input으로 변경 3)수정하기버튼으로 변경   */
	function boardUpdateForm(brdIdx) {
		/* 1)textarea readonly false로 변경 */
 	    $("#textArea" + brdIdx).attr("readonly", false);
 	    
 	    /* 2) 제목 input으로 변경 */
 	    const titleValue = $("#boardTitle" + brdIdx).text(); //text() : board.title 값 가져오기 
 	    const newInput = "<input type='text' id='newTitle"+brdIdx+"' class='form-control' value='"+titleValue+"' />";
 	    $("#boardTitle" + brdIdx).html(newInput);
		
 	    /* 3)수정화면버튼 -> 수정하기버튼으로 변경 */
	    const updateBtn = "<button class='btn btn-primary btn-sm' onclick='boardUpdate("+brdIdx+")'> 수정하기 </button>";
 	    $("#updateBtn"+brdIdx).html(updateBtn);
	}
		
	/* 여러 개의 데이터를 넘길때 주의  */
	/* 1. JSON 형태로 변경해서 보낸다. contentType, JSON.stringify()
	   2. Controller에서는, @RequestBody */
	/* 게시글 수정하기 */
	function boardUpdate(brdIdx) {
		/* 수정된 title, content 값 가져오기 */	
		const newTitle = $("#newTitle"+brdIdx).val();
		const newContent = $("#textArea"+brdIdx).val();
			
		$.ajax({ 
			url : "board/update",
			type : "put",
			beforeSend: function(xhr){ 
			xhr.setRequestHeader(csrfHeaderName, csrfTokenValue)
			},
			contentType : 'application/json;charset=utf-8',
			data : JSON.stringify({"brdIdx" : brdIdx, "brdTitle" : newTitle, "brdContent" : newContent}),
			success : boardList,
			error : function() { alert("error"); }
		});
	}
	
	/* get, post, put(patch), delete */
	/* 게시글 삭제하기 */
	function boardDelete(brdIdx) {
		$.ajax({
			url : "board/" + brdIdx,
			type : "delete",
			beforeSend: function(xhr){ 
			xhr.setRequestHeader(csrfHeaderName, csrfTokenValue)
			},
			success : boardList,
			error : function() { alert("error"); }
		});
	}
	
  	function openForm(){
 	    $("#writeForm").css("display","block");
	}
  	function closeForm(){
 	    $("#writeForm").css("display","none");
	}
  	  	
  /* 게시글 등록 */
	function boardInsert() {
		/* 사용자가 입력한 form의 값 가져오기  val()*/ 
		const brdTitle = $("#brdTitle").val();
		const brdContent = $("#brdContent").val();
		const memIdx = $("#memIdx").val(); 
		
		if(brdTitle == '') {
			$("#modalTitle").text("글 등록 실패");
			$("#modalContent").html("<span style='color: red;'> 제목을 입력해주세요 </span>");
			$("#myModal").modal("show");
			
			return;
		}
		
		if(brdContent == '') {
			$("#modalTitle").text("글 등록 실패");
			$("#modalContent").html("<span style='color: red;'> 내용을 입력해주세요 </span>");
			$("#myModal").modal("show");
			
			return;
		}
		
		/* 	ajax에서 데이터 보낼 때, Board의 Member 참조 : member.memIdx로 접근 */
		$.ajax({
			url : "board/new",
			type : "post",
			data : JSON.stringify({
					 "brdTitle" : brdTitle, 
					 "brdContent" : brdContent, 
					 "member" : {
				     	"memIdx" : memIdx
				     }
				   }),
			contentType : 'application/json;charset=utf-8',
			beforeSend: function(xhr){
				xhr.setRequestHeader(csrfHeaderName, csrfTokenValue)
			},
			/* 콜백함수로 boardList() -> 새롭게 작성된 게시글 조회 */
			success : boardList,
			error : function() {
				alert("error");
			}
		});
		
	/* form태그에 입력된 값 초기화 방법 2가지 */
	/* 방법 1 : val("");
	$("#title").val("");
	$("#content").val("");
	$("#writer").val(""); */
	
	/* 방법 2 : reset button 클릭 이벤트 발생시키기 */
	$("#formClear").trigger("click");
	}
		
</script>
</head>

<body>

<jsp:include page="../common/header.jsp"/>
 
<div class="container">
  <h2>회원 게시판</h2>
  <div class="panel panel-default">
    <div class="panel-heading">BOARD</div>
    
    <!-- 초기상태 : display: block-->
    <div class="panel-body" id="viewList" style="display: block"> viewList </div>
    
    <!-- 초기상태 : display: none-->
    <div class="panel-body" id="writeForm" style="display: none">
	 <form id="frm">
	  <!--로그인 한 회원의 Idx 전송 : boardInsert쿼리문에서 필요!(참조키 무결성:자식테이블의 fk값=부모테이블의 pk값)-->
      <input type="hidden" id="memIdx" name="memIdx" value="${user.member.memIdx}" />
      <table class="table">
         <tr>
           <td>제목</td>
           <td><input type="text" id="brdTitle" name="brdTitle" class="form-control"/></td>
         </tr>
         
         <tr>
           <td>내용</td>
           <td><textarea rows="7" class="form-control" id="brdContent" name="brdContent"></textarea> </td>
         </tr>
         
         <tr>
           <td>작성자</td>
           																	     	<!-- 로그인을 한 회원의 정보 추출 -->
           <td><input type="text" id="memName" name="memName" class="form-control" value="${user.member.memName}" readonly/></td>
         </tr>
         
         <tr>
           <td colspan="2" align="center">
               <button type="button" class="btn btn-success btn-sm" onclick="boardInsert()">등록</button>
               <button type="reset" class="btn btn-warning btn-sm" id="formClear">취소</button>
			   <button type="button" class="btn btn-info btn-sm" onclick="closeForm()">리스트로</button>
 		   </td>
         </tr>
      </table>
     </form>	    
    </div>
    
    <jsp:include page="../common/modal.jsp"/>
    
    <div class="panel-footer">ainokks071@gmail.com</div>
  </div>
</div>

</body>
</html>