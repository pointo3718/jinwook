package com.jinwook.home.configuration;

import java.util.Arrays;
import java.util.List;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.jinwook.home.interceptor.LoggerInterceptor;

//주로 로그인이나 인증과 같은 부분을 처리할 때 사용, 로그 출력
@Configuration
public class MvcConfiguration implements WebMvcConfigurer {

	private static final List<String> URL_PATTERNS = (List<String>) Arrays.asList("/board/*", "/admin/*", "/user/*");  //인터셉터가 동작 해야 될 요청 주소 mapping 목록

	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(new LoggerInterceptor()).addPathPatterns(URL_PATTERNS)
		.excludePathPatterns("/css/**", "/fonts/**", "/plugin/**", "/scripts/**");
	}
	
	
	@Bean
	public CommonsMultipartResolver multipartResolver() {
		CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver();
		multipartResolver.setDefaultEncoding("UTF-8"); // 파일 인코딩 설정
		multipartResolver.setMaxUploadSizePerFile(5 * 1024 * 1024); // 파일당 업로드 크기 제한 (5MB)
		return multipartResolver;
	}


	
	
}
