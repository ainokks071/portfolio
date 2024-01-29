package kr.bit.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class MainController {
	
	//로그인 성공 시 시큐리티에서 ("/") 요청.
	@RequestMapping("/")
	public String hi(RedirectAttributes rttrs) {
		rttrs.addFlashAttribute("msg2", "안녕하세요");
		return "redirect:/main";
	}
	
	//로그아웃 성공 시 시큐리티에서 ("/logoutSuccess") 요청.
	@RequestMapping("/logoutSuccess")
	public String bye(RedirectAttributes rttrs) {
		rttrs.addFlashAttribute("msg3", "안녕히가세요");
		return "redirect:/main";
	}
	
	//메인화면으로 이동
	@RequestMapping("/main")
	public String main() {
		return "main"; //main.jsp
	}
	
	//게시판으로 이동
	@RequestMapping("/board")
	public String board() {
		return "board/board";  //board.jsp
	}
	
	//회원가입화면으로 이동
	@RequestMapping("/signupForm")
	public String signUpForm() {
		return "member/signupForm"; //signUpForm.jsp 
	}
	
	//로그인화면으로 이동
	@RequestMapping("/loginForm")
	public String memberLoginForm() {
		return "member/loginForm"; //logInForm.jsp
	}
	
	//회원 수정화면으로 이동	
	@RequestMapping("/updateForm")
	public String memberUpdateForm() {
		return "member/updateForm"; 
	}
	
	//사진 파일 업로드 화면으로 이동
	@RequestMapping("/imageForm")
	public String memberImageForm() {
		return "member/imageForm"; //memberImageForm.jsp 
	}


	
}
