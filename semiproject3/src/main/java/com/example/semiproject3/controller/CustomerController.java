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
import com.example.semiproject3.entity.CustomerDto;
import com.example.semiproject3.repository.CustomerDao;

@Controller
@RequestMapping("/customer")
public class CustomerController {

	@Autowired
	private CustomerDao customerDao;

	@GetMapping("/insert")
	public String insert() {
		return "customer/insert";
	}

	@PostMapping("/insert")
	public String insert(@ModelAttribute CustomerDto dto) {
		return "redirect:insert_success";
	}
	
	@GetMapping("/insert_success")
	public String insertSuccess() {
		return "customer/insertSuccess";
	}
	
	@GetMapping("/login")
	public String login() {
		return "customer/login";
	}
	
	@PostMapping("/login")
	public String login(HttpSession session,
			@RequestParam String customerId,
			@RequestParam String customerPw) {
		CustomerDto findDto = customerDao.selectOne(customerId);
		
		if(findDto == null) {
			return "redirect:login?error";
		}
		
		boolean isLogin = findDto.getCustomerPw().equals(customerPw);
		if(isLogin) {
			session.setAttribute("loginId", customerId);
			session.setAttribute("loginMg", findDto.getCustomerGrade());
		}
		else {
			return "redirect:login?error";
		}
		return "redirect:/";
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("loginId");
		session.removeAttribute("loginMg");
		return "redirect:login";
	}
	
	@GetMapping("/mypage")
	public String mypage(Model model, HttpSession session) {
		String loginId = (String)session.getAttribute(SessionConstant.ID);
		model.addAttribute("dto", customerDao.selectOne(loginId));
		return "customer/mypage";
	}
	
	@GetMapping("/list")
	public String list(Model model, 
					@RequestParam(required = false) String type,
					@RequestParam(required = false) String keyword) {
		boolean isSearch = type != null && keyword != null;
		if(isSearch) { // 검색
			model.addAttribute("list", customerDao.selectList(type, keyword));
		}
		else { //목록
			model.addAttribute("list", customerDao.selectList());
		}
		return "customer/list";
	}
	
	@GetMapping("/detail")
	public String detail(Model model, @RequestParam String customerId) {
		CustomerDto dto = customerDao.selectOne(customerId);
		model.addAttribute("dto", dto);
		return "customer/detail";
	}
	
	@GetMapping("/edit")
	public String edit(Model model,@RequestParam String customerId) {
		CustomerDto dto = customerDao.selectOne(customerId);
		model.addAttribute("dto",dto);
		return "customer/edit";
	}

	@PostMapping("/edit")
	public String edit(@ModelAttribute CustomerDto dto) {
	boolean result = customerDao.update(dto);
	if(result) {
		return "redirect:detail?customer_id="+dto.getCustomerId();
	}
	else {
		return "redirect:edit_fail";
	}
}
	@GetMapping("/edit_fail")
	public String editFail() {
		return "customer/edit_fail";
	}
	
	@GetMapping("/delete")
	public String delete(@RequestParam String customerId) {
		boolean result = customerDao.delete(customerId);
		if(result) {
			return "redirect:list";
		}
		else {
			return "customer/editFail";
		}
	}
}
