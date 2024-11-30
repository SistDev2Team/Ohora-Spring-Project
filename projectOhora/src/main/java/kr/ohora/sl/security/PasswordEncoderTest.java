package kr.ohora.sl.security;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

public class PasswordEncoderTest {
	
    public static void main(String[] args) {
        BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
        String encodedPassword = encoder.encode("manager123"); // 평문 비밀번호 암호화
        System.out.println(encodedPassword); // 암호화된 비밀번호 출력
    }

}
