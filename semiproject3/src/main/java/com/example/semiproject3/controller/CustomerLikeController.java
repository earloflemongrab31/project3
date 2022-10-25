package com.example.semiproject3.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.semiproject3.constant.SessionConstant;
import com.example.semiproject3.entity.CustomerLikeDto;
import com.example.semiproject3.repository.CustomerLikeDao;


@Controller
@RequestMapping("/customerLike")
public class CustomerLikeController {
	
	@Autowired
	private CustomerLikeDao customerLikeDao;
	
	@GetMapping("/list")
	public String list(Model model,HttpSession session) {
		String loginId = (String) session.getAttribute(SessionConstant.ID);
	//	System.out.println(loginId);
		
	
		model.addAttribute("list", customerLikeDao.selectList(loginId));
		  
		  return "customerLike/list";
		
	}
	
	
	
	
}
