package com.example.semiproject3.controller;

import java.io.Console;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.semiproject3.entity.CompanyDto;
import com.example.semiproject3.repository.CompanyDao;

@Controller
@RequestMapping("/company")
public class CompanyController {

	@Autowired
	private CompanyDao companyDao;
	
	@GetMapping("/insert")
	public String insert() {
		return "company/insert";
	}
	@PostMapping("/insert")
	public String insert(
			@ModelAttribute CompanyDto companyDto,
			RedirectAttributes attr) {
		companyDto.setCompanyNo(companyDao.sequence());
		companyDao.insert(companyDto);
		attr.addAttribute("companyNo",companyDao.sequence());
		return "redirect:detail";
	}
	
	@GetMapping("/detail")
	public String detail(
			@RequestParam int companyNo,
			Model model
			){
		model.addAttribute("a",companyDao.selectOne(companyNo));
		return "company/detail";
	}
}
