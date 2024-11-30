package kr.ohora.sl.domain;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Past;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class UserDTO {
    private int userid;         // 회원 ID (PK)
    private int memid;          // 멤버십 ID
    private int authid;         // 권한 ID
    @NotBlank(message = "아이디는 필수 입력 항목입니다.")
    @Size(min = 4, max = 20, message = "아이디는 4자에서 20자 사이여야 합니다.")
    private String username;    // 사용자 아이디   
    @NotBlank(message = "비밀번호는 필수 입력 값 입니다")
    @Size(min = 8, max = 16, message = "비밀번호는 8자에서 16자 사이여야 합니다.")
    @Pattern(
		            regexp = "^(?=.*[a-zA-Z])(?=.*\\d)(?=.*[!@#$%^&*(),.?\":{}|<>]).{8,16}$",
		            message = "비밀번호는 영문, 숫자, 특수문자 중 최소 두 가지 이상을 포함해야 합니다."
                  )
    private String password;    // 비밀번호 (암호화된 값)
    @NotBlank(message = "이름은 필수 입력 항목입니다.")
    private String name;        // 이름
    @NotBlank(message = "이메일은 필수 입력 항목입니다.")
    @Email(message = "유효한 이메일 주소를 입력하세요.")
    private String useremail;   // 이메일
    @NotBlank(message = "휴대폰 번호는 필수 입력 항목입니다.")
    @Pattern(
        regexp = "^\\d{3}-\\d{3,4}-\\d{4}$",
        message = "휴대폰 번호는 010-1234-5678 형식으로 입력해야 합니다."
    )
    private String usertel;     // 휴대폰 번호
    @Past(message = "생년월일은 과거 날짜여야 합니다.")
    private Date userbirth;     // 생년월일
    
    // 생년월일 설정
    public void setBirthDate(String year, String month, String day) throws ParseException {
        String birthString = String.format("%s-%02d-%02d", year, Integer.parseInt(month), Integer.parseInt(day));
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        this.userbirth = formatter.parse(birthString);
    }
    
    private int userpoint;      // 적립금
    @Pattern(regexp = "Y|N", message = "SNS 수신 동의 값은 'Y' 또는 'N'이어야 합니다.")
    private String usersnsagree; // SNS 수신 동의 여부 ('Y' or 'N')
    private Date userjoindate;  // 가입일
    private Boolean enabled;    // 계정 활성화 여부 (true or false)    
    private List<AuthDTO> authList; // 권한 목록 가져오기

}

