package kr.ohora.sl.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class AuthDTO {
    private int userid;      // 회원 ID (외래 키)
    private String authority; // 권한 (예: ROLE_USER, ROLE_ADMIN)
}
