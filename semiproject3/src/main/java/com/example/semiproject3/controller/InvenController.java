package com.example.semiproject3.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.semiproject3.entity.InvenDto;
import com.example.semiproject3.repository.InvenDao;
import com.example.semiproject3.repository.ItemDao;

@Controller
@RequestMapping("/warehouse")
public class InvenController {
	
	@Autowired
	ItemDao itemDao;
	@Autowired
	InvenDao invenDao;
	
	@GetMapping("/itemList")
	public String itemList(Model model) {
		model.addAttribute("itemList",itemDao.selectList());
		return "warehouse/itemList";
	}
	
	@GetMapping("/insert")
	public String insert(
			@RequestParam int itemNo,
			Model model) {
		//하나의 아이템정보를 가지고와서 화면에 뿌려준다. 
		model.addAttribute("itemList",itemDao.selectOne(itemNo));
		return "warehouse/insert";
	}
	@PostMapping("/insert")
	public String insert(@ModelAttribute InvenDto invenDto) {
		invenDao.insert(invenDto);
		if((invenDto.getInvenStatus()).equals("입고완료")){
			invenDao.plus(invenDto.getInvenQuantity(),invenDto.getItemNo());
			return "redirect:invenList";
		}else if((invenDto.getInvenStatus()).equals("출고완료")) {
			invenDao.minus(invenDto.getInvenQuantity(),invenDto.getItemNo());
			return "redirect:invenList";
		}else {
			return "redirect:invenList";
		}
		
	}
	@GetMapping("/invenList")
	public String invenList(Model model) {
		model.addAttribute("invenList",invenDao.selectList());
		return "/warehouse/invenList";
	}
	
}
