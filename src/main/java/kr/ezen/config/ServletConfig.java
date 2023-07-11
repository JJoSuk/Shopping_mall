package kr.ezen.config;

import kr.ezen.bbs.interceptor.*;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.multipart.MultipartResolver;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.config.annotation.*;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

//servlet-context.xml 대체
@Configuration
@EnableWebMvc
@ComponentScan(basePackages= {"kr.ezen.bbs2", "kr.ezen.controller"})
public class ServletConfig implements WebMvcConfigurer{
	private final int MAX_SIZE = 10*1024*1024;
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {		
		registry.addResourceHandler("/**").addResourceLocations("/resources/");
	}
	
	@Override
	public void configureViewResolvers(ViewResolverRegistry registry) {
		InternalResourceViewResolver bean = new InternalResourceViewResolver();
		bean.setPrefix("/WEB-INF/views/");
		bean.setSuffix(".jsp");
		registry.viewResolver(bean);
	}

	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		WebMvcConfigurer.super.addInterceptors(registry);

		DemoInterceptor demoInterceptor = new DemoInterceptor();
		InterceptorRegistration interceptorReg1 = registry.addInterceptor(demoInterceptor);

		DemoInterceptor2 demoInterceptor2 = new DemoInterceptor2();
		InterceptorRegistration interceptorReg2 = registry.addInterceptor(demoInterceptor2);

		DemoInterceptor3 demoInterceptor3 = new DemoInterceptor3();
		InterceptorRegistration interceptorReg3 = registry.addInterceptor(demoInterceptor3);

		DemoInterceptor4 demoInterceptor4 = new DemoInterceptor4();
		InterceptorRegistration interceptorReg4 = registry.addInterceptor(demoInterceptor4);

		interceptorReg1.addPathPatterns("/itc01");
		interceptorReg2.addPathPatterns("/itc01");

		interceptorReg3.addPathPatterns("/itc01", "/itc02");
//		interceptorReg4.addPathPatterns("/aa/itc03", "/aa/itc04");
//		interceptorReg4.addPathPatterns("/aa/*");
		interceptorReg4.addPathPatterns("/**");
//		interceptorReg4.addPathPatterns("/*");

		///////////// 로그인 인터셉터 /////////////
		LoginInterceptor loginInterceptor = new LoginInterceptor();
		InterceptorRegistration loginReg = registry.addInterceptor(loginInterceptor);

//		loginReg.addPathPatterns("/board/list.do");
		loginReg.addPathPatterns("/board/view.do");

	}

	@Bean
	public MultipartResolver multipartResolver() {
		CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver();
		multipartResolver.setMaxUploadSize(MAX_SIZE);
		multipartResolver.setMaxUploadSizePerFile(MAX_SIZE);
		multipartResolver.setMaxInMemorySize(0);
		
		return multipartResolver;
	}
	
	
}
