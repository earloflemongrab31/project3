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
import com.example.semiproject3.entity.OrderDto;
import com.example.semiproject3.error.TargetNotFoundException;
import com.example.semiproject3.repository.CustomerDao;
import com.example.semiproject3.repository.OrderDao;

@Controller
@RequestMapping("/order")
public class OrderController {
	
	@Autowired
	private OrderDao orderDao;
	
	@Autowired
	private CustomerDao customerDao;
	
	
	//등록
	@GetMapping("/insert")
	public String insert() {
		return "order/insert";
	}
		
	@PostMapping("/insert")
	public String insert(@ModelAttribute OrderDto orderDto) {
		
		//번호 생성
		int orderNo = orderDao.sequence();
		orderDao.insert(orderDto);
		
		orderDao.insert(orderDto);
		return "redirect:order/list";
	}
	
	//목록
	@GetMapping("/list")
	public String list(Model model,
			HttpSession session) {
	String loginId = (String) session.getAttribute(SessionConstant.ID);
	model.addAttribute("order",orderDao.selectList(loginId));
	return "order/list";
	}
	
	//수정
		@GetMapping("/edit")
		public String edit(Model model,@RequestParam String loginId) {
			OrderDto orderDto = orderDao.selectOne(loginId);
			model.addAttribute("orderDto", orderDto);
			return "order/edit";
		}
		
		@PostMapping("/edit")
		public String edit(@ModelAttribute OrderDto orderDto,
				RedirectAttributes attr) {
			boolean result = orderDao.update(orderDto);
			if(result) {
				attr.addAttribute("orderNo", orderDto.getCustomerId());
				return "redirect:detail";
			}
			else {
				throw new TargetNotFoundException("주문이 존재하지 않음");
			}
		}
		
		//삭제
		@GetMapping("/delete")
		public String delete(@RequestParam int orderNo) {
			boolean result = orderDao.delete(orderNo);
			if(result) {
				return "redirect:list";
			}
			else {
				throw new TargetNotFoundException("주문번호 존재하지 않음");
			}
		}
	
}
