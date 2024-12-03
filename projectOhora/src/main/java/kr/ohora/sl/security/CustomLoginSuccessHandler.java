package kr.ohora.sl.security;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.savedrequest.SavedRequest;
import org.springframework.stereotype.Component;

import lombok.extern.log4j.Log4j;

@Component("customLoginSuccessHandler")
@Log4j
public class CustomLoginSuccessHandler implements AuthenticationSuccessHandler {

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
	                                    Authentication authentication) throws IOException, ServletException {
		
		//우선순위: SavedRequest → PRE_LOGIN_URL → 기본 URL 
		
	    HttpSession session = request.getSession(false);
	    String redirectUrl = request.getContextPath() + "/oho_main.htm"; // 3. 기본 URL
	    
	    if (session != null) {
	    	
	        // 1. SavedRequest 확인
	        SavedRequest savedRequest = (SavedRequest) session.getAttribute("SPRING_SECURITY_SAVED_REQUEST");
	        
	        log.info("세션에 저장된 savedRequest : " + savedRequest);
	        
	        if (savedRequest != null) {
	            redirectUrl = savedRequest.getRedirectUrl(); // SavedRequest URL 사용 ( Spring에서 자동 제거)
	        } else {
	            // 2. PRE_LOGIN_URL 확인
	            String preLoginUrl = (String) session.getAttribute("PRE_LOGIN_URL");
	            log.info("세션에 저장된 PRE_LOGIN_URL : " + preLoginUrl);

	            if (preLoginUrl != null && preLoginUrl.startsWith(request.getContextPath()) &&
	                !preLoginUrl.contains("/web/upload/") && 
	                !preLoginUrl.endsWith(".jpg") && 
	                !preLoginUrl.endsWith(".png")&&
	                !preLoginUrl.endsWith(".js")) {
	                
	                redirectUrl = preLoginUrl; // 유효한 경우 리다이렉트 URL로 설정
	            }

	            session.removeAttribute("PRE_LOGIN_URL"); // 사용 후 제거(수동 제거 필요)
	        }
	    }

	    log.info("최종 리다이렉트 URL: " + redirectUrl);
	    response.sendRedirect(redirectUrl);
	}

}
/*
인증이 필요한 URL로 접근 → 로그인 성공 → SavedRequest URL로 리다이렉트.
인증이 필요 없는 URL로 접근 → 로그인 성공 → PRE_LOGIN_URL로 리다이렉트.
이전 URL 정보가 없는 경우 → /oho_main.htm로 리다이렉트.
*/
