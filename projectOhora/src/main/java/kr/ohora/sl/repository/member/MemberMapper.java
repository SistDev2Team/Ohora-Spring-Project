package kr.ohora.sl.repository.member;

import java.sql.SQLException;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import kr.ohora.sl.domain.UserDTO;

@Repository
public interface MemberMapper {
	
    // 사용자 정보 + 권한 
    UserDTO getUserInfo(@Param("username") String username) throws ClassNotFoundException, SQLException;
    
    //아이디 중복 체크
    int isDuplicate(@Param("type") String type, @Param("value") String value)throws SQLException;
       
    //회원가입
    int insertUser(UserDTO user); // 회원 정보 삽입
    void insertUserAuthority(@Param("userId") int userId, @Param("authority") String authority); // 권한 삽입
    void issueWelcomeCoupon(@Param("userId") int userId); // 웰컴 쿠폰 발급
    
}


