package com.example.semiproject3.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.semiproject3.constant.SessionConstant;
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
		model.addAttribute("cart",cartDao.selectList(loginId));
		model.addAttribute("cartCount",cartDao.selectCart(loginId));
		return "cart/cartList";
	}
}
