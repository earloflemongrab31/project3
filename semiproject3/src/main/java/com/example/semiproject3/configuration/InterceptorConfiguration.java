package com.example.semiproject3.configuration;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.example.semiproject3.interceptor.AdminInterceptor;
import com.example.semiproject3.interceptor.CustomerInterceptor;
import com.example.semiproject3.interceptor.CustomerNoticePermissionCheckInterceptor;

//스프링 설정파일
//- application.properties에서 설정하기 어려운 복잡한 설정을 interface WebMvcConfigurer
@Configuration
public class InterceptorConfiguration implements WebMvcConfigurer{
	
	@Autowired
	private CustomerInterceptor customerInterceptor;
	
	@Autowired
	private AdminInterceptor adminInterceptor;
	
	@Autowired
	private CustomerNoticePermissionCheckInterceptor permissionCheckInterceptor;
	
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		//registry에 추가하여 인터셉터가 작동하도록 설정
		//(참고) 등록 코드 작성 순으로 실행됨
		
		
		//회원용 인터셉터
		registry.addInterceptor(customerInterceptor)
					.addPathPatterns(//인터셉터가 감시할 주소
							"/customer/**",//회원 전체
							"/notice/**"//공지사항 전체
					)
					.excludePathPatterns(//위의 주소에서 제외할 주소
							"/customer/join*",//회원가입
							"/customer/login",//로그인
							"/customer/goodbye_result",//탈퇴완료
							"/notice/list",//공지사항 목록
							"/notice/detail"//공지사항 상세보기
					);
		
		//관리자용 인터셉터
				registry.addInterceptor(adminInterceptor)
							.addPathPatterns(//인터셉터가 감시할 주소
								"/guestbook/edit*",//방명록 수정페이지
								"/guestbook/delete",//방명록 삭제페이지
								"/customer/list",//회원목록
								"/customer/detail",//회원상세
								"/customer/edit*",//회원수정
								"/member/goodbye",//회원삭제
								"/admin/**"//관리자기능
							)
							.excludePathPatterns(//위의 주소에서 제외할 주소
							);
		
		
		//관리자만 공지사항을 등록할 수 있도록 검사하는 인터셉터
				registry.addInterceptor(permissionCheckInterceptor)
							.addPathPatterns(
									"/notice/edit", 
									"/notice/write"
							);
				
	}
}
 





