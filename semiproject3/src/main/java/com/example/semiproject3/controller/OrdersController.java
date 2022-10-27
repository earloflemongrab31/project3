package com.example.semiproject3.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.semiproject3.constant.SessionConstant;
import com.example.semiproject3.entity.OrdersItemDto;
import com.example.semiproject3.repository.AddressDao;
import com.example.semiproject3.repository.CustomerDao;
import com.example.semiproject3.repository.ItemDao;
import com.example.semiproject3.repository.OrdersDao;
import com.example.semiproject3.repository.OrdersItemDao;

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
	private OrdersItemDao ordersItemDao;
	
	//등록
	@PostMapping("/insert")
	public String insert(
			@ModelAttribute OrdersItemDto ordersItemDto,
			HttpSession session
			){
		
		String loginId = (String)session.getAttribute(SessionConstant.ID);
		
		//원래 있는 내용 삭제
		if(ordersItemDao.selectOrdersItemList(loginId).size() > 0){
			ordersItemDao.delete(loginId);
		};
		
		//구매할 상품 저장
		ordersItemDao.insert(ordersItemDto);
			
		return "redirect:detail";
	}
	
	@GetMapping("/detail")
	public String list(
			Model model, 
			HttpSession session,
			RedirectAttributes attr) {

		//주문번호
		int ordersNo = ordersDao.sequence();
		
		//회원 정보 불러오기
		String loginId = (String)session.getAttribute(SessionConstant.ID);
		ordersDao.insert(ordersNo, loginId);

		model.addAttribute("customerDto", customerDao.selectOne(loginId));

		//주소 정보 불러오기
		model.addAttribute("addressList", addressDao.selectList(loginId));
		
		model.addAttribute("ordersItemList", ordersItemDao.selectOrdersItemList(loginId));
			
		return "orders/detail";
	}
	
//	//목록
//	@GetMapping("/list")
//	public String list(Model model, HttpSession session) {
//		
//		String loginId = (String)session.getAttribute(SessionConstant.ID);
//		model.addAttribute("orders",ordersDao.selectList(loginId));
//		model.addAttribute("oredresCount",ordersDao.selectOrders(loginId));
//		return "orders/list";
//	}
//	
	
	//목록(페이징)
//	@GetMapping("/list")
//	public String list(Model model, 
//			@ModelAttribute(name="vo") OrdersListSearchVO vo) {
//
//		//페이지 네비게이터를 위한 게시글 수를 전달
//		int count = ordersDao.count(vo);
//		vo.setCount(count);
//		
//		model.addAttribute("list", ordersDao.selectList(vo));
//		
//		return "orders/list";
//	}
	
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