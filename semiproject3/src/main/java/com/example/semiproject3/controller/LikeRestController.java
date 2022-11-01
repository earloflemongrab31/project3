package com.example.semiproject3.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.semiproject3.repository.CustomerLikeDao;
import com.example.semiproject3.vo.LikeCountVO;

@RestController
@RequestMapping("/rest/like")
public class LikeRestController {
	
	@Autowired
	private CustomerLikeDao customerLikeDao;
	
	@GetMapping("/count")
	public List<LikeCountVO>count(){
		return customerLikeDao.selectCountList();
}
}
