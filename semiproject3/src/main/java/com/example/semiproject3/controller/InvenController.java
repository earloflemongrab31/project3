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

import com.example.semiproject3.entity.CustomerDto;
import com.example.semiproject3.entity.InvenDto;
import com.example.semiproject3.error.TargetNotFoundException;
import com.example.semiproject3.repository.InvenDao;

@Controller
@RequestMapping("/inven")
public class InvenController {

	@Autowired
	private InvenDao invenDao;
	
	
	@GetMapping("/insert")
	public String insert() {
		return "inven/insert";
	}
	
	@PostMapping("/insert")
	public String insert(@ModelAttribute InvenDto invenDto) {
		invenDao.insert(invenDto);
		return "redirect:list";
	}
	
	//리스트
	@GetMapping("/list")
	public String list(Model model,
			@RequestParam(required = false)String type,
			@RequestParam(required = false)String keyword) {
		boolean isSearch = type != null && keyword != null;
		if(isSearch) { //검색
			model.addAttribute("list",invenDao.selectList(type,keyword));	
		}
		else { //목록
			model.addAttribute("list",invenDao.selectList());
		}
	return "inven/list";
	}
	
	//수정
	@GetMapping("/edit")
	public String edit(Model model,@RequestParam int itemNo) {
		InvenDto invenDto = invenDao.selectOne(itemNo);
		model.addAttribute("invenDto", invenDto);
		return "inven/edit";
	}
	
	@PostMapping("/edit")
	public String edit(@ModelAttribute InvenDto invenDto,
			RedirectAttributes attr) {
		boolean result = invenDao.update(invenDto);
		if(result) {
			attr.addAttribute("itemNo", invenDto.getItemNo());
			return "redirect:detail";
		}
		else {
			throw new TargetNotFoundException("재고 없음");
		}
	}
	
	//삭제
	@GetMapping("/delete")
	public String delete(@RequestParam int itemNo) {
		boolean result = invenDao.delete(itemNo);
		if(result) {
			return "redirect:list";
		}
		else {
			throw new TargetNotFoundException("재고 없음");
		}
	}
}
