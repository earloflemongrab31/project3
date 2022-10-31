package com.example.semiproject3.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.example.semiproject3.entity.CustomerDto;
import com.example.semiproject3.repository.CustomerDao;

@CrossOrigin
@RestController
@RequestMapping("/rest/customer")
public class CustomerRestController {

	@Autowired
	private CustomerDao customerDao;
	
	@PostMapping("/id")
	private String id (@RequestParam String inputId) {
		if(customerDao.selectOne(inputId) == null) {
			return "NNNNY";
		}
		else {
			return "NNNNN";
		}
	}
	
	@PostMapping("/nick")
	private String nick(@RequestParam String inputNick) {
		if(customerDao.findByNick(inputNick) == null) {
			return "NNNNY";
		}
		else {
			return "NNNNN";
		}
	}
	
	@PostMapping("/pw")
	private String pw(
			@RequestParam String inputPw, 
			@RequestParam String loginId) {
		String findPw = customerDao.selectOne(loginId).getCustomerPw();
		if(findPw.equals(inputPw)) {
			return "NNNNY";
		}
		else {
			return "NNNNN";
		}
	}
	
	@GetMapping("/block-ad")
	public String blockAd(HttpSession session) {
		session.setAttribute("blockAd", "Y");
		return "redirect:/";
	}
}
