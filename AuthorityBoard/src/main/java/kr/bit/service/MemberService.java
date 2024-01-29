package kr.bit.service;


import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.bit.entity.MemberDTO;

@Service
public interface MemberService {
	
//	아이디 중복확인
	String idDuplicated(String memID);
	
	MemberDTO getMemberByIdx(int memIdx);
	
	

	String signUp(MemberDTO member, String memPassword1, String memPassword2, RedirectAttributes rattr);

	String memberUpdate(MemberDTO member, String memPassword1, String memPassword2, RedirectAttributes rattr);

	String imageInsert(MemberDTO member, HttpServletRequest request, RedirectAttributes rattr);
	
}
