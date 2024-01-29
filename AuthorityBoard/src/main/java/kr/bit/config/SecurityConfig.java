package kr.bit.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.csrf.CsrfFilter;
import org.springframework.web.filter.CharacterEncodingFilter;
import kr.bit.service.UserDetailsServiceImpl;

// WebConfig.java에도 등록해줘야함.
@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter{
	
	@Override
	protected void configure(HttpSecurity http) throws Exception {
		
//		시큐리티 전용 한글인코딩 ex) 회원가입 
		CharacterEncodingFilter filter = new CharacterEncodingFilter();
		filter.setEncoding("UTF-8");
		filter.setForceEncoding(true);
		http.addFilterBefore(filter,CsrfFilter.class);
		
		
//		1) HttpSecurity : 요청에 관한 경로(url이동), 권한(permit) 설정  
//		스프링 시큐리티 :	로그인, 로그아웃, 예외처리  -> HttpSecurity에 설정
		http
			.authorizeRequests()
				.antMatchers("/")
				.permitAll() //루트경로는 모든 사용자 허용
				.and()
			.formLogin()
				.loginPage("/loginForm") //커스텀 로그인 페이지로 이동
//				로그인 성공 시, redirect "/" , 로그인 실패 시, redirect "/loginForm"
				.loginProcessingUrl("/login") //loginForm.jsp에 url 명시, UserDetailsService -> mapper
				.permitAll()
				.and()
			.logout()
				//시큐리티 로그아웃 : get방식 x -> post방식 !			
				//스프링에서 기본적으로 '/logout' url 설정 -> header.jsp에 로그아웃 url "/logout" 명시
			 	.invalidateHttpSession(true) //세션 끊음
			 	//로그아웃 성공하면 루트경로("/")로 이동하던 것을 ("/logoutSuccess")으로 변경
			 	.logoutSuccessUrl("/logoutSuccess") 
			 	.and()
			.exceptionHandling().accessDeniedPage("/access-denied"); //예외발생하면 access-denied.jsp로 이동
	}
	
//  MemberUserDetailsService(로그인 처리)를 실행시키는 역할 !!  
//	-> MemberUserDetailsService()메서드 호출, 패스워드인코더 연결 
	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		auth.userDetailsService(MemberUserDetailsService()).passwordEncoder(passwordEncoder());
	}
	
	//로그인 처리 서비스 계층 빈 등록
	@Bean
	public UserDetailsService MemberUserDetailsService() {
		return new UserDetailsServiceImpl();
	}
    
    
    
	// 패스워드 인코더 빈
    @Bean 
    public PasswordEncoder passwordEncoder() {
		 return new BCryptPasswordEncoder(); 
    }
    
}

	
