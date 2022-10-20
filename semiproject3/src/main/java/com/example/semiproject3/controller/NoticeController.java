package com.example.semiproject3.controller;

import java.util.HashSet;
import java.util.Set;

import javax.servlet.http.HttpSession;

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
import com.example.semiproject3.vo.NoticeListSearchVO;

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
					@ModelAttribute(name="vo") NoticeListSearchVO vo){
		if(vo.isSearch()) { // 검색
			model.addAttribute("list", noticeDao.selectList(vo));
		}
		else { //목록
			model.addAttribute("list", noticeDao.selectList());
		}
		return "notice/list";
	}
	
	@GetMapping("/detail")
	public String detail(Model model, @RequestParam int noticeNo,
			HttpSession session) {
	//NoticeDto Dto = noticeDao.selectOne(noticeNo);
	//model.addAttribute("Dto",Dto);
	
	//(조회수 중복 방지 처리)
	Set<Integer> history = (Set<Integer>) session.getAttribute("history"); 
	if(history == null) { //history가 없다면 신규 생성이 된다.
		history = new HashSet<>();
	}
	
	// 현재 글 번호 읽은적이 있는 지 검사
	if(history.add(noticeNo)) {//추가된 경우 - 처음 읽는 번호면
		model.addAttribute("noticeDto", noticeDao.read(noticeNo));
	}
	else {//추가가 안된 경우 - 읽은 적이 있는 번호면
		model.addAttribute("noticeDto", noticeDao.selectOne(noticeNo));
	}
	session.setAttribute("history", history);
	
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
	