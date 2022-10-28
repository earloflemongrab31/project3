package com.example.semiproject3.controller;

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
import com.example.semiproject3.entity.BuyDto;
import com.example.semiproject3.repository.BuyDao;
import com.example.semiproject3.repository.OrdersDao;

@Controller
@RequestMapping("/buy")
public class BuyController {
	
	@Autowired
	private BuyDao buyDao;
	
	@Autowired
	private OrdersDao ordersDao;
	
	@PostMapping("/insert")
	public String insert(
			@ModelAttribute BuyDto buyDto,
			@RequestParam int ordersNo,
			HttpSession session) {
		//주문 완료 시 구매 테이블 삽입
		buyDao.insert(buyDto);
		
		//주문 내역 삭제
		ordersDao.delete(ordersNo);
		
		return "redirect:success";
	}
	
	@GetMapping("/success")
	public String success() {
		return "buy/success";
	}
	
	//구매 목록 및 검색
	@GetMapping("/list")
	public String list(Model model, 
			@RequestParam(required = false) String type,
			@RequestParam(required = false) String keyword,
			HttpSession session) {
		String loginId =(String)session.getAttribute(SessionConstant.ID);
		
		boolean isSearch = type != null && keyword != null;
		if(isSearch) {
			model.addAttribute("buyList", buyDao.selectList(loginId, type, keyword));
		}
		else {
			model.addAttribute("buyList", buyDao.selectList(loginId));
		}
		
		return "/customer/buyHistory";
	}
	
	
}
