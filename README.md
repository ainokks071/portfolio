# :white_check_mark: 김경수의 포트폴리오

## :pushpin: Intro

> <b>"모든 것은 기본에서 시작한다."</b>라는 말을 좋아합니다.
> 
> 축구선수가 매일 기본기 훈련인 달리기, 패스, 슈팅연습을 하듯이
> 
> 개발자 역시 끊임없는 사고, 문제해결을 위한 고민, 팀원들과의 협업이 기본기일 것이라 생각합니다.
> 
> 하루하루 지치지 않고 꾸준한 기본기 훈련을 토대로 훗날 멋진 개발자가 되고 싶습니다.
> 

</br>

## :pushpin: Contact
- 이메일 : ainokks071@gamil.com
- 블로그 : https://velog.io/@ainokks071/posts
- 깃헙 : https://github.com/ainokks071
 
</br>

## :pushpin: Project

>간략 소개 : 회원 권한 게시판 (개인 프로젝트)
>
>개발 기간 : 2023.10.1 ~ 2024.1.27
>
>기술 스택 :
>
>Java 11 / Spring Framework 5.3 / Spring Security 5.3 / MyBatis 3.5 / MySQL 8.0 / JSP / Maven
>
>html / css / bootstrap / JavaScript / JQuery / ajax
>

</br>

# :white_check_mark: 회원 권한 게시판

## :pushpin: 간략 소개

> 로그인 여부 및 회원 권한에 따라 게시판의 게시글 조회, 등록, 수정, 삭제의 기능을 차등적으로 이용할 수 있습니다.
> 
> 회원가입 시, 3개의 권한(User, Manager, Admin)을 다중으로 선택할 수 있습니다.
>
> Admin은 다른 회원의 글을 삭제할 수 있는 권한이 주어집니다.
> 
> 로그인을 한 회원은 사진을 업로드할 수 있으며, 사진은 다른 회원에게 보여집니다.
> 

</br>

## 1. ERD 및 Entity

![image](https://github.com/ainokks071/portfolio/assets/140647727/29d431bc-6fb8-43cd-9fc2-f5f999678db5)

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


## 2. 트러블 슈팅

<details><summary><b>  </b></summary>
<div markdown="1">
	
</br>

- ㅇㅇ
  - ㅇㅇ 
 
```java

```
</div>
</details>

</br>


<details><summary><b>Member테이블보다 Authority테이블에 먼저 Insert를 했을 때</b></summary>
<div markdown="1">
	
</br>

- (1452): Cannot add or update a child row: a foreign key constraint
  - 회원가입 시 Member테이블과 Authority테이블에 데이터를 넣는 상황에서 발생한 에러입니다.	
  - 자식테이블인 Authority테이블에 먼저 데이터를 넣으려고 했기 때문에 발생하였고, 참조 무결성을 지키지 않았음을 알게 되었습니다.
  - 즉, 참조하는 테이블에 값이 없는데 참조받는 테이블에 먼저 값을 넣으려고 했기 때문입니다.
  - 아래와 같이 회원 insert 후, 권한 insert로 순서를 변경하여 해결하였습니다.
 
```java
//회원 insert
memberMapper.memberInsert(member);

//권한 insert
memberMapper.authInsert(map);
```
</div>
</details>

</br>

<details><summary><b>Null값이 있는 데이터를 Insert하려고 했을 때</b></summary>
<div markdown="1">
	
</br>

- Column 'auth_Type' cannot be null
  - 회원가입 시, 권한을 여러 개 선택하면 반복문으로 Authority테이블에 여러 개의 행이 추가됩니다.
  - 이 때 선택하지 않은 권한은 auth_Type이 Null인 채로 Insert가 되기 때문에 발생한 에러입니다.
  - Authority테이블의 auth_Type은 NotNull 제약조건을 갖고 있습니다.
  - 권한 Insert를 하기 전, Null체크를 하지 않은 것을 발견했고, 아래와 같이 Null체크를 통해 해결하였습니다.

```java
//Null체크
if(authType != null) {
	switch(authType) {
		case "ROLE_USER":
		authDTO.setAuthNum(1);
		break;
							
		case "ROLE_MANAGER":
		authDTO.setAuthNum(2);
		break;
							
		case "ROLE_ADMIN":
		authDTO.setAuthNum(3);
		break;
	}

	map.put("auth", authDTO);
	map.put("memIdx", newMemberIdx);
//	권한 insert
	memberMapper.authInsert(map);
}
```

</div>
</details>

</br>

<details><summary><b>mapper.xml에서 resultType과 resultMap을 혼용하였을 때</b></summary>
<div markdown="1">
	
</br>

- 브라우저에서 parsing error와 서버에서 NullPointerException 발생
  - ajax로 특정 Idx에 해당하는 게시물 조회 시, 브라우저에서 데이터가 출력되지 않고, 서버에서는 NullPointerException가 발생했습니다.
  - SQL쿼리 select에 문제가 없어 보여서 처음에는 프론트단에서 ajax문제일 것이라 생각했습니다.
  - 하지만, MyBatis mapper.xml의 resultType의 문제였습니다.
  - resultType은 조인쿼리를 사용하지 않을 때, resultMap은 조인쿼리를 사용할 때 쓰는 것이라 알고있었습니다.
  - 그것은 잘못된 지식이었고, BoardDTO는 이미 resultMap으로 선언되어 있기 때문에 조인쿼리와 관계없이 resultType이 아니라 resultMap으로 변경해야 한다는 것을 알게 되었습니다.
  - 아래와 같이 변경하여 해결하였습니다.
 
```html
<!-- 이미 boardMap으로 선언되어있는 BoardDTO -->
<resultMap type="kr.bit.entity.BoardDTO" id="boardMap">

<!-- 변경 전 -->
<select id="boardContent" parameterType="Integer" resultType="kr.bit.entity.BoardDTO">
	SELECT * FROM board WHERE brd_Idx = #{brdIdx}
</select>
<!-- 변경 후 -->
<select id="boardContent" parameterType="Integer" resultMap="boardMap">
	SELECT * FROM board WHERE brd_Idx = #{brdIdx}
</select>
```
</div>
</details>

</br>

<details><summary><b>json데이터 전송 실패</b></summary>
<div markdown="1">
	
</br>

- ajax로 json데이터 전송 시 데이터 형식 오류
  - Board와 Member는 ManyToOne 관계로 Board는 Member를 참조하고 있습니다.
  - Member의 memIdx를 초기화시킬 때 기본적인 json 데이터 형태를 지키지 않아서 발생한 에러입니다.
  - 아래와 같이 "member" : { "memIdx" : memIdx }로 변경하여 해결하였습니다.
  - 또한, mapper.xml에서 Member의 memIdx 접근 시, #{member.memIdx}형태로 접근하는 것도 알게 되었습니다.
 
```javascript
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
```
</div>
</details>

</br>

<details><summary><b>파일 업로드 시 서버 중단</b></summary>
<div markdown="1">
	
</br>

- 업로드하는 파일의 용량이 maxSize인 10MB보다 클 때 서버 중단
  - 톰캣의 server.xml에 "maxswallowSize -1"을 추가하여 해결하였습니다.
  - 서버 중단 없이 한계치까지는 업로드 해보고 아래와 같이 예외처리를 통해 modal창을 표시하였습니다.
 
```html
<Connector connectionTimeout="20000" maxParameterCount="1000" port="8080" protocol="HTTP/1.1" redirectPort="8443" maxSwallowSize="-1"/>
```
```java
} catch (IOException e) {
// 파일 크기 10mb 이상일 경우
java.io.IOException: Posted content length of 11787364 exceeds limit of 10485760
e.printStackTrace();
rattr.addFlashAttribute("msg3", "파일 업로드 오류");
rattr.addFlashAttribute("msg4", "파일의 크기는 10MB를 초과할 수 없습니다.");
```
</div>
</details>

</br>

<details><summary><b>@ResponseBody 생략 시, 브라우저에서 Not Found 404 발생</b></summary>
<div markdown="1">
	
</br>

- REST server개발 시, boardInsert()의 반환타입이 void여도 반드시 @ResponseBody를 붙여야 한다는 것을 알게 되었습니다.
 
```java
//게시글 등록
@ResponseBody
@PostMapping("/new")
public void boardInsert(@RequestBody BoardDTO board) {
	boardService.boardInsert(board);
}
```
</div>
</details>

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
