package kr.ohora.sl.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.DisabledException;
import org.springframework.security.authentication.InternalAuthenticationServiceException;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;

import org.springframework.stereotype.Component;


import kr.ohora.sl.repository.member.MemberMapper;

@Component
public class customAuthenticationFailureHandler implements AuthenticationFailureHandler{
	
	@Autowired
	MemberMapper memberMapper;

	@Override
	public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
			AuthenticationException exception) throws IOException, ServletException {
		
		String redirectUrl = "/member/joinus/login.htm";
		
        // 실패 원인에 따라 쿼리 파라미터 추가
        if (exception instanceof InternalAuthenticationServiceException) {
            redirectUrl += "?error=invalid_username"; // 아이디가 존재하지 않음
            
        } else if (exception instanceof BadCredentialsException) { // BCryptPasswordEncoder 가 던지는 예외
            redirectUrl += "?error=invalid_password"; // 비밀번호가 일치하지 않음
            
        } else if (exception instanceof DisabledException) {
        	redirectUrl += "?error=invalid_account"; // 계정 비활성화
        }else {
            redirectUrl += "?error=unknown"; // 기타 오류
        }

        // 로그인 페이지로 리다이렉트
        response.sendRedirect(redirectUrl);
	}

}
/*
BadCredentialsException	비밀번호가 일치하지 않을 때.
InternalAuthenticationServiceException	사용자 정보 로드 과정에서 문제가 발생했을 때.
UsernameNotFoundException	UserDetailsService에서 사용자를 찾을 수 없을 때.
LockedException	계정이 잠겨 있을 때.
DisabledException	계정이 비활성화 상태일 때.
AccountExpiredException	계정이 만료되었을 때.
CredentialsExpiredException	비밀번호가 만료되었을 때.
 */
