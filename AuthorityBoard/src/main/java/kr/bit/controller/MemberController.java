package kr.bit.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.bit.entity.MemberDTO;
import kr.bit.service.MemberService;

@RequestMapping("/member")
@Controller
public class MemberController{	
	
	@Autowired
	private MemberService memberService;
	
//	1. 회원 가입
//	아이디 중복확인
	@ResponseBody 
	@GetMapping("/idDuplicated")
	public String idDuplicated(@RequestParam("memID") String memID) {
		String id = memberService.idDuplicated(memID);
		return id;
	}
//	회원가입 처리
	@PostMapping("/signUp")
	public String signUp(MemberDTO member, String memPassword1, String memPassword2, RedirectAttributes rattr) {
		String url = memberService.signUp(member, memPassword1, memPassword2, rattr);
		switch(url) {
			case "redirect:/member/signUpForm":
				return "redirect:/member/signUpForm";
				
			case "redirect:/main":
				return "redirect:/main";
				
			default:
				return "redirect:/main";
		}
	}
	
//	2. 로그인 : 시큐리티에서 처리 
	
//	3. 회원 정보 수정
	@PostMapping("/update")
	public String memberUpdate(MemberDTO member, String memPassword1, String memPassword2, RedirectAttributes rattr) {
		
		String url = memberService.memberUpdate(member, memPassword1, memPassword2, rattr);
		
		switch(url) {

		case "redirect:/updateForm":
			return "redirect:/updateForm";
		case "redirect:/main":
			return "redirect:/main";
		default:
			return "redirect:/main";
		}
	}
	
//	4. 파일 업로드 
//	실제 파일 업로드 + DB에 memProfile이름 저장.
	@RequestMapping("/imageInsert")
	public String memberImageInsert(MemberDTO member, HttpServletRequest request, RedirectAttributes rattr) {
//		url = "redirect:/imageForm"; 
		String url = memberService.imageInsert(member, request, rattr);
		return url;		
	}
	
//	게시판 작성자 이름 클릭 시 조회
	@ResponseBody 
	@GetMapping("/{memIdx}")
	public MemberDTO getMemberByIdx(@PathVariable int memIdx) {
		MemberDTO member = memberService.getMemberByIdx(memIdx);
		return member; //JSON 
	}

	@GetMapping("/access-denied")
	public String accessDenied() {
		return "access-denied"; //access-denied.jsp 
	}
	
}