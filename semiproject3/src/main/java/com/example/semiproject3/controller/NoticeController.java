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

import com.example.semiproject3.constant.SessionConstant;
import com.example.semiproject3.entity.NoticeDto;
import com.example.semiproject3.error.TargetNotFoundException;
import com.example.semiproject3.repository.CartDao;
import com.example.semiproject3.repository.NoticeDao;
import com.example.semiproject3.vo.NoticeListSearchVO;

@Controller
@RequestMapping("/notice")
public class NoticeController {
	
	@Autowired
	private NoticeDao noticeDao;
	
	@Autowired
	private CartDao cartDao;
	
	@GetMapping("/insert")
	public String insert(Model model, HttpSession session) {
		//장바구니 개수
		String loginId = (String) session.getAttribute(SessionConstant.ID);
		model.addAttribute("cartCount",cartDao.cartCount(loginId));
		return "notice/insert";
	}
	
	@PostMapping("/insert")
	public String insert(@ModelAttribute NoticeDto noticeDto, 
			HttpSession session, RedirectAttributes attr) {
		String adminId = (String) session.getAttribute(SessionConstant.ID);
		noticeDto.setAdminId(adminId);
		
		int noticeNo = noticeDao.insert2(noticeDto);
		attr.addAttribute("noticeNo",noticeNo);
		return "redirect:detail";
	}
	
	@GetMapping("/list")
	public String list(Model model, HttpSession session,
			@ModelAttribute(name="vo") NoticeListSearchVO vo) {

		//페이지 네비게이터를 위한 게시글 수를 전달
		int count = noticeDao.count(vo);
		vo.setCount(count);
		
		model.addAttribute("list", noticeDao.selectList(vo));
		model.addAttribute("param",vo);
		
		//장바구니 개수
		String loginId = (String) session.getAttribute(SessionConstant.ID);
		model.addAttribute("cartCount",cartDao.cartCount(loginId));
		
		return "notice/list";
	}
	
	
	@GetMapping("/detail")
	public String detail(Model model, @RequestParam int noticeNo,
			HttpSession session) {
		
		NoticeDto noticeDto = noticeDao.selectOne(noticeNo);
		model.addAttribute("noticeDto",noticeDto);
		
		//조회수 증가
		model.addAttribute("noticeDto", noticeDao.read(noticeNo));
		
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
		
		//장바구니 개수
		String loginId = (String) session.getAttribute(SessionConstant.ID);
		model.addAttribute("cartCount",cartDao.cartCount(loginId));
	
		return "notice/detail";
	}
	
	@GetMapping("/edit")
	public String edit(Model model, @RequestParam int noticeNo, HttpSession session) {
		
		model.addAttribute("noticeDto",noticeDao.selectOne(noticeNo));
		
		//장바구니 개수
		String loginId = (String) session.getAttribute(SessionConstant.ID);
		model.addAttribute("cartCount",cartDao.cartCount(loginId));
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
	