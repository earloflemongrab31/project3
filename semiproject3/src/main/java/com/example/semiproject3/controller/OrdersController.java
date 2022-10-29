package com.example.semiproject3.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.semiproject3.constant.SessionConstant;
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
	
	@GetMapping("/detail")
	public String list(
			@RequestParam String[] itemSize,
			@RequestParam String[] itemColor,
			@RequestParam int[] itemCnt,
			@ModelAttribute OrdersDto ordersDto,
			Model model, 
			HttpSession session) {
		//주문 테이블 값 넣기
		for(int i=0; i<itemSize.length; i++) {
			ordersDto.setItemSize(itemSize[i]);
			ordersDto.setItemColor(itemColor[i]);
			ordersDto.setItemCnt(itemCnt[i]);
			ordersDao.insert(ordersDto);
		}
		
		
		//회원 정보 불러오기
		String loginId = (String)session.getAttribute(SessionConstant.ID);
		model.addAttribute("customerDto", customerDao.selectOne(loginId));

		//주소 정보 불러오기
		model.addAttribute("addressList", addressDao.selectList(loginId));
		
		//주문 내역 불러오기
		model.addAttribute("ordersList", ordersDao.selectList(loginId));
		
		return "orders/detail";
	}
	
//	//목록
//	@GetMapping("/list")
//	public String list(Model model) {
//		
//		model.addAttribute("ordersList",ordersDao.selectList());
//		return "orders/list";
//	}
	
	
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
//	@GetMapping("/delete")
//	public String delete(@RequestParam int itemNo,HttpSession session) {
//	
//	String loginId = (String) session.getAttribute(SessionConstant.ID);
//	OrdersDto ordersDto = new OrdersDto();
//	ordersDto.setCustomerId(loginId);
//	ordersDao.delete(ordersDto);
//		return "redirect:orders/list";
//	}

	
	
//	@GetMapping("/address")
//	public String address(@ModelAttribute AddressDto addressDto, HttpSession session) {
//	String loginId = (String) session.getAttribute(SessionConstant.ID);
//	OrdersDto ordersDto = new OrdersDto();
//	ordersDto.setCustomerId(loginId);
//	ordersDto.setAddressNo(0);
//	
//		return "orders/address";

	
}