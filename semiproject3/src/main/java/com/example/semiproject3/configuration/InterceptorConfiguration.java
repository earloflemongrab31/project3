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
               .addPathPatterns(//인터셉터가 감시할 주소 / 회원만 통과
                  "/address/**",
                     "/buy/**",
                     "/cart/**",
                     "/center/**",
                     "/company/**",
                     "/customer/**",
                     "/customerLike/**",
                     "/item/**",
                     "/notice/**",
                     "/orders/**",
                     "/research/**",
                     "/review/**"
                     )
               .excludePathPatterns(//위의 주소에서 제외할 주소(비회원 확인 가능)
                   "/center/list", // Q&A 목록
                     "/customer/insert",//회원가입
                     "/customer/login",//로그인
                     "/customer/insertSuccess",//회원가입 성공
                     "/customer/insert_success",//회원가입 성공
                     "/customer/checkPassword",//비밀번호찾기
                     "/customer/changePassword",//비밀번호찾기 후 변경
                     "/customer/goodbye_result", // 회원탈퇴 완료
                     "/item/bestlist", // 상품 best6
                     "/item/buydetail", // 상품 상세
                     "/item/buylist",// 상품 목록
                     "/notice/list", // 공지사항 목록
                     "/notice/detail" // 공지사항 상세
                     );
      
      
      //관리자용 인터셉터
      registry.addInterceptor(adminInterceptor)
               .addPathPatterns(//인터셉터가 감시할 주소  // 관리자만통과
//               "/admin/**",
                  "/admin/",
                  "/admin/buyDetail",
                  "/admin/buyList",
                  "/admin/edit",
                  "/admin/home",
                  "/admin/insert",
                  "/admin/list",
                  "/admin/mainEdit",
                  "/center/edit",
                    "/company/**",
                    "/customer/list",
                    "/customer/edit",
                    "/item/detail",
                    "/item/insert",
                    "/item/list",
                    "/item/update",
                    "/notice/edit",
                    "/notice/insert",
                    "/orders/list",
                    "/research/list",
                    "/research/listChart",
                    "/review/reportList",
                    "/warehouse/**"
                    );
   }
}