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

		// 1. SavedRequest 가져오기
		HttpSession session = request.getSession(false); // 세션 가져오기
		
		if (session != null) {
			// 세션에서 "SPRING_SECURITY_SAVED_REQUEST"로 SavedRequest 가져오기
			SavedRequest savedRequest = (SavedRequest) session.getAttribute("SPRING_SECURITY_SAVED_REQUEST");

			// 2. Redirect URL 결정
			String redirectUrl = null;

			if (savedRequest != null) {
				
				// SavedRequest가 있는 경우: 원래 요청 URL
				redirectUrl = savedRequest.getRedirectUrl();
			} else {
				// Referer 헤더 확인 보고있던 페이지를 요청
				String refererUrl = request.getHeader("Referer");
				if (refererUrl != null && !refererUrl.contains("login")) {
					redirectUrl = refererUrl;
				}
			}
			// 3. Redirect URL이 없으면 기본 URL로 설정
			if (redirectUrl == null) {
				redirectUrl = request.getContextPath() + "/oho_main.htm";
			}
			// 4. 리다이렉트 처리
			response.sendRedirect(redirectUrl);
		}
	}
}


/*
Referer 헤더 검증
Referer 헤더 값이 외부 도메인에서 오는 경우를 방지하려면, Referer URL이 동일한 도메인을 포함하는지 확인하는 로직 추가를 고려하세요.
*/
