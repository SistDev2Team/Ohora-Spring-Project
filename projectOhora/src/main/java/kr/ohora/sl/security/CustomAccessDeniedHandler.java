package kr.ohora.sl.security;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.model;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.web.access.AccessDeniedHandler;
import org.springframework.stereotype.Component;
import org.springframework.ui.Model;

import lombok.extern.log4j.Log4j;

//403 접근 금지 에러를 직접 처리하는 클래스(객체)
@Component  // customAccessDeniedHandler
@Log4j
public class CustomAccessDeniedHandler implements AccessDeniedHandler{
	
	
	
	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response,
			AccessDeniedException accessDeniedExceptionl) throws IOException, ServletException {
		
	      log.error("> Access Denied Handler");
	      log.error("> Redirect...");

			
		response.sendRedirect("/common/accessError.htm");
		
	}  

}
