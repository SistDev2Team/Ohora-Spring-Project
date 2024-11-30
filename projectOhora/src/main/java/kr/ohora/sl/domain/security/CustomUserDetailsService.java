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
  	
	}
}
