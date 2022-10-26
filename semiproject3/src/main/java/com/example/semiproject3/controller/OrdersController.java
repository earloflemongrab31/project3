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
import com.example.semiproject3.entity.OrdersDto;
import com.example.semiproject3.repository.AddressDao;
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
	
	//등록
	
	@GetMapping("/insert")
	public String insert() {
		return "orders/insert()";
	}
	
	@PostMapping("/insert")
	public String insert(
			HttpSession session,
			@ModelAttribute OrdersDto ordersDto,
			@RequestParam int itemCnt,
			RedirectAttributes attr
			){
			String loginId = (String) session.getAttribute(SessionConstant.ID);
			
			//DB저장
			int ordersNo = ordersDao.sequence();	
			//CustomerDto customerDto = customerDao.selectOne(loginId);
			//AddressDto addressDto = addressDao.selectOne(loginId);
			ordersDto.setOrdersNo(ordersNo);
			ordersDao.insert(ordersDto);
			attr.addAttribute("ordersDto", ordersDto.getOrdersNo());
			
			
			
		return "orders/insert";
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
	public String delete(@RequestParam int itemNo,HttpSession session) {
	
	String loginId = (String) session.getAttribute(SessionConstant.ID);
	OrdersDto ordersDto = new OrdersDto();
	ordersDto.setCustomerId(loginId);
	ordersDto.setItemNo(itemNo);
	ordersDao.delete(ordersDto);
		return "redirect:orders/list";
	}
	
	
	
//	@GetMapping("/address")
//	public String address(@ModelAttribute AddressDto addressDto, HttpSession session) {
//	String loginId = (String) session.getAttribute(SessionConstant.ID);
//	OrdersDto ordersDto = new OrdersDto();
//	ordersDto.setCustomerId(loginId);
//	ordersDto.setAddressNo(0);
//	
//		return "orders/address";
	

}