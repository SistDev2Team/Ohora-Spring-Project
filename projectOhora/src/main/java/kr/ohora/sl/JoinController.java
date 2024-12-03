package kr.ohora.sl;

import java.text.ParseException;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.ohora.sl.domain.UserDTO;
import kr.ohora.sl.service.member.MemberService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/member/joinus/")
@RequiredArgsConstructor
@Log4j
public class JoinController {
	
	private final MemberService memberService;
	
    @GetMapping("login.htm")
    public String loginPage(@RequestParam(value = "error", required = false) String error, Model model) {
    	
    	log.info("로그인 페이지 요청");
    	if (error != null) {
    	    model.addAttribute("loginError", "Invalid username or password.");
    	}
        
        return "member/joinus/login";
    }
       
    @GetMapping("findid.htm")
    public String findid() {
    	log.info("아이디 찾기 페이지 요청");
    	return "member/joinus/findid";
    }
    
    @GetMapping("showid.htm")
    public String showid() {
    	log.info("아이디 찾기 완료 페이지 요청");
    	return "member/joinus/showid";
    }
    
    @PostMapping("findid.htm")
    public String findId(
            @RequestParam("name") String name,
            @RequestParam("contact_method") String contactMethod,
            @RequestParam(value = "useremail", required = false) String email,
            @RequestParam(value = "usertel", required = false) String phone,
            Model model) {

       System.out.println("이름" + name);
       System.out.println("연락방법" + contactMethod);
       System.out.println("이메일" + email);
       System.out.println("핸드폰" + phone);
        

        try {
            String contact = contactMethod.equals("email") ? email : phone;
            log.info("최종 contact: {}" + contact ); // 최종 contact 값 출력

            String username = memberService.findUsername(name, contact, contactMethod);
            if (username == null) {
                return "redirect:/member/joinus/findid.htm?error=true";
            }

            model.addAttribute("username", username); // 아이디 들고 가기
            return "member/joinus/showid";

        } catch (Exception e) {
            log.error("Error while finding username", e); 
            
            return "member/joinus/showid";
        }
    }
    
    @GetMapping("findpw.htm")
    public String findPw() {
    	log.info("findpw 페이지 요청");

        return "member/joinus/findpw";
    }
    
    @PostMapping("findpw.htm")
    public String findpw(
            @RequestParam("username") String username,
            @RequestParam("name") String name,
            @RequestParam("contact_method") String contactMethod,
            @RequestParam(value = "email", required = false) String email,
            @RequestParam(value = "phone", required = false) String phone,
            Model model) {

        System.out.println("입력값 확인 " +
                username  +  name  +  contactMethod  +  email  +  phone);

        try {
            // 연락처 선택에 따른 최종 contact 값 설정
            String contact = contactMethod.equals("email") ? email : phone;
            System.out.println("최종 contact " + contact);

            // 사용자 정보 확인
            boolean userExists = memberService.checkUser(username, contact, name, contactMethod);

            if (userExists) {
                log.info("사용자 정보 확인 완료!");
                model.addAttribute("username", username); // 아이디
                model.addAttribute("contact", contact); // 연락처
                model.addAttribute("contactMethod", contactMethod); // 연락 방법
                return "member/joinus/checkpw"; 
            } else {
                return "redirect:/member/joinus/findpw.htm?error=true";
            }

        } catch (Exception e) {
            log.error("Error while finding user for password reset", e); 
            model.addAttribute("error", "서버 오류가 발생했습니다. 잠시 후 다시 시도해주세요.");
            return "member/joinus/findpw";
        }
    }

    
    @GetMapping("checkpw.htm")
    public String checkpw() {
    	log.info("checkpw 페이지 요청");
    	
    	return "member/joinus/checkpw";
    }
    
    @GetMapping("changepw.htm")
    public String changepw() {
    	log.info("changepw 페이지 요청");
    	
    	return "member/joinus/changepw";
    }
    
    @PostMapping("changepw.htm")
    public String changePassword(
            @RequestParam("user_id") String username,
            @RequestParam("new_password") String newPassword,
            @RequestParam("confirm_password") String confirmPassword,
            Model model) {

        // 비밀번호 확인
        if (!newPassword.equals(confirmPassword)) {
            model.addAttribute("error", "비밀번호가 일치하지 않습니다.");
            return "member/joinus/changepw";
        }

        // 서버 검증
        if (!newPassword.matches("^(?=.*[a-zA-Z])(?=.*\\d)(?=.*[!@#$%^&*]).{8,16}$")) {
            model.addAttribute("error", "비밀번호는 영문 대소문자/숫자/특수문자 중 2가지 이상 조합하고, 8~16자 사이여야 합니다.");
            return "member/joinus/changepw";
        }

        // 비밀번호 변경
        boolean success = memberService.changePassword(username, newPassword);

        if (success) {
            log.info("비밀번호 변경 성공");
            return "redirect:/member/joinus/changepw.htm?message=pwChanged";
        } else {
            log.error("비밀번호 변경 실패");
            return "redirect:/member/joinus/changepw.htm?message=pwFailed";
        }

    }

        
    @GetMapping("join.htm")
    public String joinPage() {
    	log.info("회원가입 페이지 요청");

        return "member/joinus/join";
    }
    
    @GetMapping("join_complete.htm")
    public String joincomplete() {
    	log.info("회원가입 완료페이지 요청");
    	return "member/joinus/join_complete";
    }
       
    @PostMapping("register.htm")
    public String register( @RequestParam("birthYear") String birthYear,
					               @RequestParam("birthMonth") String birthMonth,
					               @RequestParam("birthDay") String birthDay,
    		                       @Validated UserDTO user,
    		                       Model model, 
    		                       BindingResult result) {
    	
    	 if (result.hasErrors()) {
    	        // 에러 메세지 추가
    		 String usernameError = result.getFieldError("username") != null 
                     ? result.getFieldError("username").getDefaultMessage() : null;
			String passwordError = result.getFieldError("password") != null 
			                     ? result.getFieldError("password").getDefaultMessage() : null;
			String nameError = result.getFieldError("name") != null 
			                     ? result.getFieldError("name").getDefaultMessage() : null;
			String emailError = result.getFieldError("useremail") != null 
			                     ? result.getFieldError("useremail").getDefaultMessage() : null;
			String phoneError = result.getFieldError("usertel") != null 
			                     ? result.getFieldError("usertel").getDefaultMessage() : null;
			String birthError = result.getFieldError("userbirth") != null 
			                     ? result.getFieldError("userbirth").getDefaultMessage() : null;
			
			 // View 전달
	        model.addAttribute("usernameError", usernameError); // 아이디
	        model.addAttribute("passwordError", passwordError); // 비번
	        model.addAttribute("nameError", nameError); // 이름
	        model.addAttribute("emailError", emailError); //이메일
	        model.addAttribute("phoneError", phoneError); //폰
	        model.addAttribute("birthError", birthError); //생년월일	
	        model.addAttribute("user", user); // 입력값 유지
	        
    	        // 검증 실패
    	        return "member/joinus/join.htm";
    	    }
    	 
    	 try {
    	        user.setBirthDate(birthYear, birthMonth, birthDay);
    	    } catch (ParseException e) {    	      
    	        return "member/joinus/join.htm";
    	    }

        try {
            memberService.registerUser(user);
            model.addAttribute("user", user); // 입력값 유지
            return "member/joinus/join_complete";
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("errorMessage", "회원가입 처리 중 오류가 발생했습니다.");
            return "member/joinus/join"; // 실패
        }
    }
    
    
}//class

