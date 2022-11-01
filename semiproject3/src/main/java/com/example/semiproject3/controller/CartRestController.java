package com.example.semiproject3.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.example.semiproject3.constant.SessionConstant;
import com.example.semiproject3.repository.CartDao;

@CrossOrigin
@RestController
@RequestMapping("/rest/cart")
public class CartRestController {

	@Autowired
	private CartDao cartDao;
	
	@PostMapping("/")
	private String cntPlus (
			@RequestParam int itemCnt,
			@RequestParam int cartNo,
			HttpSession session) {
		
		String loginId = (String)session.getAttribute(SessionConstant.ID);
		
		cartDao.cntPlus(itemCnt, cartNo, loginId);
		
		return "NNNNY";
	}
}