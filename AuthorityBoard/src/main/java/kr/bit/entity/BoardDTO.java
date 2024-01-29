package kr.bit.entity;

import lombok.Data;

//entity = domain
//데이터 타입(글의 번호,제목,내용,작성자,작성일,조회수 멤버변수를 담고있는 객체), 객체 

//Lombok API(자바의 라이브러리) : getter(), setter(), toString() 메서드 코드 다이어트 라이브러리. 
//사용법 : @Data

//롬복을 사용하기 위한 준비물 2가지
//1. pom.xml에 디펜던시 작성
//2. https://projectlombok.org/download에서 lombok.jar 다운로드 -> 터미널창에서 실행하여 다운로드 -> 이클립스-롬복 연결 완료.

//javax.el.PropertyNotFoundException: [idx] 특성이 [kr.board.entity.Board] 유형에 없습니다.
//@Data 인식이 안되나 ?? 게터 세터 만들면, jsp포워딩 됨..
//위의 2번 과정을 하지 않아서 발생한 에러 !


@Data
public class BoardDTO {
	  private int brdIdx; // 게시판 일련번호, PK
//	  private int memIdx; // 회원 일련번호, FK -> member참조로 접근할 수 있다.
	  private String brdTitle; // 제목
	  private String brdContent; // 내용
	  private String brdIndate; // 작성일
	  private int brdCount; // 조회수
	  
	  private MemberDTO member; //ManyToOne
}
