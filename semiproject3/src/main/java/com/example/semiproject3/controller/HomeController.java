package com.example.semiproject3.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.example.semiproject3.constant.SessionConstant;
import com.example.semiproject3.repository.CartDao;

@Controller
public class HomeController {
	
	@Autowired
	CartDao cartDao;
	
	@GetMapping("/")
	public String home(
			Model model,
			HttpSession session){
			String loginId = (String)session.getAttribute(SessionConstant.ID);
			session.setAttribute("countCart", cartDao.selectCart(loginId));
			return "home";
		}
		
	}
	

