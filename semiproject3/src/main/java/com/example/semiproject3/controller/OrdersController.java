package com.example.semiproject3.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.semiproject3.constant.SessionConstant;
import com.example.semiproject3.entity.OrdersDto;
import com.example.semiproject3.repository.OrdersDao;

@Controller
@RequestMapping("/orders")
public class OrdersController {

	@Autowired
	private OrdersDao ordersDao;
	
	@GetMapping("/list")
	public String list(Model model, HttpSession session) {
		
		String loginId = (String)session.getAttribute(SessionConstant.ID);
		model.addAttribute("orders",ordersDao.selectList(loginId));
		model.addAttribute("oredresCount",ordersDao.selectOrders(loginId));
		return "orders/list";
	}
	
	@GetMapping("/delete")
	public String delete(@RequestParam int itemNo,HttpSession session) {
	
	String loginId = (String) session.getAttribute(SessionConstant.ID);
	OrdersDto ordersDto = new OrdersDto();
	ordersDto.setCustomerId(loginId);
	ordersDto.setItemNo(itemNo);
	ordersDao.delete(ordersDto);
		return "redirect:orders/list";
	}
	
}