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
import com.example.semiproject3.repository.CartDao;
import com.example.semiproject3.repository.CustomerDao;
import com.example.semiproject3.repository.ItemDao;
import com.example.semiproject3.vo.CartListVO;

@Controller
@RequestMapping("/cart")
public class CartController {
	
	@Autowired
	private CartDao cartDao;
	
	//카트담기
	@PostMapping("/insert")
	public String insert(
			@ModelAttribute CartListVO cartListVO,
			@RequestParam String[] itemColor,
			@RequestParam String[] itemSize,
			@RequestParam int[] itemTotalCnt,
			@RequestParam int[] itemCnt,
			HttpSession session) {
		
		//아이디가지고오기 
		String loginId = (String) session.getAttribute(SessionConstant.ID);
		
		cartListVO.setCustomerId(loginId);
		
		for(int i = 0; i < itemColor.length; i++) {
			cartListVO.setItemColor(itemColor[i]);
			cartListVO.setItemSize(itemSize[i]);
			cartListVO.setItemTotalCnt(itemTotalCnt[i]);
			cartListVO.setItemCnt(itemCnt[i]);
			
			boolean search = cartDao.selectOne(cartListVO) == null;
			
			if(search) {
				cartDao.insert(cartListVO);
			}
			else {
				cartDao.plus(cartListVO);
			}
		}
		
		return "redirect:/item/buydetail?itemNo="+cartListVO.getItemNo();
	};
	
	//카트 리스트
	@GetMapping("/cartList")
	public String cartList(Model model, HttpSession session) {
		//아이디가지고오기 
		String loginId = (String) session.getAttribute(SessionConstant.ID);
		
		//장바구니 리스트
		model.addAttribute("cartList",cartDao.selectList(loginId));
		
		//장바구니 개수
		model.addAttribute("cartCount",cartDao.cartCount(loginId));
		return "cart/cartList";
	}
	
	//카트 삭제
	@GetMapping("/delete")
	public String delete(Model model,
			@RequestParam int cartNo,
			HttpSession session	) {
		//아이디 가지고 오기 
		String loginId = (String) session.getAttribute(SessionConstant.ID);
		model.addAttribute("cartList",cartDao.selectList(loginId));
		
		cartDao.delete(cartNo);
		
		return "redirect:cartList";
		
	}

}