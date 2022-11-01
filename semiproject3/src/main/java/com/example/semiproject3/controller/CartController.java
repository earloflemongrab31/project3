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
import com.example.semiproject3.entity.CartDto;
import com.example.semiproject3.repository.CartDao;
import com.example.semiproject3.repository.CustomerDao;
import com.example.semiproject3.repository.ItemDao;

@Controller
@RequestMapping("/cart")
public class CartController {
	
	@Autowired
	private CartDao cartDao;
	
	@Autowired
	private ItemDao itemDao;
	
	@Autowired
	private CustomerDao customerDao;
	
	//카트담기
	@PostMapping("/insert")
	public String insert(
			@ModelAttribute CartDto cartDto,
			@RequestParam String[] itemColor,
			@RequestParam String[] itemSize,
			@RequestParam int[] itemTotalCnt,
			@RequestParam int[] itemCnt,
			HttpSession session) {
		
		//아이디가지고오기 
		String loginId = (String) session.getAttribute(SessionConstant.ID);
		
		cartDto.setCustomerId(loginId);
		
		for(int i = 0; i < itemColor.length; i++) {
			cartDto.setItemColor(itemColor[i]);
			cartDto.setItemSize(itemSize[i]);
			cartDto.setItemTotalCnt(itemTotalCnt[i]);
			cartDto.setItemCnt(itemCnt[i]);
			
			boolean search = cartDao.selectOne(cartDto) == null;
			
			if(search) {
				cartDao.insert(cartDto);
			}
			else {
				cartDao.plus(cartDto);
			}
		}
		
		return "redirect:/item/buydetail?itemNo="+cartDto.getItemNo();
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
	

//	@ResponseBody
//	@GetMapping("/cartInsert")
//	public String cartInsert(
//			@RequestParam int itemNo,
//			HttpSession session	) {
//
//		String result = "00";
//		
//		System.out.println("/cartInsert ================"+ itemNo);		
//		//Card db insert
//		
//		//
//		
//		return result;
//	}

	

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