package com.example.semiproject3.controller;

import java.util.Set;

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
import com.example.semiproject3.entity.CustomerDto;
import com.example.semiproject3.repository.CartDao;
import com.example.semiproject3.repository.CenterDao;
import com.example.semiproject3.repository.CustomerDao;

@Controller
@RequestMapping("/customer")
public class CustomerController {

	@Autowired
	private CustomerDao customerDao;

	@Autowired
	private CenterDao centerDao;
	
	@Autowired
	private CartDao cartDao;
	
	
	@GetMapping("/insert")
	public String insert() {
		return "customer/insert";
	}

	@PostMapping("/insert")
	public String insert(@ModelAttribute CustomerDto customerDto) {
		customerDao.insert(customerDto);
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
		
		boolean isLogin = customerPw.equals(findDto.getCustomerPw());
		if(isLogin) {
			session.setAttribute(SessionConstant.ID, customerId);
			session.setAttribute(SessionConstant.GRADE, findDto.getCustomerGrade());
			
			//로그인 시간을 갱신시키는 작업
			customerDao.updateLoginTime(findDto.getCustomerId());
			
			return "redirect:/";
		}
		else {
			return "redirect:login?error";
		}
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.removeAttribute(SessionConstant.ID);
		session.removeAttribute(SessionConstant.GRADE);
		session.removeAttribute("countCart");
		return "redirect:login";
	}
	
	@GetMapping("/mypage")
	public String mypage(Model model, HttpSession session) {
		String loginId = (String)session.getAttribute(SessionConstant.ID);
		model.addAttribute("customerDto", customerDao.selectOne(loginId));
		return "customer/detail";
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
	
	@GetMapping("/edit")
	public String edit(Model model,@RequestParam String customerId) {
		CustomerDto customerDto = customerDao.selectOne(customerId);
		model.addAttribute("customerDto", customerDto);
		return "customer/edit";
	}

	@PostMapping("/edit")
	public String edit(@ModelAttribute CustomerDto customerDto, RedirectAttributes attr)  {
		boolean result = customerDao.update(customerDto);
		if(result) {
			attr.addAttribute("customerId", customerDto.getCustomerId());
			return "redirect:list";
		}
		else {
			return "redirect:edit?error";
		}
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
	
	@GetMapping("/checkPassword")
	public String checkPassword() {
		return"customer/checkPassword";
	}
	
	@PostMapping("/checkPassword")
	public String checkPassword(
			@RequestParam String customerId,
			@RequestParam String customerPwsearch,
			@RequestParam String customerPw) {
		boolean checkPassword=customerDao.checkPassword(customerId, customerPwsearch);
		customerDao.changePassword(customerPw, customerId);
		
		if(checkPassword) {
			return "redirect:changePassword";
		}else {
			return "redirect:checkPassword?error";
		}
	
	}
	@GetMapping("/changePassword")
	public String changePassword() {
		return "customer/changePassword";
	}
	@PostMapping("/changePassword")
	public String changePassword(
			@RequestParam String customerPw,
			HttpSession session) {
		String loginId = (String) session.getAttribute(SessionConstant.ID);
		customerDao.changePassword(customerPw, loginId);
		return "redirect:login";
	}
}
