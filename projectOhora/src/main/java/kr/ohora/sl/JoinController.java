package kr.ohora.sl;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

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
    
    @GetMapping("login.htm")
    public String loginPage(@RequestParam(value = "error", required = false) String error, Model model) {
    	
    	if (error != null) {
    	    model.addAttribute("loginError", "Invalid username or password.");
    	}
        
        return "member/joinus/login";
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
            return "redirect:/member/joinus/join_complete.htm"; // 성공 시 완료 페이지
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("errorMessage", "회원가입 처리 중 오류가 발생했습니다.");
            return "member/joinus/join"; // 실패
        }
    }
    
    
}//class

