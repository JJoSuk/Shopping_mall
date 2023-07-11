package kr.ezen.bbs.interceptor;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginInterceptor extends HandlerInterceptorAdapter {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        System.out.println("Login Interceptor ~~~~");

        HttpSession session = request.getSession();
        Object loginDto = session.getAttribute("loginDto");

        // 로그인이 안된 경우
        if (loginDto == null) {
            response.sendRedirect(request.getContextPath() + "/member/login.do?prevUrl="+request.getRequestURL()
            +"?"+request.getQueryString());
            return false; // 흐름 중단
        }

        return true;
    }
}
