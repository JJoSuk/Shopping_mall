package kr.ezen.config;

import org.springframework.security.web.context.AbstractSecurityWebApplicationInitializer;
/*
 xml을 이용하여 시큐리티를 설정할 경우
 DelegatingFilterProxy를 설정해야 함.

 자바로 시큐리티 설정하는 경우에는
 AbstractSecurityWebApplicationInitializer를 상속 받아서
 내부적으로 DelegatingFilterProxy를 등록해줌
*/

public class SecurityInitializer extends AbstractSecurityWebApplicationInitializer {
}
