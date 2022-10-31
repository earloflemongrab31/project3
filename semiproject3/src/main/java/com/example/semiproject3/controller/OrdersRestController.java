package com.example.semiproject3.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.semiproject3.constant.SessionConstant;
import com.example.semiproject3.entity.OrdersDto;
import com.example.semiproject3.repository.OrdersDao;

@RestController
@CrossOrigin
@RequestMapping("/rest/orders")
public class OrdersRestController {

	@Autowired
	private OrdersDao ordersDao;
	
	@PostMapping("/insert")
	public String insert(
			HttpSession session,
			@ModelAttribute OrdersDto ordersDto) {
		String loginId = (String)session.getAttribute(SessionConstant.ID);
		ordersDto.setCustomerId(loginId);
		ordersDto.setItemCnt(1);
		
		if(ordersDao.selectOne2(ordersDto) == null) {//새로 등록하는 옵션이라면
			ordersDao.insert(ordersDto);
			return "NNNNY";
		}
		else {
			return "NNNNN";
		}
	};
}
