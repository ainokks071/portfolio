package kr.bit.mapper;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.bit.entity.MemberDTO;

@Mapper
public interface MemberMapper {
// 1. 회원 가입	
//	아이디 중복확인
	public String idDuplicated(String memID);
//	회원 insert
	public int memberInsert(MemberDTO member);
	public int getMemberIdx(String memID);
	
//	권한 insert
//	public void authInsert(AuthDTO auth);
	public void authInsert(Map<String, Object> map);

//	2. 시큐리티 로그인 : 회원 + 권한 join
	public MemberDTO memberLogin(String username);

//	3. 회원 정보, 권한 정보 수정
	public int memberUpdate(MemberDTO member);
	public void authDelete(int memIdx);

//	4. 파일 업로드 
	public void imageUpdate(MemberDTO member);
	public MemberDTO getMember(int memIdx);
	
//	5. 게시판 작성자 클릭 시, 회원 조회(join) : 특정 회원 정보 + 권한 정보 추출
	public MemberDTO getMemberByIdx(int memIdx);
	
}
