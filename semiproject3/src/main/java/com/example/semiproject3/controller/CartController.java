package com.example.semiproject3.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.semiproject3.constant.SessionConstant;
import com.example.semiproject3.entity.CartDto;
import com.example.semiproject3.repository.CartDao;

@Controller
@RequestMapping("/cart")
public class CartController {
	
	@Autowired
	CartDao cartDao;
	
	@GetMapping("/cartList")
	public String cartList(
			Model model,
			HttpSession session) {
		//아이디가지고오기 
		String loginId = (String) session.getAttribute(SessionConstant.ID);
//		model.addAttribute("cart",cartDao.selectList(loginId));
	
		return "cart/cartList";
	}
	
	@ResponseBody
	@GetMapping("/cartInsert")
	public String cartInsert(
			@ModelAttribute CartDto param ,
			HttpSession session	) {

		String result = "00";
		
		System.out.println("/cartInsert ================"+ param);		
		
		//Cart db insert
			
		
		//result =="00" 성공 result =="01" 동일아이템 중복
		return result;
	}
	
	@GetMapping("/delete")
	public String delete(
			@RequestParam int itemNo,
			HttpSession session	) {
		//아이디 가지고 오기 
		String loginId = (String) session.getAttribute(SessionConstant.ID);
		
		CartDto cartDto=new CartDto();
		cartDto.setCustomerId(loginId);
		cartDto.setItemNo(itemNo);
		return "redirect:cartList";
		
	}

}
