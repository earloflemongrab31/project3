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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.semiproject3.constant.SessionConstant;
import com.example.semiproject3.entity.BuyDto;
import com.example.semiproject3.repository.BuyDao;
import com.example.semiproject3.repository.CartDao;
import com.example.semiproject3.repository.CustomerDao;
import com.example.semiproject3.repository.OrdersDao;

@Controller
@RequestMapping("/buy")
public class BuyController {
	
	@Autowired
	private BuyDao buyDao;
	
	@Autowired
	private OrdersDao ordersDao;
	
	@Autowired
	private CartDao cartDao;
	
	@Autowired
	private CustomerDao customerDao;
	
	@PostMapping("/insert")
	public String insert(
			@ModelAttribute BuyDto buyDto,
			@RequestParam String[] itemSize,
			@RequestParam String[] itemColor,
			@RequestParam String[] itemName,
			@RequestParam int[] itemCnt,
			@RequestParam int[] imageNo,
			@RequestParam int[] itemNo,
			@RequestParam int[] ordersNo,
			HttpSession session) {
		//주문 완료 시 구매 테이블 삽입
		for(int i=0; i<itemSize.length; i++) {
			buyDto.setItemSize(itemSize[i]);
			buyDto.setItemColor(itemColor[i]);
			buyDto.setItemName(itemName[i]);
			buyDto.setItemCnt(itemCnt[i]);
			buyDto.setImageNo(imageNo[i]);
			buyDto.setItemNo(itemNo[i]);
			buyDao.insert(buyDto);
			ordersDao.delete(ordersNo[i]);
		}
		
		//회원 돈 차감
		customerDao.cash(buyDto);
		
		return "redirect:success";
	}
	
	@GetMapping("/success")
	public String success(Model model, HttpSession session) {
		//장바구니 개수
		String loginId = (String) session.getAttribute(SessionConstant.ID);
		model.addAttribute("cartCount",cartDao.cartCount(loginId));
		return "buy/success";
	}
	
	//구매 목록 및 검색 회원용
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
		
		//장바구니 개수
		model.addAttribute("cartCount",cartDao.cartCount(loginId));
		
		return "/customer/buyHistory";
	}
	
	//구매 목록 관리자용
	@GetMapping("/admin-buylist")
	public String adminBuylist(Model model) {
		model.addAttribute("buyList", buyDao.selectListAll());
		
		return "/admin/buyList";
	}

	//구매 목록 관리자용
	@GetMapping("/admin-buydetail")
	public String adminBuydetail(
			@RequestParam int buyNo,
			Model model) {
		model.addAttribute("buyDto", buyDao.selectOne(buyNo));
		
		return "/admin/buyDetail";
	}
	
	@PostMapping("/update")
	public String update(
			@RequestParam int buyNo,
			@RequestParam String deliveryStatus,
			RedirectAttributes attr) {
		
		buyDao.update(buyNo, deliveryStatus);
		
		attr.addAttribute("buyNo", buyNo);
		
		return "redirect:admin-buydetail";
	}
}
