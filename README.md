# :white_check_mark: 김경수의 포트폴리오
> ㅇㅇㅇ

</br>

## :pushpin: Intro
(여기에 자기소개)

</br>

## :pushpin: Contact
- 이메일 : ainokks071@gamil.com
- 블로그 : https://velog.io/@ainokks071/posts
- 깃헙 : https://github.com/ainokks071
 
</br>

## :pushpin: Project

>간략 소개 : 회원 전용 게시판 (개인 프로젝트)
>
>개발 기간 : 2023.10.1 ~ 2024.1.27
>
>기술 스택 :
>
>Java 11 / Spring Framework / Maven / MyBatis / MySQL / Spring Security / JSP
>
>html / css / bootstrap / JavaScript / JQuery / ajax
>

</br>


# :white_check_mark: 회원 전용 게시판

> 회원가입을 할 때 3개의 권한(User, Manager, Admin)을 다중으로 선택할 수 있습니다.
> 로그인 여부 및 회원 권한에 따라 게시글 조회, 등록, 수정, 삭제의 기능을 차등적으로 이용할 수 있습니다.
> 로그인을 한 회원은 사진을 업로드할 수 있으며, 사진은 다른 회원에게 보여집니다.

</br>

## 1. 제작 기간 & 참여 인원

> 2019년 2월 18일 ~ 4월 5일
> 개인 프로젝트

</br>

## 2. 사용 기술

> Java 8 / Spring Boot 2.3 / Gradle / Spring Data JPA / QueryDSL
>
> H2 / MySQL 5.7 / Spring Security / Jsoup / Vue.js 3.0 / Element UI

</br>

## 3. ERD 및 Entity

![image](https://github.com/ainokks071/portfolio/assets/140647727/2ffaf32e-58ca-49d2-91cd-36bd8e94780c)

</br>

## 5. 주요 기능

### 5.1. 회원가입
#### :pushpin: 전체 흐름
![image](https://github.com/ainokks071/portfolio/assets/140647727/5c06d1d1-a900-4975-9597-4039a9d2142e)
#### :pushpin: 코드 확인
[signUpForm.jsp](https://github.com/ainokks071/portfolio/blob/0eb28c7e05427bf6f6f0ae3295a3440ff50dcb9c/AuthorityBoard/src/main/webapp/WEB-INF/views/member/signUpForm.jsp#L1-L230) &rarr; 
[MemberController](https://github.com/ainokks071/portfolio/blob/0eb28c7e05427bf6f6f0ae3295a3440ff50dcb9c/AuthorityBoard/src/main/java/kr/bit/controller/MemberController.java#L46-L59) &rarr; 
[MemberServiceIml](https://github.com/ainokks071/portfolio/blob/0eb28c7e05427bf6f6f0ae3295a3440ff50dcb9c/AuthorityBoard/src/main/java/kr/bit/service/MemberServiceImpl.java#L57-L130) &rarr; 
[MemberMapper](https://github.com/ainokks071/portfolio/blob/0eb28c7e05427bf6f6f0ae3295a3440ff50dcb9c/AuthorityBoard/src/main/java/kr/bit/mapper/MemberMapper.java#L23-L27) &rarr;
[MemberMapper.xml](https://github.com/ainokks071/portfolio/blob/0eb28c7e05427bf6f6f0ae3295a3440ff50dcb9c/AuthorityBoard/src/main/java/kr/bit/mapper/MemberMapper.xml#L60-L71)

</br>

#### :pushpin: 실행화면
<details><summary><b>상세 보기</b></summary>
<div markdown="1">
	
![image](https://github.com/ainokks071/portfolio/assets/140647727/fbd0ecaa-d6c7-44af-8016-4ecad3b2c472)
- ajax를 이용하여 ID 중복여부를 확인합니다.
- 비밀번호 일치여부를 확인합니다.
- User, Manager, Admin 중 권한을 선택합니다. 권한은 다중 선택이 가능합니다.
</div>
</details>
</br>

---

### 5.2. Spring Security를 활용한 로그인/로그아웃
#### :pushpin: 전체 흐름
![image](https://github.com/ainokks071/portfolio/assets/140647727/50b2c280-3574-4d4d-9f8d-24b7dfda431f)
#### :pushpin: 코드 확인
[signUpForm.jsp](https://github.com/ainokks071/portfolio/blob/0eb28c7e05427bf6f6f0ae3295a3440ff50dcb9c/AuthorityBoard/src/main/webapp/WEB-INF/views/member/signUpForm.jsp#L1-L230) &rarr; 
[MemberController](https://github.com/ainokks071/portfolio/blob/0eb28c7e05427bf6f6f0ae3295a3440ff50dcb9c/AuthorityBoard/src/main/java/kr/bit/controller/MemberController.java#L46-L59) &rarr; 
[MemberServiceIml](https://github.com/ainokks071/portfolio/blob/0eb28c7e05427bf6f6f0ae3295a3440ff50dcb9c/AuthorityBoard/src/main/java/kr/bit/service/MemberServiceImpl.java#L57-L130) &rarr; 
[MemberMapper](https://github.com/ainokks071/portfolio/blob/0eb28c7e05427bf6f6f0ae3295a3440ff50dcb9c/AuthorityBoard/src/main/java/kr/bit/mapper/MemberMapper.java#L23-L27) &rarr;
[MemberMapper.xml](https://github.com/ainokks071/portfolio/blob/0eb28c7e05427bf6f6f0ae3295a3440ff50dcb9c/AuthorityBoard/src/main/java/kr/bit/mapper/MemberMapper.xml#L60-L71)

</br>

#### :pushpin: 실행화면
<details><summary><b>상세 보기</b></summary>
<div markdown="1">
	
![image](https://github.com/ainokks071/portfolio/assets/140647727/825b9d80-9476-4278-8fbd-50c585d67b8e)
- ajax를 이용하여 ID 중복여부를 확인합니다.
- 비밀번호 일치여부를 확인합니다.
- User, Manager, Admin 중 권한을 선택합니다. 권한은 다중 선택이 가능합니다.
</div>
</details>
</br>

---

### 5.3. 회원정보 및 권한 수정
#### :pushpin: 전체 흐름
![image](https://github.com/ainokks071/portfolio/assets/140647727/1e6becff-d790-4f18-8c0a-3d28809180e6)


#### :pushpin: 코드 확인
[signUpForm.jsp](https://github.com/ainokks071/portfolio/blob/0eb28c7e05427bf6f6f0ae3295a3440ff50dcb9c/AuthorityBoard/src/main/webapp/WEB-INF/views/member/signUpForm.jsp#L1-L230) &rarr; 
[MemberController](https://github.com/ainokks071/portfolio/blob/0eb28c7e05427bf6f6f0ae3295a3440ff50dcb9c/AuthorityBoard/src/main/java/kr/bit/controller/MemberController.java#L46-L59) &rarr; 
[MemberServiceIml](https://github.com/ainokks071/portfolio/blob/0eb28c7e05427bf6f6f0ae3295a3440ff50dcb9c/AuthorityBoard/src/main/java/kr/bit/service/MemberServiceImpl.java#L57-L130) &rarr; 
[MemberMapper](https://github.com/ainokks071/portfolio/blob/0eb28c7e05427bf6f6f0ae3295a3440ff50dcb9c/AuthorityBoard/src/main/java/kr/bit/mapper/MemberMapper.java#L23-L27) &rarr;
[MemberMapper.xml](https://github.com/ainokks071/portfolio/blob/0eb28c7e05427bf6f6f0ae3295a3440ff50dcb9c/AuthorityBoard/src/main/java/kr/bit/mapper/MemberMapper.xml#L60-L71)
</br>

#### :pushpin: 실행화면
<details><summary><b>상세 보기</b></summary>
<div markdown="1">
	
![image](https://github.com/ainokks071/portfolio/assets/140647727/825b9d80-9476-4278-8fbd-50c585d67b8e)
- 로그인을 한 상태에서 회원 정보 및 권한 정보 수정을 진행합니다.
- 수정에 성공하면, 수정된 회원객체를 Security Context Holder에 새롭게 객체바인딩을 합니다.
- 
</div>
</details>
</br>

---

### 5.4. cos.jar 라이브러리를 이용한 파일 업로드
#### :pushpin: 전체 흐름
![image](https://github.com/ainokks071/portfolio/assets/140647727/28357549-f3de-4958-9ea5-e153ea0d6b2e)


#### :pushpin: 코드 확인
[signUpForm.jsp](https://github.com/ainokks071/portfolio/blob/0eb28c7e05427bf6f6f0ae3295a3440ff50dcb9c/AuthorityBoard/src/main/webapp/WEB-INF/views/member/signUpForm.jsp#L1-L230) &rarr; 
[MemberController](https://github.com/ainokks071/portfolio/blob/0eb28c7e05427bf6f6f0ae3295a3440ff50dcb9c/AuthorityBoard/src/main/java/kr/bit/controller/MemberController.java#L46-L59) &rarr; 
[MemberServiceIml](https://github.com/ainokks071/portfolio/blob/0eb28c7e05427bf6f6f0ae3295a3440ff50dcb9c/AuthorityBoard/src/main/java/kr/bit/service/MemberServiceImpl.java#L57-L130) &rarr; 
[MemberMapper](https://github.com/ainokks071/portfolio/blob/0eb28c7e05427bf6f6f0ae3295a3440ff50dcb9c/AuthorityBoard/src/main/java/kr/bit/mapper/MemberMapper.java#L23-L27) &rarr;
[MemberMapper.xml](https://github.com/ainokks071/portfolio/blob/0eb28c7e05427bf6f6f0ae3295a3440ff50dcb9c/AuthorityBoard/src/main/java/kr/bit/mapper/MemberMapper.xml#L60-L71)

</br>

#### :pushpin: 실행화면
<details><summary><b>상세 보기</b></summary>
<div markdown="1">
	
![image](https://github.com/ainokks071/portfolio/assets/140647727/825b9d80-9476-4278-8fbd-50c585d67b8e)
- 로그인을 한 상태에서 회원 정보 및 권한 정보 수정을 진행합니다.
- 수정에 성공하면, 수정된 회원객체를 Security Context Holder에 새롭게 객체바인딩을 합니다.
- 
</div>
</details>
</br>

---

### 5.5. Ajax/JSON을 활용한 게시판 CRUD

#### :pushpin: 기능 소개

<ul>
  <li>ajax를 이용해서 페이지의 이동 없이 CRUD를 할 수 있는 게시판입니다.</li>
  <li>회원가입과 로그인을 해야 글을 작성하고 수정하고 삭제할 수 있는 게시판입니다.</li>
  <li>로그인을 한 회원은 자신의 글만 수정 및 삭제가 가능하며, ADMIN 권한을 지닌 관리자는 모든 글을 삭제할 수 있습니다.</li>
  <li>게시된 글을 선택.</li>
</ul>

#### :pushpin: 전체 흐름
![image](https://github.com/ainokks071/portfolio/assets/140647727/37a8660a-d553-437a-a47f-97f12d4f0012)



#### :pushpin: 코드 확인
[signUpForm.jsp](https://github.com/ainokks071/portfolio/blob/0eb28c7e05427bf6f6f0ae3295a3440ff50dcb9c/AuthorityBoard/src/main/webapp/WEB-INF/views/member/signUpForm.jsp#L1-L230) &rarr; 
[MemberController](https://github.com/ainokks071/portfolio/blob/0eb28c7e05427bf6f6f0ae3295a3440ff50dcb9c/AuthorityBoard/src/main/java/kr/bit/controller/MemberController.java#L46-L59) &rarr; 
[MemberServiceIml](https://github.com/ainokks071/portfolio/blob/0eb28c7e05427bf6f6f0ae3295a3440ff50dcb9c/AuthorityBoard/src/main/java/kr/bit/service/MemberServiceImpl.java#L57-L130) &rarr; 
[MemberMapper](https://github.com/ainokks071/portfolio/blob/0eb28c7e05427bf6f6f0ae3295a3440ff50dcb9c/AuthorityBoard/src/main/java/kr/bit/mapper/MemberMapper.java#L23-L27) &rarr;
[MemberMapper.xml](https://github.com/ainokks071/portfolio/blob/0eb28c7e05427bf6f6f0ae3295a3440ff50dcb9c/AuthorityBoard/src/main/java/kr/bit/mapper/MemberMapper.xml#L60-L71)

</br>

#### :pushpin: 실행화면
<details><summary><b>상세 보기</b></summary>
<div markdown="1">
	
![image](https://github.com/ainokks071/portfolio/assets/140647727/0ea044fe-c592-41c2-ba13-2f0ccd7f7932)

- 로그인을 한 상태에서 회원 정보 및 권한 정보 수정을 진행합니다.
- 수정에 성공하면, 수정된 회원객체를 Security Context Holder에 새롭게 객체바인딩을 합니다.
- 
</div>
</details>
</br>



## 6. 트러블 슈팅
> - MyBatis로 진행한 프로젝트이지만, 최근에 JPA를 학습하면서 ManyToOne, OneToMany의 차이점에 대해 분석했습니다.
- Member(회원)과 Authority(권한) 엔티티를 OneToMany관계로 설계했을 때와 ManyToOne관계로 설계했을 때, CRUD 작업 시 어떠한 차이점이 있는지 면밀히 따져볼 수 있었습니다.
- 본 프로젝트는 Board(게시판)과 Member(회원)은 ManyToOne, Member(회원)과 Authority(권한)은 OneToMany로 설계하였습니다.

>1. 회원 테이블(부모 테이블), 권한(자식 테이블)(1452): Cannot add or update a child row: a foreign key constraint 참조테이블에 없는 값을 추가해서 발생한 오류
참조 무결성에 따라서 부모키에 해당하는 값만 넣을 수 있음.
참조하는 테이블에 데이터를 먼저 추가한 후, 참조받는 테이블에 데이터를 추가하니 오류해결.
외래키로 연결한 값을 동일하게 줘야함)
즉, 내가 삽입한 user_id=2라는 유저가 없기때문에 참조하는 user테이블에 없는 값을 추가해서 발생한 오류이다. 

user_id=2인 테이터를 넣고 싶다면 참조하는 테이블인 user에 해당 데이터를 먼저 추가한 뒤, 참조받는 테이블에 데이터를 추가하면 오류가 해결된다. (외래키로 연결한 값을 동일하게 해줘야 한다!!)
방금 회원가입을 한 회원의 memIdx를 권한 테이블(자식테이블)에 동일한 값으로 초기화해줘야 한다.(참조 무결성)
>2. //			트러블슈팅 : signUpForm에서 권한체크 안한 항목은 null로 들어오기 때문에, 반드시 null체크 해줘야한다!
//			### SQL: insert into authority(memID, auth)     values(?, ?)
//			### Cause: java.sql.SQLIntegrityConstraintViolationException:
AuthDTO(authIdx, authNum, authType, memIdx) : 권한 체크 하지 않으면, authType == null
Column 'auth_Type' cannot be null
>
>3. 	  const memGender = $("input[name=memGender]:radio:checked").length < 1
	  
	  const auth1 = $('input:checkbox[id="auth1"]').is(":checked");
	  const auth2 = $('input:checkbox[id="auth2"]').is(":checked");
	  const auth3 = $('input:checkbox[id="auth3"]').is(":checked");
Failed to convert value of type 'java.lang.String' to required type 'int'; nested exception is java.lang.NumberFormatException: For input string:
> 4. <!--  회원, 권한 수정 (1452): Cannot add or update a child row: a foreign key constraint fails 
참조테이블에 없는 값을 추가해서 발생한 오류
참조 무결성에 따라서 부모키에 해당하는 값만 넣을 수 있음.
 
참조하는 테이블에 데이터를 먼저 추가한 후, 참조받는 테이블에 데이터를 추가하니 오류해결.
(외래키로 연결한 값을 동일하게 줘야함)  -->

> 5. //		### Cause: java.sql.SQLIntegrityConstraintViolationException: Column 'auth_Type' cannot be null
null체크 하지 않고, insert
> ㅇㅇㅇ
>6. //		ERROR 1452: 1452: Cannot add or update a child row: a foreign key constraint fails
//	 	부모 - 자식 테이블에 데이터가 있는데, 부모 테이블에 삭제, 추가 하려고 하면 에러난다. 
> ㅇㅇㅇ<!--   (1452): Cannot add or update a child row: a foreign key constraint fails 
참조테이블에 없는 값을 추가해서 발생한 오류
참조 무결성에 따라서 부모키에 해당하는 값만 넣을 수 있음.
 
참조하는 테이블에 데이터를 먼저 추가한 후, 참조받는 테이블에 데이터를 추가하니 오류해결.
(외래키로 연결한 값을 동일하게 줘야함)  -->
> 7. //			트러블슈팅 : NullPointerException!! ->  MemberDTO는 resultMap으로 설정되어 있어서, resultTye = resultMap! 따라서, null 반환!
> 	<select id="getMember" parameterType="Integer" resultMap="memberMap">
		SELECT * FROM member WHERE mem_Idx = #{mem_Idx}
	</select>
> 8.		} catch (IOException e) {
//			파일 크기 10mb 이상일 경우 ?
//			java.io.IOException: Posted content length of 11787364 exceeds limit of 10485760
			e.printStackTrace();
			rattr.addFlashAttribute("msg3", "파일 업로드 오류");
			rattr.addFlashAttribute("msg4", "파일의 크기는 10MB를 초과할 수 없습니다.");
//			톰캣의 server.xml에 추가 -> maxswallowSize -1 -> 한계치까지는 업로드 해본다.
//			<Connector connectionTimeout="20000" maxParameterCount="1000" port="8080" protocol="HTTP/1.1" redirectPort="8443" maxSwallowSize="-1"/>

> 9. 		/* 	트러블 슈팅 : ajax에서 데이터 보낼 때, 객체 변수의 필드접근! xml에서 member.memIdx */
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
> //	@RequestBody : JSON 형태로 넘어오는 데이터 받는다 -> 생략 불가능 !
//	<!-- 트러블 슈팅1. : ajax에서 데이터 보낼 때, 객체 변수(Member member)의 필드접근! #{member.memIdx}!!-->
//	<!-- 트러블 슈팅2. : ajax에서 데이터 보낼 때, ajax구조,형태 ! {} {} {}.. 
//	<!-- 트러블 슈팅3. : @RequestBody만 적으면 안됨! void이더라도 @ResponseBody !!!!!!! -> 해결!! -> Not Found 404 뜬다.

>  <!-- 트러블 슈팅 : parsing error 아니 도대체 왜 조인을 해야만 success가 될까???? BoadrDTO가 resultMape으로 설정되어있어서?
				값이 넘어오지 않는다. 처음엔 프론트단에서 ajax문제일거라 생각 -> DB문제(sql문제) !!!-->
<!--<select id="boardContent" parameterType="Integer" resultType="kr.bit.entity.BoardDTO">
		SELECT * FROM board WHERE brd_Idx = #{brdIdx}
  	</select>  -->
>



</br>




## 7. 회고 및 향후 계획

> ㅇㅇㅇ
>
> ㅇㅇㅇ
>
> ㅇㅇㅇ
>
> ㅇㅇㅇ
>
> ㅇㅇㅇ
