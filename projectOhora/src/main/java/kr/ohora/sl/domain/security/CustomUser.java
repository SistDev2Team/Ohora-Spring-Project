package kr.ohora.sl.domain.security;

import kr.ohora.sl.domain.UserDTO;
import lombok.Getter;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;

import java.util.Collection;
import java.util.stream.Collectors;

@Getter
public class CustomUser extends User {
	
	/* private static final long serialVersionUID = 1L; */

    private UserDTO user; // 사용자정보 담기

    // 기본 생성자 (부모 클래스의 생성자를 호출)
    public CustomUser(String username, String password, Collection<? extends GrantedAuthority> authorities) {
        super(username, password, authorities);
    }

    // UserDTO 객체를 받아서 CustomUser를 초기화
    public CustomUser(UserDTO user) {
        super(
            user.getUsername(), //Class의 username
            user.getPassword(), // ''의 Password
            user.getAuthList().stream()
                .map(auth -> new SimpleGrantedAuthority(auth.getAuthority()))
                .collect(Collectors.toList())
        ); //SimpleGrantedAuthority를 사용해 사용자의 권한 리스트를 Spring Security의 권한 구조로 변환
        this.user = user; // userDTO 저장
    }
    
}

/*
Authentication의 주요 메서드
getPrincipal(): 인증된 사용자 정보(CustomUser ( UserDetails 객체))
getAuthorities(): 사용자 권한 정보.
isAuthenticated(): 인증 상태 확인.
 */

