package com.example.semiproject3.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.semiproject3.constant.SessionConstant;
import com.example.semiproject3.entity.OrdersDto;
import com.example.semiproject3.repository.AddressDao;
import com.example.semiproject3.repository.CustomerDao;
import com.example.semiproject3.repository.ItemDao;
import com.example.semiproject3.repository.OrdersDao;

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
	@GetMapping("insert")
	public String insert() {
		return "orders/insert";
	}
	
	@PostMapping("/insert")
	public String insert(HttpSession session, @RequestParam int itemNo,
			@RequestParam int addressNo, @RequestParam String customerId){
		String loginId = (String) session.getAttribute(SessionConstant.ID);
		OrdersDto ordersDto = new OrdersDto();
		addressDao.selectOne(addressNo);
		itemDao.selectOne(itemNo);
		customerDao.selectOne(customerId);
		
		ordersDto.setCustomerId(loginId);
		ordersDto.setItemNo(itemNo);
		ordersDao.insert(ordersDto);
		return "redirect:/list";
	}
	
	//목록
	@GetMapping("/list")
	public String list(Model model, HttpSession session) {
		String loginId = (String) session.getAttribute(SessionConstant.ID);
		model.addAttribute("orders",ordersDao.selectList(loginId));
		model.addAttribute("ordersCount",ordersDao.selectOrders(loginId));
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
	
	
//	CustomerDto customerdto=customerDao.selectOne(loginId);
//    itemDao.selectOne(itemNo);
//    배송지 
//    
//    OrdersDto dto= new OdersDto();
//    dto.setNo(customerdto.getCustomerEmail());
//    dto.setNo(customerdto.getCustomerEmail());
//    dto.setNo(customerdto.getCustomerEmail());
//    dto.setNo(customerdto.getCustomerEmail());
//    dto.setNo(customerdto.getCustomerEmail());
//    dto.setNo(customerdto.getCustomerEmail());
//    
//    
//    OdrdersDao.insert(dto);
//    
//    model("list", orders.selectOne());
//    
	
}