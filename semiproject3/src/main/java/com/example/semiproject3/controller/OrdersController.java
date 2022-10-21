package com.example.semiproject3.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.semiproject3.entity.OrdersDto;
import com.example.semiproject3.error.TargetNotFoundException;
import com.example.semiproject3.repository.AddressDao;
import com.example.semiproject3.repository.BuyDao;
import com.example.semiproject3.repository.CustomerDao;
import com.example.semiproject3.repository.OrdersDao;

@Controller
@RequestMapping("/orders")
public class OrdersController {

	@Autowired
	private OrdersDao ordersDao;	

	@Autowired
	private CustomerDao customerDao;

	@Autowired
	private AddressDao addressDao;

	@Autowired
	private BuyDao buyDao;

	// 등록
	@GetMapping("/insert")
	public String insert() {
		return "orders/insert";
	}

	@PostMapping("/insert")
	public String insert(@ModelAttribute OrdersDto ordersDto) {
		ordersDao.insert(ordersDto);
		return "redirect:orders/list";
	}

	// 리스트(검색+목록)
	@GetMapping("/list")
	public String list(Model model, @RequestParam(required = false) String type,
			@RequestParam(required = false) String keyword) {
		boolean isSearch = type != null && keyword != null;
		if (isSearch) { // 검색
			model.addAttribute("list", ordersDao.selectList(type, keyword));
		} else { // 목록
			model.addAttribute("list", ordersDao.selectList());
		}
		return "orders/list";
	}

	// 수정
	@GetMapping("/edit")
	public String edit(Model model, @RequestParam int ordersNo) {
		OrdersDto ordersDto = ordersDao.selectOne(ordersNo);
		model.addAttribute("ordersDto", ordersDto);
		return "orders/edit";
	}

	@PostMapping("/edit")
	public String edit(@ModelAttribute OrdersDto ordersDto, RedirectAttributes attr) {
		boolean result = ordersDao.update(ordersDto);
		if (result) {
			attr.addAttribute("ordersNo", ordersDto.getOrdersNo());
			return "redirect:detail";
		} else {
			throw new TargetNotFoundException("주문번호 존재하지 않음");
		}
	}

	// 삭제
	@GetMapping("/delete")
	public String delete(@RequestParam int ordersNo) {
		boolean result = ordersDao.delete(ordersNo);
		if (result) {
			return "redirect:list";
		} else {
			throw new TargetNotFoundException("주문번호 존재하지 않음");
		}
	}

}
