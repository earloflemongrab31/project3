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
							"/notice/**",//공지사항 전체
							"/item/**",//아이템 전체
							"/warehouse/**",//재고 전체
							"/company/**",//협력사 전체
							"/research/list",//설문조사 목록
							"/review/reportList",//신고목록
							"/center/edit"//고객센터 수정
							
					)
					.excludePathPatterns(//위의 주소에서 제외할 주소
							"/customer/insert*",//회원가입
							"/customer/login",//로그인
							"/customer/checkPassword",//비밀번호찾기
							"/customer/changePw",//비밀번호 변경
							"/customer/buyHistory",//주문/배송조회
							"/customer/goodbyeResult",//탈퇴완료
							"/notice/list",//공지사항 목록
							"/notice/detail",//공지사항 상세보기
							"/item/detail", //아이템 상세
							"/item/insert", //아이템 등록
							"/item/list" //아이템 목록
					);
		
		
		//관리자용 인터셉터
				registry.addInterceptor(adminInterceptor)
							.addPathPatterns(//인터셉터가 감시할 주소
//								"/customer/edit*",//회원수정
								"/customer/goodbye"//회원탈퇴
								
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
 




