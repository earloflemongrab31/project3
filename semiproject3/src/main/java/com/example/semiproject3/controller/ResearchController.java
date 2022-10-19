package com.example.semiproject3.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.semiproject3.entity.ResearchDto;
import com.example.semiproject3.repository.CustomerDao;
import com.example.semiproject3.repository.ResearchDao;

@Controller
@RequestMapping("/research")
public class ResearchController {
	
	@Autowired
	ResearchDao researchDao;
	@Autowired
	CustomerDao customerDao;
	
	@GetMapping("/insert")
	public String insert() {
		return "insert";
	}
	@PostMapping("/insert")
	public String insert(@ModelAttribute ResearchDto researchDto) {
		//db삽입 
		researchDao.insert(researchDto);
		//customer 포인트 +5000 업데이트 
		//customerDao.updatePoint(researchDto.getResearchCustomerId());
		return "/";
		
	}

}
