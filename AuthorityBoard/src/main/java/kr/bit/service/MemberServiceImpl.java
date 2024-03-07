package kr.bit.service;


import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import kr.bit.entity.AuthDTO;
import kr.bit.entity.MemberDTO;
import kr.bit.mapper.MemberMapper;

@Service
public class MemberServiceImpl implements MemberService{
	
	@Autowired
	MemberMapper memberMapper;
	
	@Autowired 
	PasswordEncoder pwEncoder;
	
	@Autowired
	UserDetailsServiceImpl userDetailsServiceImpl;

//	* 회원가입 
//	아이디 중복확인
	@Override
	public String idDuplicated(String memID) {
//		중복O : 해당ID 반환, 중복X : null 반환
		String id = memberMapper.idDuplicated(memID);
		if(id != null) {
			return id;
		} else {
			id="";
			return id;
		}
	}
	
//	회원가입 처리
	@Override
	public String signUp(MemberDTO member, String memPassword1, String memPassword2, RedirectAttributes rattr) {
		List<AuthDTO> authList = member.getAuthList();
//		1. 입력 누락 체크 
		if(member.getMemID() == null || member.getMemID().equals("") ||
//		   memPassword는 hidden으로, pwd1과 pwd2가 일치할 경우에만 값이 넘어온다.
//		   틀린 비밀번호로 입력했음에도 "모든 정보를 입력해주세요" modal창 뜨는 문제 		
//		   vo.getMemPassword() == null || vo.getMemPassword().equals("")
		   memPassword1 == null || memPassword1.equals("") ||
		   memPassword2 == null || memPassword2.equals("") ||
		   member.getMemName() == null || member.getMemName().equals("") ||
		   member.getMemAge() == 0 || member.getMemAge() > 120 ||
		   member.getMemGender() == null || member.getMemGender().equals("") ||
		   member.getMemEmail() == null || member.getMemEmail().equals("") || authList.size() == 0) 
		{
			rattr.addFlashAttribute("msg1", "회원가입 실패");
			rattr.addFlashAttribute("msg2", "모든 정보를 입력해주세요.");
			return "redirect:/member/signUpForm"; //signUpForm.jsp
		}
		
//		2. 입력 누락은 없지만, 비밀번호 일치하지 않는 경우
		if(!memPassword1.equals(memPassword2)) {
			rattr.addFlashAttribute("msg1", "회원가입 실패");
			rattr.addFlashAttribute("msg2", "비밀번호가 일치하지 않습니다.");
			return "redirect:/member/signUpForm"; //signUpForm.jsp
		}
		
//		3. 아이디 중복 확인
		String id = memberMapper.idDuplicated(member.getMemID());
		if(id != null) {
			rattr.addFlashAttribute("msg1", "회원가입 실패");
			rattr.addFlashAttribute("msg2", "중복된 아이디입니다. 다시 입력해주세요.");
			return "redirect:/member/signUpForm"; //signUpForm.jsp
		}
		
//		유효성 검사 통과
		
//		비밀번호 암호화 
		member.setMemPassword(pwEncoder.encode(member.getMemPassword()));
		int success = memberMapper.memberInsert(member);
		
		if(success != 0) {
			
//			OneToMany : Authority 테이블에 mem_Idx insert 시, 번거롭다 -> Member테이블에서 PK인 memIdx 추출하여 Authority테이블에 직접 insert
			int newMemberIdx = memberMapper.getMemberIdx(member.getMemID());
			
			HashMap<String, Object> map = new HashMap<String, Object>();
			 
			for(AuthDTO authDTO : authList) {
				
				String authType = authDTO.getAuthType();

//				AuthDTO[authIdx, authNum, authType] : 회원가입 시, 권한체크 하지 않은 authType은 null
//				권한 insert시, Column 'auth_Type' cannot be null
				
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
//					authDTO.setMemIdx(newMemberIdx);
					
//					권한 insert
					memberMapper.authInsert(map);
				}
				
			}
			rattr.addFlashAttribute("msg1", "회원가입 성공 !");
			return "redirect:/main";
			
		} else {
			rattr.addFlashAttribute("msg1", "회원가입 실패 !");
			return "redirect:/member/signUpForm";
		}
	}

//	* 로그인 : 시큐리티가 처리
	
//	* 회원 정보, 권한 정보 수정
	@Override
	public String memberUpdate(MemberDTO member, String memPassword1, String memPassword2, RedirectAttributes rattr) {
		List<AuthDTO> authList = member.getAuthList();

//		1. 입력 누락 체크
		if(member.getMemID() == null || member.getMemID().equals("") ||
		   memPassword1 == null || memPassword1.equals("") ||
		   memPassword2 == null || memPassword2.equals("") ||
		   member.getMemName() == null || member.getMemName().equals("") ||
		   member.getMemAge() == 0 || member.getMemAge() >= 100 ||
		   member.getMemGender() == null || member.getMemGender().equals("") ||
		   member.getMemEmail() == null || member.getMemEmail().equals("") || authList.size() == 0)
		{
			rattr.addFlashAttribute("msg1", "회원정보 수정 실패");
			rattr.addFlashAttribute("msg2", "모든 정보를 입력해주세요.");
			return "redirect:/updateForm";
		}
		
//		2. 비밀번호 일치하지 않는 경우
		if(!memPassword1.equals(memPassword2)) {
			rattr.addFlashAttribute("msg1", "회원정보 수정 실패");
			rattr.addFlashAttribute("msg2", "비밀번호가 일치하지 않습니다.");
			return "redirect:/updateForm";
		}

//		유효성 검사 통과 
		
//		비밀번호 암호화 
		String rawPassword = member.getMemPassword();
		String encodePassword = pwEncoder.encode(rawPassword);
		member.setMemPassword(encodePassword);
		
		int success = memberMapper.memberUpdate(member);
		
		if(success != 0) {
			
//			해당 회원의 모든 권한 행(row) 삭제 
			memberMapper.authDelete(member.getMemIdx());
			
			Map<String, Object> map = new HashMap<String, Object>();
			
//			Member와 ManyToOne이었다면, mem_Idx 직접 접근 가능했을 것.
//			AuthDTO[auth_Num, auth_Type, mem_Idx]
			for(AuthDTO authDTO : authList) {
				String authType = authDTO.getAuthType();
				if(authType != null) {
					
					switch (authType) { 
						case "ROLE_USER":
							authDTO.setAuthNum(1);
							break;
						case "ROLE_MANGER":
							authDTO.setAuthNum(2);
							break;
						case "ROLE_ADMIN":
							authDTO.setAuthNum(3);
							break;
					}
//					authDTO.setMemIdx(member.getMemIdx());
					map.put("auth", authDTO);
					map.put("memIdx", member.getMemIdx());
					
					memberMapper.authInsert(map);
				}
//				<기존 코드> -> JPA로 변경한다면??			
//				authDTO.setMemIdx(member.getMemIdx());
//				memberMapper.authInsert(authDTO);
			}
			
			// Spring Security : 수정된 회원 정보 객체바인딩 
			userDetailsServiceImpl.setNewAuthentication();
			
			rattr.addFlashAttribute("msg1", "회원정보 수정 성공");
			rattr.addFlashAttribute("msg2", member.getMemName() + "님, 회원정보가 수정되었습니다.");
			return "redirect:/main";
			
		} else {
			rattr.addFlashAttribute("msg1", "회원정보 수정 실패");
			rattr.addFlashAttribute("msg2", "회원정보 수정에 실패하였습니다.");
			return "redirect:/main"; 
		}
	}
	
//	4. 파일 업로드 
	@Override
	public String imageInsert(MemberDTO member, HttpServletRequest request, RedirectAttributes rattr) {
		
		String uploadPath = request.getSession().getServletContext().getRealPath("/resources/upload");
		int fileMaxSize = 10 * 1024 * 1024; //10mb
		String encoding = "UTF-8";
		String newProfile = null;
		String oldProfile = null;
		
		String memID = "";
//		int memIdx = member.getMemIdx() : enctype="multipart/form-data"이므로, 적용되지 않는다.
		int memIdx = 0;
		
		try {
//			실제 파일 업로드 수행 
			MultipartRequest multi = new MultipartRequest(request, uploadPath, fileMaxSize, encoding, new DefaultFileRenamePolicy());
			
			newProfile = multi.getFilesystemName("memProfile");
			memIdx = Integer.parseInt(multi.getParameter("memIdx"));
			
//			파일 업로드 하지 않고 등록한 경우
			if(newProfile == null) {
//				기존에 업로드한 파일 삭제  
				oldProfile = memberMapper.getMember(memIdx).getMemProfile();
				new File(uploadPath + "/" + oldProfile).delete();
				
				member.setMemIdx(memIdx);
				member.setMemProfile(newProfile);
//				DB memProfile null로 변경				
				memberMapper.imageUpdate(member);   
				
//				새롭게 객체바인딩
				userDetailsServiceImpl.setNewAuthentication();
				rattr.addFlashAttribute("msg1", "프로필 사진 변경 성공");
				rattr.addFlashAttribute("msg2", "기본 이미지로 변경 되었습니다.");
				return "redirect:/imageForm"; 
			}
			
//			업로드한 파일의 확장자를 대문자로 추출
			String ext = newProfile.substring(newProfile.lastIndexOf(".")+1).toUpperCase();
			if(!(ext.equals("JPEG") || ext.equals("PNG") || ext.equals("JPG") || ext.equals("GIF"))) {
				rattr.addFlashAttribute("msg5", "파일 업로드 오류");
				rattr.addFlashAttribute("msg6", "이미지 파일만 업로드할 수 있습니다.");
//				이미 업로드 된, 잘못된 확장자 파일 삭제.
				new File(uploadPath + "/" + newProfile).delete();
				return "redirect:/imageForm"; 
			}
			
//			1. 기존 사진은 지우기. 
			member = memberMapper.getMember(memIdx);
			
			if(member != null) {
				oldProfile = member.getMemProfile();
			}
			new File(uploadPath + "/" + oldProfile).delete();
			
//			2. 사진 업데이트
			member.setMemProfile(newProfile);
			memberMapper.imageUpdate(member);
			
			userDetailsServiceImpl.setNewAuthentication();

			rattr.addFlashAttribute("msg1", "파일 업로드 성공");
			rattr.addFlashAttribute("msg2", "성공적으로 파일이 업로드 되었습니다.");
			
			return "redirect:/imageForm"; 
			
		} catch (IOException e) {
//			파일 크기 10mb 이상일 경우
//			java.io.IOException: Posted content length of 11787364 exceeds limit of 10485760
			e.printStackTrace();
			rattr.addFlashAttribute("msg3", "파일 업로드 오류");
			rattr.addFlashAttribute("msg4", "파일의 크기는 10MB를 초과할 수 없습니다.");
//			server.xml -> maxswallowSize -1 -> 한계치까지는 업로드 시도
			return "redirect:/imageForm"; 
		}
	}
	
//	게시판 작성자 이름 클릭 시 조회
	@Override
	public MemberDTO getMemberByIdx(int memIdx) {
		MemberDTO member = memberMapper.getMemberByIdx(memIdx);
		return member;
	}
}
