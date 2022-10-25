package com.example.semiproject3.controller;

import java.io.File;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.example.semiproject3.constant.SessionConstant;
import com.example.semiproject3.repository.CartDao;
import com.example.semiproject3.repository.MainEditDao;
import com.example.semiproject3.repository.MainImageDao;

@Controller
public class HomeController {
	
	@Autowired
	CartDao cartDao;
	
	@Autowired
	private MainImageDao mainImageDao;
	
	@Autowired
	private MainEditDao mainEditDao;
	
	@GetMapping("/")
	public String home(
			Model model,
			HttpSession session
			){
		//장바구니
		String loginId = (String)session.getAttribute(SessionConstant.ID);
		session.setAttribute("countCart", cartDao.selectCart(loginId));
		
		//메인이미지
		model.addAttribute("mainImageList", mainImageDao.selectAll());
		
		//메인내용
		model.addAttribute("mainEditDto", mainEditDao.select());
		return "home";

	}
		
}
	

