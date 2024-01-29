package kr.bit.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import kr.bit.entity.MemberDTO;
import kr.bit.entity.MemberUser;
import kr.bit.mapper.MemberMapper;

// 로그인 처리 시 DB에서 회원을 조회하는 서비스계층 ! + 회원정보 수정, 프로필사진 수정 시 새롭게 수정된 회원정보 객체바인딩!
public class UserDetailsServiceImpl implements UserDetailsService {
	
	@Autowired
	private MemberMapper memberMapper;

//	username = memID
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		
//		회원 + 권한 join
		MemberDTO member = memberMapper.memberLogin(username);
		
		if(member != null) {
			return new MemberUser(member); // Security context holder 객체바인딩 -> JSP에서 추출 가능(회원 + 권한정보)
		} else {
			throw new UsernameNotFoundException(username + " not exist");
		}
	}
	
	
	// 스프링보안(새로운 인증 세션을 생성->객체바인딩)
	public void setNewAuthentication() {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		MemberUser userAccount = (MemberUser) authentication.getPrincipal();
		SecurityContextHolder.getContext().setAuthentication(createNewAuthentication(authentication,userAccount.getMember().getMemID()));
	}

	// 스프링 보안(새로운 세션 생성 메서드)
	// UsernamePasswordAuthenticationToken -> 회원정보+권한정보
	protected Authentication createNewAuthentication(Authentication currentAuth, String username) {
		UserDetails newPrincipal = loadUserByUsername(username);
		UsernamePasswordAuthenticationToken newAuth = new UsernamePasswordAuthenticationToken(newPrincipal, currentAuth.getCredentials(), newPrincipal.getAuthorities());
		newAuth.setDetails(currentAuth.getDetails());	    
		return newAuth;
	}
}
