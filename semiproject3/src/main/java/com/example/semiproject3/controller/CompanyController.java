package com.example.semiproject3.controller;

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
		int no=companyDao.sequence();
		companyDto.setCompanyNo(no);
		companyDao.insert(companyDto);
		attr.addAttribute("companyNo",companyDto.getCompanyNo());
		return "redirect:detail";
	}
	
	@GetMapping("/detail")
	public String detail(
			@RequestParam int companyNo,
			Model model
			){
		model.addAttribute("companyDto",companyDao.selectOne(companyNo));
		return "company/detail";
	}
	@GetMapping("/list")
	public String list(Model model){
		model.addAttribute("list",companyDao.selectList());
		return "company/list";
	}
	@GetMapping("/delete")
	public String delete(@RequestParam int companyNo) {
		companyDao.delete(companyNo);
		return "redirect:list";
	}
	@GetMapping("/update")
	public String update(
			@RequestParam int companyNo,
			Model model) {
		//하나의 정보를 불러와 jsp에 뿌려준다. 
		model.addAttribute("companyDto",companyDao.selectOne(companyNo));
		return "company/update";
	}
	@PostMapping("/update")
	public String update(
			@ModelAttribute CompanyDto companyDto,
			RedirectAttributes attr) {
		companyDao.update(companyDto);
		attr.addAttribute("companyNo",companyDto.getCompanyNo());
		return "redirect:detail";
	}
	
}
