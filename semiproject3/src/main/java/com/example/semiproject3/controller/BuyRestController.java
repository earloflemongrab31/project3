package com.example.semiproject3.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.semiproject3.repository.BuyDao;
import com.example.semiproject3.vo.BuyListCountVO;

@RestController
@RequestMapping("/rest/buy")
public class BuyRestController {

	@Autowired
	private BuyDao buyDao;
	
	@GetMapping("/count")
	public List<BuyListCountVO> count(){
		return buyDao.selectCountList();
}
}
