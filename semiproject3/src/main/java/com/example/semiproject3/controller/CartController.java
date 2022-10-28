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
	
//	@ResponseBody
//	@GetMapping("/cartInsert")
//	public String cartInsert(
//			@RequestParam int itemNo,
//			HttpSession session	) {
//
//		String result = "00";
//		
//		System.out.println("/cartInsert ================"+ itemNo);		
//		
//		//Cart db insert
//			
//		
//		
//		//result =="00" 성공 result =="01" 동일아이템 중복
//		return result;
//	}
	
	//카트담기
	@PostMapping("/insert")
	public String insert(@RequestParam int itemNo,
			@ModelAttribute CartDto cartDto) {
		boolean search = cartDao.selectOne(cartDto) == null;
		
		if(search) {
			cartDao.insert(cartDto);
		}
		else {
			cartDao.plus(cartDto);
		}
		//cartDto에 정보 삽입
//			CartDto cartDto=new CartDto();
//			cartDto.setCustomerId(loginId);
//			cartDto.setItemNo(itemNo);
//			cartDto.setItemName(itemDto.getItemName());
//			cartDto.setItemPrice(itemDto.getItemPrice());
//			cartDto.setItemColor();
//			cartDto.setItemSize(itemSize);
//			cartDto.setItemCnt(itemCnt);
		
		return "redirect:/item/buydetail?itemNo="+itemNo;
	};
	
	//카트 리스트
	@GetMapping("/cartList")
	public String cartList(Model model, HttpSession session) {
		//아이디가지고오기 
		String loginId = (String) session.getAttribute(SessionConstant.ID);
		model.addAttribute("cartList",cartDao.selectList(loginId));
	
		return "cart/cartList";
	}
	
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
