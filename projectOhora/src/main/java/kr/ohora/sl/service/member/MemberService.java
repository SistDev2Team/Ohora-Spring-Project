package kr.ohora.sl.service.member;

import java.sql.SQLException;

import kr.ohora.sl.domain.UserDTO;

public interface MemberService {
	
	boolean isDuplicate(String type, String value) throws SQLException; // 중복 확인
	
	void registerUser(UserDTO user) throws SQLException; //회원가입
	
}
