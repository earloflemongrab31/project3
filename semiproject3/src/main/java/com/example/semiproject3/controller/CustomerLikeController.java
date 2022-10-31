package com.example.semiproject3.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.semiproject3.constant.SessionConstant;
import com.example.semiproject3.repository.CartDao;
import com.example.semiproject3.repository.CustomerLikeDao;
import com.example.semiproject3.vo.CustomerListSearchVO;


@Controller
@RequestMapping("/customerLike")
public class CustomerLikeController {
	
	@Autowired
	private CustomerLikeDao customerLikeDao;
	
	@Autowired
	private CartDao cartDao;
	
//	@GetMapping("/list")
//	public String list(Model model,HttpSession session) {
//		String loginId = (String) session.getAttribute(SessionConstant.ID);
//	//	System.out.println(loginId);
//		
//	
//		model.addAttribute("list", customerLikeDao.selectList(loginId));
//		  
//		  return "customerLike/list";
//		  

	//페이징처리
	@GetMapping("/list")
	public String list(Model model,HttpSession session,
			@ModelAttribute(name="vo") CustomerListSearchVO vo) {
		
		int count = customerLikeDao.count(vo);
		vo.setCount(count);
		
		String loginId = (String) session.getAttribute(SessionConstant.ID);
		
		model.addAttribute("list",customerLikeDao.selectList(loginId));
		model.addAttribute("list",customerLikeDao.selectList(vo));
		model.addAttribute("param",vo);
		
		//장바구니 개수
		model.addAttribute("cartCount",cartDao.cartCount(loginId));
		
		return "customerLike/list";
		
	}
	
	
	
}
