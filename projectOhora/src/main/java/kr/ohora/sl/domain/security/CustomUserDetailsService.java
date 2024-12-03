package kr.ohora.sl.domain.security;

import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Component;

import kr.ohora.sl.domain.UserDTO;
import kr.ohora.sl.repository.member.MemberMapper;
import lombok.extern.log4j.Log4j;

@Component
@Log4j
public class CustomUserDetailsService implements UserDetailsService{
	//loadUserByUsername 메서드를 호출하여 사용자의 정보를 조회하고, 이를 UserDetails로 반환
	@Autowired
	private MemberMapper memberMapper;

	//loadUserByUsername:로그인 요청시 호출 되는 메서드 
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		
		log.info("CustomUserDetailsService: Loading user by username: " + username);
		
		//  UserDTO 가져오기
        UserDTO userDTO = null;
        try {
            userDTO = memberMapper.getUserInfo(username);
        } catch (ClassNotFoundException | SQLException e) {
            log.error("Error fetching user info from database", e);
        }
        
        // UserDTO -> CustomUser로 변환하여 반환
        return userDTO == null ? null : new CustomUser(userDTO); 
  	   // null 이면 InternalAuthenticationServiceException가 발생합니다!!(주의)
	}
}

/*
이거 진짜 대박임

1. Spring Security의 예외 처리 흐름
Spring Security는 UserDetailsService.loadUserByUsername(String username)에서 
**UsernameNotFoundException**이 발생했을 때, 이를 **InternalAuthenticationServiceException**으로 변환합니다.

이유
Spring Security는 로그인 실패 시 사용자에게 비밀번호가 틀렸는지, 아이디가 존재하지 않는지를 노출하지 않으려는 보안 설계를 가지고 있습니다.
따라서, 아이디와 비밀번호 중 무엇이 틀렸는지를 구분하지 않고, 내부적으로 발생한 예외를 InternalAuthenticationServiceException으로 래핑(wrapping)하여 처리합니다.

*/