# :white_check_mark: 김경수의 포트폴리오

## :pushpin: Intro
> "모든 것은 기본에서 시작한다."라는 말을 좋아합니다.
> 축구선수가 매일 기본기 훈련인 달리기, 패스, 슈팅연습을 하듯이
> 개발자 역시 끊임없는 사고, 문제해결을 위한 고민, 팀원들과의 협업이 기본기일 것이라 생각합니다.
> 하루하루 지치지 않고 기본기 훈련으로 훗날 멋진 개발자가 되고 싶습니다.

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

## 1. ERD 및 Entity

![image](https://github.com/ainokks071/portfolio/assets/140647727/2ffaf32e-58ca-49d2-91cd-36bd8e94780c)

</br>

## 2. 주요 기능

### 2.1. Ajax/JSON을 활용한 게시판 CRUD

#### :pushpin: 간략 소개

<ul>
  <li>ajax를 이용하여 페이지의 이동 없이 CRUD를 할 수 있는 게시판입니다.</li>
  <li>게시물은 Board, Member를 Join하여 조회하였고, 회원은 Member와 Authority를 Join하여 조회하였습니다.</li>
  <li>로그인을 한 회원은 자신의 글만 수정 및 삭제가 가능하며, ADMIN 권한을 지닌 관리자는 모든 글을 삭제할 수 있습니다.</li>
  <li>게시글 작성자의 기본 정보 및 업로드한 사진을 조회할 수 있습니다. </li>
</ul>

#### :pushpin: 전체 흐름
![image](https://github.com/ainokks071/portfolio/assets/140647727/66119044-20aa-4464-a5e5-262be46c04d1)

#### :pushpin: 코드 확인
[board.jsp](https://github.com/ainokks071/portfolio/blob/0aa7410b96933d5c27d2f3874442399c70e8c914/AuthorityBoard/src/main/webapp/WEB-INF/views/board/board.jsp#L11-L404) &rarr; 
[BoardController](https://github.com/ainokks071/portfolio/blob/0aa7410b96933d5c27d2f3874442399c70e8c914/AuthorityBoard/src/main/java/kr/bit/controller/BoardController.java#L22-L65) &rarr; 
[BoardServiceIml](https://github.com/ainokks071/portfolio/blob/0aa7410b96933d5c27d2f3874442399c70e8c914/AuthorityBoard/src/main/java/kr/bit/service/BoardServiceImpl.java#L11-L47) &rarr; 
[BoardMapper](https://github.com/ainokks071/portfolio/blob/0aa7410b96933d5c27d2f3874442399c70e8c914/AuthorityBoard/src/main/java/kr/bit/mapper/BoardMapper.java#L10-L30) &rarr;
[BoardMapper.xml](https://github.com/ainokks071/portfolio/blob/0aa7410b96933d5c27d2f3874442399c70e8c914/AuthorityBoard/src/main/java/kr/bit/mapper/BoardMapper.xml#L6-L62)

</br>

#### :pushpin: 실행화면
<details><summary><b>상세 보기</b></summary>
<div markdown="1">
	
![image](https://github.com/ainokks071/portfolio/assets/140647727/8a3eef88-fe51-4b25-8833-7a6daed05259)

</div>
</details>
</br>

---

### 2.2. 회원가입
#### :pushpin: 간략 소개
<ul>
  <li>회원가입 시 아이디 중복확인, 비밀번호 일치여부를 확인합니다.</li>
  <li>입력 누락, 아이디 중복여부 등의 유효성검사를 front와 server에서 각각 진행하였습니다.</li>
  <li>일대다, 다대다 관계의 학습을 위해 회원가입 시 권한은 여러개를 선택할 수 있도록 하였습니다.</li>
</ul>

#### :pushpin: 전체 흐름
![image](https://github.com/ainokks071/portfolio/assets/140647727/28e2dc59-dabe-4072-b10c-bb3680b9892a)
#### :pushpin: 코드 확인
[signUpForm.jsp](https://github.com/ainokks071/portfolio/blob/f57eaf1d05aa479e3a7f57e2634e53441a99b05c/AuthorityBoard/src/main/webapp/WEB-INF/views/member/signupForm.jsp#L8-L223) &rarr; 
[MemberController](https://github.com/ainokks071/portfolio/blob/f57eaf1d05aa479e3a7f57e2634e53441a99b05c/AuthorityBoard/src/main/java/kr/bit/controller/MemberController.java#L18-L47) &rarr; 
[MemberServiceIml](https://github.com/ainokks071/portfolio/blob/f57eaf1d05aa479e3a7f57e2634e53441a99b05c/AuthorityBoard/src/main/java/kr/bit/service/MemberServiceImpl.java#L24-L137) &rarr; 
[MemberMapper](https://github.com/ainokks071/portfolio/blob/f57eaf1d05aa479e3a7f57e2634e53441a99b05c/AuthorityBoard/src/main/java/kr/bit/mapper/MemberMapper.java#L9-L20) &rarr;
[MemberMapper.xml](https://github.com/ainokks071/portfolio/blob/f57eaf1d05aa479e3a7f57e2634e53441a99b05c/AuthorityBoard/src/main/java/kr/bit/mapper/MemberMapper.xml#L4-L22)

</br>

#### :pushpin: 실행화면
<details><summary><b>상세 보기</b></summary>
<div markdown="1">

![image](https://github.com/ainokks071/portfolio/assets/140647727/a98caaa5-f789-4445-acf6-179fdb481089)

</div>
</details>
</br>

---

### 2.3. Spring Security를 활용한 로그인/로그아웃
#### :pushpin: 간략 소개
<ul>
  <li>로그인 시 입력 누락, 회원 일치여부 등 유효성검사를 front와 server에서 각각 진행하였습니다.</li>
  <li>회원의 사진은 기본 프로필 사진으로 보여집니다.</li>
  <li>Member와 Authority를 Join으로 조회하여 배너에 회원의 이름과 권한 정보가 표시됩니다.</li>
</ul>

#### :pushpin: 전체 흐름
![image](https://github.com/ainokks071/portfolio/assets/140647727/d682c36e-179d-4eeb-a147-3be37fa5695f)

#### :pushpin: 코드 확인
[loginForm.jsp](https://github.com/ainokks071/portfolio/blob/b2ab2a0df84f62a1f993e5ac94661ac9308f3630/AuthorityBoard/src/main/webapp/WEB-INF/views/member/loginForm.jsp#L8-L66) &rarr; 
[UserDetailsServiceIml](https://github.com/ainokks071/portfolio/blob/b2ab2a0df84f62a1f993e5ac94661ac9308f3630/AuthorityBoard/src/main/java/kr/bit/service/UserDetailsServiceImpl.java#L15-L51) &rarr; 
[MemberMapper](https://github.com/ainokks071/portfolio/blob/b2ab2a0df84f62a1f993e5ac94661ac9308f3630/AuthorityBoard/src/main/java/kr/bit/mapper/MemberMapper.java#L22-L23) &rarr;
[MemberMapper.xml](https://github.com/ainokks071/portfolio/blob/b2ab2a0df84f62a1f993e5ac94661ac9308f3630/AuthorityBoard/src/main/java/kr/bit/mapper/MemberMapper.xml#L29-L32)

</br>

#### :pushpin: 실행화면
<details><summary><b>상세 보기</b></summary>
<div markdown="1">

![image](https://github.com/ainokks071/portfolio/assets/140647727/49846268-91c8-4c5a-b95e-f5316bc57409)

</div>
</details>
</br>

---

### 2.4. 회원정보 및 권한 수정
#### :pushpin: 간략 소개
<ul>
  <li>회원의 기본 정보와 권한 정보를 수정할 수 있습니다.</li>
  <li>변경된 회원 정보를 Security Context에 다시 Binding하여 로그인 상태를 유지하도록 하였습니다. </li>
  <li>권한의 수정은 delete쿼리로 모든 권한을 삭제한 후, insert쿼리로 다시 등록하였습니다.</li>
</ul>

#### :pushpin: 전체 흐름
![image](https://github.com/ainokks071/portfolio/assets/140647727/4c5f529d-60dd-4df0-9588-5bbfc4cbc1a0)

#### :pushpin: 코드 확인
[updateForm.jsp](https://github.com/ainokks071/portfolio/blob/b2ab2a0df84f62a1f993e5ac94661ac9308f3630/AuthorityBoard/src/main/webapp/WEB-INF/views/member/updateForm.jsp#L11-L202) &rarr; 
[MemberController](https://github.com/ainokks071/portfolio/blob/b2ab2a0df84f62a1f993e5ac94661ac9308f3630/AuthorityBoard/src/main/java/kr/bit/controller/MemberController.java#L51-L66) &rarr; 
[MemberServiceImpl](https://github.com/ainokks071/portfolio/blob/b2ab2a0df84f62a1f993e5ac94661ac9308f3630/AuthorityBoard/src/main/java/kr/bit/service/MemberServiceImpl.java#L141-L223), 
[UserDetailsServiceIml](https://github.com/ainokks071/portfolio/blob/b2ab2a0df84f62a1f993e5ac94661ac9308f3630/AuthorityBoard/src/main/java/kr/bit/service/MemberServiceImpl.java#L141-L223) &rarr; 
[MemberMapper](https://github.com/ainokks071/portfolio/blob/b2ab2a0df84f62a1f993e5ac94661ac9308f3630/AuthorityBoard/src/main/java/kr/bit/mapper/MemberMapper.java#L25-L27) &rarr;
[MemberMapper.xml](https://github.com/ainokks071/portfolio/blob/b2ab2a0df84f62a1f993e5ac94661ac9308f3630/AuthorityBoard/src/main/java/kr/bit/mapper/MemberMapper.xml#L34-L42)

</br>

#### :pushpin: 실행화면
<details><summary><b>상세 보기</b></summary>
<div markdown="1">

![image](https://github.com/ainokks071/portfolio/assets/140647727/7b49d6b9-e613-43ea-96ee-7abb39c25cd7)

</div>
</details>
</br>

---

### 2.5. cos.jar 라이브러리를 이용한 파일 업로드
#### :pushpin: 간략 소개
<ul>
  <li>회원가입 시 기본 이미지로 등록된 프로필 사진을 변경할 수 있습니다.</li>
  <li>회원정보 수정과 마찬가지로, 변경된 회원 정보를 Security Context에 다시 Binding하여 로그인 상태를 유지하도록 하였습니다. </li>
  <li>사진 업로드 직후 갱신된 사진이 배너에 보여지고, 게시판에서도 작성자 이름을 클릭하면 사진이 보여집니다.</li>
</ul>

#### :pushpin: 전체 흐름
![image](https://github.com/ainokks071/portfolio/assets/140647727/5a07e6af-4caa-4763-b495-5240e08d4c81)

#### :pushpin: 코드 확인
[imageForm.jsp](https://github.com/ainokks071/portfolio/blob/285c1ff6abd25817d287f22b52badbb1bebbba10/AuthorityBoard/src/main/webapp/WEB-INF/views/member/imageForm.jsp#L10-L90) &rarr; 
[MemberController](https://github.com/ainokks071/portfolio/blob/285c1ff6abd25817d287f22b52badbb1bebbba10/AuthorityBoard/src/main/java/kr/bit/controller/MemberController.java#L68-L75) &rarr; 
[MemberServiceIml](https://github.com/ainokks071/portfolio/blob/285c1ff6abd25817d287f22b52badbb1bebbba10/AuthorityBoard/src/main/java/kr/bit/service/MemberServiceImpl.java#L225-L302), 
[UserDetailsServiceIml](https://github.com/ainokks071/portfolio/blob/b2ab2a0df84f62a1f993e5ac94661ac9308f3630/AuthorityBoard/src/main/java/kr/bit/service/MemberServiceImpl.java#L141-L223) &rarr; 
[MemberMapper](https://github.com/ainokks071/portfolio/blob/285c1ff6abd25817d287f22b52badbb1bebbba10/AuthorityBoard/src/main/java/kr/bit/mapper/MemberMapper.java#L29-L31) &rarr;
[MemberMapper.xml](https://github.com/ainokks071/portfolio/blob/285c1ff6abd25817d287f22b52badbb1bebbba10/AuthorityBoard/src/main/java/kr/bit/mapper/MemberMapper.xml#L44-L50)

</br>

#### :pushpin: 실행화면
<details><summary><b>상세 보기</b></summary>
<div markdown="1">

![image](https://github.com/ainokks071/portfolio/assets/140647727/0ab8073e-0b28-4920-bafb-5fe22cc1e4fa)

</div>
</details>
</br>


## 3. 트러블 슈팅
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




## 4. 회고 및 향후 계획

> ㅇㅇㅇ
>
> ㅇㅇㅇ
>
> ㅇㅇㅇ
>
> ㅇㅇㅇ
>
> ㅇㅇㅇ
