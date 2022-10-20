package com.example.semiproject3.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.semiproject3.repository.AddressDao;

@Controller
@RequestMapping("/address")

public class AddressController {
	
	@Autowired
	private AddressDao addressDao;
	
}
