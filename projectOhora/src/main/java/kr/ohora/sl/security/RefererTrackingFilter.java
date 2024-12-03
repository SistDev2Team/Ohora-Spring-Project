package kr.ohora.sl.security;

import java.io.IOException;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;
import org.springframework.web.filter.OncePerRequestFilter;

@Component
public class RefererTrackingFilter extends OncePerRequestFilter {

    @Override
    protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain filterChain)
            throws ServletException, IOException {

        // 현재 요청 URL 생성
        String currentUrl = request.getRequestURL().toString();
        String queryString = request.getQueryString(); // URL 쿼리 스트링 포함
        if (queryString != null) {
            currentUrl += "?" + queryString;
        }

        // 세션 가져오기
        HttpSession session = request.getSession(true);

        // *****제외할 경로***** 정적 리소스 제외 필수
        //request.getUserPrincipal() == null
        //PRE_LOGIN_URL : http://localhost:8011/member/joinus/findid.htm
        ///verifyCode.ajax 가 외 잡혀요???????????
        if (!currentUrl.contains("/login") && 
            !currentUrl.contains("/resources/") && 
            !currentUrl.contains("/web/upload/") && 
            !currentUrl.contains("/member/joinus")&&
            !currentUrl.contains("/verifyCode.ajax")&&           
            !currentUrl.contains("/sendVerificationCode.ajax")&&           
            !currentUrl.endsWith(".jpg") && 
            !currentUrl.endsWith(".png") && 
            !currentUrl.endsWith(".css") && 
            !currentUrl.endsWith(".js") &&
            !currentUrl.contains("/favicon.ico") &&
            !currentUrl.contains("/verifyAuthCode.ajax")&&
            !currentUrl.contains("/review")
            ){
            
            session.setAttribute("PRE_LOGIN_URL", currentUrl);
        }

        // 다음 필터로 요청 전달
        filterChain.doFilter(request, response);
    }
}

/*
String uri = request.getRequestURI();
if (uri.startsWith("/admin")) {
    // 관리자 경로 처리
}
getRequestURI()와 getQueryString()을 조합하면, 호스트 정보가 없는 전체 경로 구성 가능
String uri = request.getRequestURI();
String queryString = request.getQueryString();
if (queryString != null) {
    uri += "?" + queryString;
}
log.info("Full URI: " + uri);
요청 URL: http://localhost:8080/product/list?cate_no=44&currentPage=1.
출력 값: /product/list?cate_no=44&currentPage=1.

request.getRequestURL()
URL에 호스트 정보(http://localhost:8080)가 필요하면 사용.
쿼리 문자열은 별도로 추가해야 함.

request.getRequestURI()
URL **경로(path)**만 필요하면 사용.
쿼리 문자열은 별도로 추가해야 함.

request.getQueryString()
쿼리 문자열만 필요하면 사용.
전체 URL을 저장하려면:
getRequestURL() + getQueryString() 또는 getRequestURI() + getQueryString()을 조합
*/


