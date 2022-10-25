package com.example.semiproject3.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.semiproject3.constant.SessionConstant;
import com.example.semiproject3.error.TargetNotFoundException;
import com.example.semiproject3.repository.AddressDao;

@Controller
@RequestMapping("/address")

public class AddBasicController {
   
   @Autowired
   private AddressDao addressDao;
   
   @GetMapping("/addBasic")
   // 기본주소 리스트 출력
   public String addBasic(Model model, HttpSession session,
               @RequestParam(required = false) String type,
               @RequestParam(required = false) String keyword) {
      boolean isSearch = type != null && keyword != null;
      if(isSearch) { // 검색
         model.addAttribute("list", addressDao.selectList(type, keyword));
      }
      else { //목록
         model.addAttribute("list", addressDao.selectList());
      }
      
      String loginId = (String)session.getAttribute(SessionConstant.ID);
      model.addAttribute("selectAddressList", addressDao.selectAddressList(loginId, 1, 10));
      
      return "address/addBasic";
   }
   
   //기본정보 업데이트
   @PostMapping("/addBasic")
   public String basicUpdate(@RequestParam(value="addressNo[]") List<Integer> addressNo, @RequestParam(value="addressBasic") String addressBasic) {
//	   System.out.println(addressNo.get(0));
//	   System.out.println(addressBasic);
	   boolean result = false;
	   for(int i = 0; i < addressNo.size(); i++) {
    	 result = addressDao.addBasic(addressNo.get(i),addressBasic);
    		if(result) {
//    			System.out.println("통과체크");
    		addressDao.addBasicUpdate(addressNo.get(i));
    		}
	   }
           if(result) {   
         return "redirect:addBasic";
      }
      else {
         throw new TargetNotFoundException("주소 없음");
      }
   }
   
}