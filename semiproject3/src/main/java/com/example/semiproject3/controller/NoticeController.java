package com.example.semiproject3.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.semiproject3.entity.NoticeDto;
import com.example.semiproject3.repository.NoticeDao;

@Controller
@RequestMapping("/notice")
public class NoticeController {
	
	@Autowired
	private NoticeDao noticeDao;
	
	@GetMapping("/insert")
	public String insert() {
		return "notice/insert";
	}
	
	@PostMapping("/insert")
	public String insert(@ModelAttribute NoticeDto Dto) {
		int noticeNo = noticeDao.sequence();
		Dto.setNoticeNo(noticeNo);
		
		noticeDao.insert(Dto);
		
		return "redirect:/";
	}
	
	@GetMapping("/list")
	public String list(Model model, 
					@RequestParam(required = false) String type,
					@RequestParam(required = false) String keyword) {
		boolean isSearch = type != null && keyword != null;
		if(isSearch) { // 검색
			model.addAttribute("list", noticeDao.selectList(type, keyword));
		}
		else { //목록
			model.addAttribute("list", noticeDao.selectList());
		}
		return "notice/list";
	}
	
	@GetMapping("/detail")
	public String detail(Model model, @RequestParam int noticeNo) {
	NoticeDto Dto = noticeDao.selectOne(noticeNo);
	model.addAttribute("Dto",Dto);
	return "notice/detail";
	}
	
}