package kr.ohora.sl;

import java.sql.SQLException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import kr.ohora.sl.service.admin.AdminService;
import kr.ohora.sl.service.member.MemberService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@RestController
@RequiredArgsConstructor
@Log4j
public class AjaxController {
	
	 private static final long VALID_DURATION = 3 * 60 * 1000; // 인증번호 유효 시간 (3분)
	
	 private final MemberService memberService;
	 
	 @Autowired
	 private AdminService adminService;
	 
	 @GetMapping(value = "/checkDuplicate.ajax")
	    public ResponseEntity<Map<String, String>> checkDuplicate(
	            @RequestParam("type") String type,
	            @RequestParam("value") String value) {
		  
	        Map<String, String> response = new HashMap<>();
	        
	        boolean isDuplicate = false;
	        
			try {
				
				log.info("Received request: type=" + type + ", value=" + value);
				
				isDuplicate = memberService.isDuplicate(type, value);
				
				log.info("isDuplicate result: " + isDuplicate);
			} catch (SQLException e) {
				
				e.printStackTrace();
			}

	        // 응답 데이터 구성
	        response.put("status", isDuplicate ? "duplicate" : "available");
	        return ResponseEntity.ok(response); 
	    }
	 
	    // 인증번호 전송 로직
	    @GetMapping(value = "/sendAuthCode.ajax")
	    public ResponseEntity<Map<String, String>> sendAuthCode(@RequestParam("phone") String phone, HttpSession session) {
	        log.info("Received phone number for verification: " + phone);

	        // 인증번호 생성
	        String verificationCode = String.format("%06d", new Random().nextInt(1000000));
	        log.info("생성된 인증 번호: " + verificationCode);

	        // 인증번호 및 생성 시간을 세션에 저장
	        session.setAttribute("verificationCode", verificationCode);
	        session.setAttribute("generationTime", new Date());

	        // 전송 성공 여부와 메시지 구성 (실제 전송 로직은 생략)
	        Map<String, String> response = new HashMap<>();
	        response.put("status", "success");
	        response.put("message", "인증번호가 전송되었습니다.");

	        return ResponseEntity.ok()
	        	    .contentType(MediaType.APPLICATION_JSON)
	        	    .body(response);
	    }
	    
	    @PostMapping("/verifyAuthCode.ajax")
	    public ResponseEntity<Map<String, String>> verifyAuthCode(@RequestParam("authCode") String authCode, HttpSession session) {
	    	log.info("Received authCode for verification: " + authCode);
	    	
	        Map<String, String> response = new HashMap<>();

	        // 세션에서 저장된 인증번호와 생성 시간 가져오기
	        String storedCode = (String) session.getAttribute("verificationCode");
	        Date generationTime = (Date) session.getAttribute("generationTime");

	        if (storedCode == null || generationTime == null) {
	        	log.error("인증번호가 세션에 저장되지 않았습니다.");
	            // 인증번호 요청이 없는 경우
	            response.put("status", "error");
	            response.put("message", "인증번호가 요청되지 않았습니다.");
	        } else {
	            long currentTime = new Date().getTime();
	            long timeElapsed = currentTime - generationTime.getTime();

	            if (timeElapsed > VALID_DURATION) {
	                // 인증번호 만료
	                response.put("status", "error");
	                response.put("message", "인증번호가 만료되었습니다. 다시 요청해 주세요.");

	                // 세션에서 인증번호와 생성 시간 제거
	                session.removeAttribute("verificationCode");
	                session.removeAttribute("generationTime");
	            } else if (storedCode.equals(authCode)) {
	                // 인증 성공
	                response.put("status", "success");
	                response.put("message", "인증이 완료되었습니다.");

	                // 인증 후 세션 데이터 제거
	                session.removeAttribute("verificationCode");
	                session.removeAttribute("generationTime");
	            } else {
	                // 인증번호 불일치
	                response.put("status", "error");
	                response.put("message", "인증번호가 올바르지 않습니다.");
	            }
	        }

	        return ResponseEntity.ok()
	        	      .contentType(MediaType.APPLICATION_JSON)
	        	      .body(response);
	    }
	    
	 // 관리자페이지 상품삭제
	 @PostMapping("/adminProduceDelete.ajax")
	 public ResponseEntity<?> deleteProducts(@RequestParam("productIds[]") List<Integer> productIds) {
		 log.info("삭제된 상품: " + productIds);
         try {
            int deletedCount = adminService.deleteProducts(productIds);

            if (deletedCount == productIds.size()) {
                return ResponseEntity.ok().body("{\"success\": true}");
            } else {
                return ResponseEntity.status(HttpStatus.PARTIAL_CONTENT)
                        .body("{\"success\": false, \"message\": \"일부 상품 삭제에 실패했습니다.\"}");
            }

        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                    .body("{\"success\": false, \"message\": \"서버 오류가 발생했습니다.\"}");
        }
    }
	
}//class
