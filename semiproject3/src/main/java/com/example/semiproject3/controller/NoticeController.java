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

import com.example.semiproject3.entity.NoticeDto;
import com.example.semiproject3.error.TargetNotFoundException;
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
	public String insert(@ModelAttribute NoticeDto noticeDto) {
		int noticeNo = noticeDao.sequence();
		noticeDto.setNoticeNo(noticeNo);
		
		noticeDao.insert(noticeDto);
		
		return "redirect:list";
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
	
	@GetMapping("/edit")
	public String edit(Model model, @RequestParam int noticeNo) {
		
		model.addAttribute("noticeDto",noticeDao.selectOne(noticeNo));
		return "notice/edit";
	}
	
	
	@PostMapping("/edit")
	public String edit(@ModelAttribute NoticeDto noticeDto, RedirectAttributes attr) {
	boolean result = noticeDao.update(noticeDto);
	if(result) {
		attr.addAttribute("noticeNo",noticeDto.getNoticeNo());
		return "redirect:detail";
		}
		else {
		throw new TargetNotFoundException("공지사항 번호없음");
		}
	}
	
	@GetMapping("/delete")
	public String delete(@RequestParam int noticeNo) {
		boolean result = noticeDao.delete(noticeNo);
		if(result) {
			return "redirect:list";
		}
		else {
			throw new TargetNotFoundException("공지사항 번호없음");
		}
	}
	
}
	