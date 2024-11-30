package kr.ohora.sl.service.member;

import java.sql.SQLException;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.ohora.sl.domain.UserDTO;
import kr.ohora.sl.repository.member.MemberMapper;
import lombok.AllArgsConstructor;

import lombok.extern.log4j.Log4j;

@Service
@AllArgsConstructor
@Log4j
public class MemberServiceImpl implements MemberService {

    private final MemberMapper memberMapper;
    
    private final PasswordEncoder passwordEncoder;
  
    @Override
    public boolean isDuplicate(String type, String value) throws SQLException{
        return this.memberMapper.isDuplicate(type, value) > 0;
    }

    @Transactional
	@Override
	public void registerUser(UserDTO user) throws SQLException {
		
    	
    	String password = user.getPassword();
    	user.setPassword(passwordEncoder.encode(password));
    	
    	int rowCount = memberMapper.insertUser(user); //회원정보삽입
    	
    	if(rowCount > 0) { 		
            memberMapper.insertUserAuthority(user.getUserid(), "ROLE_USER"); // 권한 삽입          
            memberMapper.issueWelcomeCoupon(user.getUserid()); //웰컴쿠폰    		
    	}else {
    		log.error("회원가입 처리 실패: 사용자 정보를 데이터베이스에 삽입하지 못했습니다.");
    	    throw new SQLException("회원가입 처리 중 오류 발생");
		}	
	}
    
    
}//class

