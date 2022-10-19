package com.example.semiproject3.controller;

import javax.servlet.http.HttpSession;

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
	public String insert(HttpSession session) {
		String loginId=(String)session.getAttribute("loginId");
		//아이디 중복방지
		//(1) 1일경우 중복 0일경우 설문조사 참여가능 
		int judge=researchDao.overlapId(loginId); 
		if(judge>0) {
			return "redirect:confirm";
			
		}else
			return "/research/insert";
			
		}

	@PostMapping("/insert")
	public String insert(
			@ModelAttribute ResearchDto researchDto) {
		
		//입력 된 값 db삽입 
		researchDao.insert(researchDto);
		//customer 포인트 +5000 업데이트 
		customerDao.updatePoint(researchDto.getResearchCustomerId());
		return "redirect:welcome";
	}
	//설문조사 참여완료
	@GetMapping("/welcome")
	public String welcome() {
		return "/research/welcome";
	}
	//이미참여한사람
	@GetMapping("/confirm")
	public String confirm() {
		return "/research/confirm";
	}

}
