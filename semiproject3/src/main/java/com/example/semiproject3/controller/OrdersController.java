package com.example.semiproject3.controller;

import java.util.Arrays;

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
import com.example.semiproject3.entity.OrdersDto;
import com.example.semiproject3.repository.AddressDao;
import com.example.semiproject3.repository.CartDao;
import com.example.semiproject3.repository.CustomerDao;
import com.example.semiproject3.repository.ItemDao;
import com.example.semiproject3.repository.OrdersDao;
import com.example.semiproject3.vo.OrdersListSearchVO;

@Controller
@RequestMapping("/orders")
public class OrdersController {

	@Autowired
	private OrdersDao ordersDao;
		
	@Autowired
	private AddressDao addressDao;
	
	@Autowired
	private CustomerDao customerDao;
	
	@Autowired
	private ItemDao itemDao;
	
	@Autowired
	private CartDao cartDao;
	
	
	@PostMapping("/detail")
	public String list(
			@RequestParam String itemName,
			@RequestParam String[] itemSize,
			@RequestParam String[] itemColor,
			@RequestParam int[] itemCnt,
			@ModelAttribute OrdersDto ordersDto,
			@RequestParam(required=false) int[] cartNo,
			@ModelAttribute CartDto cartDto,
			Model model, 
			HttpSession session) {
		
		//아이디가지고오기
		String loginId = (String)session.getAttribute(SessionConstant.ID);
		if(ordersDao.selectList(loginId) != null) {
			ordersDao.deleteAll(loginId);
		}
		
		//주문 테이블 값 넣기
		for(int i=0; i < itemColor.length; i++) {
			boolean search = ordersDao.selectOne(OrdersDto.builder()
											.itemNo(ordersDto.getItemNo())
											.itemName(ordersDto.getItemName())
											.itemColor(itemColor[i])
											.itemSize(itemSize[i])
											.customerId(loginId)
						.build()) == null;
			
			boolean cartSearch = cartDao.selectOne(CartDto.builder()
											.itemNo(cartDto.getItemNo())
											.itemSize(itemSize[i])
											.itemColor(itemColor[i])
											.customerId(loginId)
						.build()) == null;
			
			if(search) {
				ordersDao.insert(OrdersDto.builder()
								.ordersNo(ordersDto.getOrdersNo())
								.customerId(loginId)
								.itemNo(ordersDto.getItemNo())
								.itemName(itemName)
								.itemPrice(ordersDto.getItemPrice())
								.itemColor(itemColor[i])
								.itemSize(itemSize[i])
								.itemCnt(itemCnt[i])
								.imageNo(ordersDto.getImageNo())
						.build());
				
			}
			else {
				ordersDao.plus(OrdersDto.builder()
//								.ordersNo(ordersDto.getOrdersNo())
								.customerId(loginId)
								.itemNo(ordersDto.getItemNo())
//								.itemName(ordersDto.getItemName())
//								.itemPrice(ordersDto.getItemPrice())
								.itemColor(itemColor[i])
								.itemSize(itemSize[i])
								.itemCnt(itemCnt[i])
//								.imageNo(ordersDto.getImageNo())
						.build());
			}
			if(!cartSearch && cartNo != null) {
				System.out.println(cartDao);
				System.out.println(Arrays.toString(cartNo));
				cartDao.delete(cartNo[i]);
			}
		}
		
		//회원 정보 불러오기
		model.addAttribute("customerDto", customerDao.selectOne(loginId));

		//주소 정보 불러오기
		model.addAttribute("addressList", addressDao.selectList(loginId));
		
		//주문 내역 불러오기
		model.addAttribute("ordersList", ordersDao.selectList(loginId));
		
		//장바구니 개수
		model.addAttribute("cartCount",cartDao.cartCount(loginId));
		
		return "orders/detail";
	}
	
	
	
	//페이징처리
	@GetMapping("/list")
	public String list(Model model, 
			@ModelAttribute(name="vo") OrdersListSearchVO vo) {

		//페이지 네비게이터를 위한 게시글 수를 전달
		int count = ordersDao.count(vo);
		vo.setCount(count);
		
		model.addAttribute("list", ordersDao.selectList(vo));
		
		return "orders/list";
	}
	
	//삭제
	@GetMapping("/delete")
	public String delete(Model model,
			@RequestParam int ordersNo,HttpSession session) {
		//주문 내역 불러오기
		String loginId = (String) session.getAttribute(SessionConstant.ID);
		model.addAttribute("ordersList", ordersDao.selectList(loginId));
		
		ordersDao.delete(ordersNo);
		
		return "redirect:detail";
	}

	@GetMapping("/delete-all")
	public String deleteAll(HttpSession session) {
		String loginId = (String) session.getAttribute(SessionConstant.ID);
		ordersDao.deleteAll(loginId);
		return "redirect:/";
	}
	
}