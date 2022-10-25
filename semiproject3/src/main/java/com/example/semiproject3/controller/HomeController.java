package com.example.semiproject3.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.example.semiproject3.constant.SessionConstant;
import com.example.semiproject3.repository.CartDao;

@Controller
public class HomeController {
	
	@Autowired
	CartDao cartDao;
	
//	맥북용
	private final File directory = new File(System.getProperty("user.home")+"/upload/itemImage");
//	화니꼬
//	private final File directory = new File("C:/study/itemImage");
//	D드라이브용
//	private final File directory = new File("D:/study/itemImage");
	
	
	@GetMapping("/")
	public String home(
			Model model,
			HttpSession session){
			String loginId = (String)session.getAttribute(SessionConstant.ID);
			session.setAttribute("countCart", cartDao.selectCart(loginId));
			return "home";
		}
		
	}
	

