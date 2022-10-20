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

import com.example.semiproject3.entity.CenterDto;
import com.example.semiproject3.error.TargetNotFoundException;
import com.example.semiproject3.repository.CenterDao;

@Controller
@RequestMapping("/center")
public class CenterController {

	@Autowired
	private CenterDao centerDao;
	
	//등록
	@GetMapping("/insert")
	public String insert() {
		return "center/insert";
	}
	
	//등록
	@PostMapping("/insert")
	public String insert(@ModelAttribute CenterDto centerDto) {
		int centerNo = centerDao.sequence();
		centerDto.setCenterNo(centerNo);
		centerDao.insert(centerDto);
		return "redirect:list";
	}
	
	//목록(타입&키워드)
	@GetMapping("/list")
	public String list(Model model, 
					@RequestParam(required = false) String type,
					@RequestParam(required = false) String keyword) {
		boolean isSearch = type != null && keyword != null;
		if(isSearch) { // 검색
			model.addAttribute("list", centerDao.selectList(type, keyword));
		}
		else { //목록
			model.addAttribute("list", centerDao.selectList());
		}
		return "center/list";
	}
	 
	//상세
	@GetMapping("/detail")
	public String detail(Model model, @RequestParam int centerNo) {
		CenterDto centerDto = centerDao.selectOne(centerNo);
		model.addAttribute("centerDto", centerDto);
		return "center/detail";
	}
	
	//수정
	@GetMapping("/edit")
	public String edit(Model model, @RequestParam int centerNo) {
		model.addAttribute("centerDto", centerDao.selectOne(centerNo));
		return "center/edit";
	}
	
	@PostMapping("/edit")
	public String edit(@ModelAttribute CenterDto centerDto, RedirectAttributes attr) {
		boolean result = centerDao.update(centerDto);
		if(result) {
			attr.addAttribute("centerNo",centerDto.getCenterNo());
			return "redirect:detail";
		}
		else {
			throw new TargetNotFoundException("고객센터 번호 없음");
		}
	}		
	

	@GetMapping("/delete")
	public String delete(@RequestParam int centerNo) {
		boolean result =centerDao.delete(centerNo);
		if(result) {
			return "redirect:list";
		}
		else {
			throw new TargetNotFoundException("공지사항 번호없음");
		}
	}
}