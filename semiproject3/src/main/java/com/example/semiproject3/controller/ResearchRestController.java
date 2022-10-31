package com.example.semiproject3.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.semiproject3.repository.ResearchDao;
import com.example.semiproject3.vo.ResearchCountVO;

@RestController
@RequestMapping("/rest/research")
public class ResearchRestController {

	@Autowired
	private ResearchDao researchDao;
	
	@GetMapping("/count")
	public List<ResearchCountVO>count(){
		return researchDao.selectCountList();
}
}