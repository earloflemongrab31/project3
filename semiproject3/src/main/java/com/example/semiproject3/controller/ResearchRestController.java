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
	@GetMapping("/count1")
	public List<ResearchCountVO>count1(){
		return researchDao.selectCountList1();
}
	@GetMapping("/count2")
	public List<ResearchCountVO>count2(){
		return researchDao.selectCountList2();
}
	@GetMapping("/count3")
	public List<ResearchCountVO>count3(){
		return researchDao.selectCountList3();
}
	@GetMapping("/count4")
	public List<ResearchCountVO>count4(){
		return researchDao.selectCountList4();
}
	@GetMapping("/count5")
	public List<ResearchCountVO>count5(){
		return researchDao.selectCountList5();
}
}