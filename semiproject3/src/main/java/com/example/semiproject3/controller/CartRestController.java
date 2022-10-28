package com.example.semiproject3.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.example.semiproject3.repository.CartDao;

@CrossOrigin
@RestController
@RequestMapping("/rest/cart")
public class CartRestController {

	@Autowired
	private CartDao cartDao;
	
//	@PostMapping("/")
//	private String id (@RequestParam String inputId) {
//		if(customerDao.selectOne(inputId) == null) {
//			return "NNNNY";
//		}
//		else {
//			return "NNNNN";
//		}
//	}
}