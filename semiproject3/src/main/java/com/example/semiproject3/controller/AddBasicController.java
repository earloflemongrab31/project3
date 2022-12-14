package com.example.semiproject3.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.semiproject3.constant.SessionConstant;
import com.example.semiproject3.entity.AddressDto;
import com.example.semiproject3.error.TargetNotFoundException;
import com.example.semiproject3.repository.AddressDao;
import com.example.semiproject3.repository.CartDao;
import com.example.semiproject3.vo.AddressUniteVO;

@Controller
@RequestMapping("/address")

public class AddBasicController {
   
   @Autowired
   private AddressDao addressDao;
   
   @Autowired
   private CartDao cartDao;
   
   @GetMapping("/addBasic")
   public String addBasic(Model model,HttpSession session,
		   @ModelAttribute(name="vo") AddressUniteVO vo) {
	   
   String loginId = (String) session.getAttribute(SessionConstant.ID);
	   
	int count = addressDao.count(vo, loginId);
	vo.setCount(count);
	
	List<AddressDto>listBasic=addressDao.selectOneBasic(loginId);
	model.addAttribute("listBasic",addressDao.selectOneBasic(loginId));
	model.addAttribute("list",addressDao.selectList(loginId, vo));
	model.addAttribute("param",vo);
	
	//장바구니 개수
	model.addAttribute("cartCount",cartDao.cartCount(loginId));
	  return "address/addBasic"; 
   }
   
   
   
   //기본정보 업데이트
   @PostMapping("/addBasic")
   public String basicUpdate(@RequestParam(value="addressNo[]") List<Integer> addressNo, @RequestParam(value="addressBasic") String addressBasic,
		   HttpSession session) {
	   String loginId = (String) session.getAttribute(SessionConstant.ID);
	   boolean result = false;
	   for(int i = 0; i < addressNo.size(); i++) {
    	 result = addressDao.addBasic(addressNo.get(i),addressBasic);
    		if(result) {
    		addressDao.addBasicUpdate(addressNo.get(i),loginId);
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