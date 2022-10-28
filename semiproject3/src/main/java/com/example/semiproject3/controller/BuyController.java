package com.example.semiproject3.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.semiproject3.entity.BuyDto;
import com.example.semiproject3.repository.BuyDao;

@Controller
@RequestMapping("/buy")
public class BuyController {
	
	@Autowired
	private BuyDao buyDao;
	
//	@Autowired
//	private OrdersDao ordersDao;
	
	@PostMapping("/insert")
	public String insert(@ModelAttribute BuyDto buyDto) {
//		주문 완료 시 주문 테이블 업데이트
//		ordersDao.update(ordersDto);
		
		//주문 완료 시 구매 테이블 삽입
		buyDao.insert(buyDto);
		
		return "redirect:succescc";
	}
	
	@GetMapping("/success")
	public String success() {
		return "buy/success";
	}
	
//	//구매 목록 및 검색
//	@GetMapping("/list")
//	public String list(Model model, 
//			@RequestParam(required = false) String type,
//			@RequestParam(required = false) String keyword) {
//		boolean isSearch = type != null && keyword != null;
//		if(isSearch) {
//			model.addAttribute("list", buyDao.selectList(type, keyword));
//		}
//		else {
//			model.addAttribute("list", buyDao.selectList());
//		}
//		
//		return "item/buylist";
//	}
	
	
}
