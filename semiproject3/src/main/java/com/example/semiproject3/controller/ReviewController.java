package com.example.semiproject3.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.semiproject3.constant.SessionConstant;
import com.example.semiproject3.repository.ReviewDao;

@Controller
@RequestMapping("/review")
public class ReviewController {

	@Autowired
	private ReviewDao reviewDao;
	
	@GetMapping("/insert")
	public String insert(
			@RequestParam int itemNo,
			HttpSession session) {
		String loginId = (String)session.getAttribute(SessionConstant.ID);
		
		return "review/insert";
	}
}
