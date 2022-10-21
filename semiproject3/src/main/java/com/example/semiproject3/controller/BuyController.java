package com.example.semiproject3.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.semiproject3.entity.BuyDto;
import com.example.semiproject3.repository.BuyDao;

@Controller
@RequestMapping("/buy")
public class BuyController {
	
	@Autowired
	private BuyDao buyDao;
	
	//상품 구매
	@GetMapping("/insert")
	public String insert() {
		return "buy/insert";
	}
	
	@PostMapping("/insert")
	public String insert(@ModelAttribute BuyDto buyDto) {
		
		int buyNo = buyDao.sequence();
		buyDto.setBuyNo(buyNo);
		
		buyDao.insert(buyDto);
		
		return "redirect:list";
	}
	
	//구매 목록 및 검색
	@GetMapping("/list")
	public String list(Model model, 
			@RequestParam(required = false) String type,
			@RequestParam(required = false) String keyword) {
		boolean isSearch = type != null && keyword != null;
		if(isSearch) {
			model.addAttribute("list", buyDao.selectList(type, keyword));
		}
		else {
			model.addAttribute("list", buyDao.selectList());
		}
		
		return "item/buylist";
	}
	
	
}
