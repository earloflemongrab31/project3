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

import com.example.semiproject3.entity.ReviewDto;
import com.example.semiproject3.error.TargetNotFoundException;
import com.example.semiproject3.repository.ReviewDao;

@Controller
@RequestMapping("/review")
public class ReviewController {

	@Autowired
	private ReviewDao reviewDao;
	
	//등록
	@GetMapping("/insert")
	public String insert() {
		return "review/insert";
	}
	
	@PostMapping("/insert")
	public String insert(@ModelAttribute ReviewDto reviewDto) {
		reviewDao.insert(reviewDto);
		return "redirect:list";
	}
	
	//리스트
		@GetMapping("/list")
		public String list(Model model,
				@RequestParam(required = false)String type,
				@RequestParam(required = false)String keyword) {
			boolean isSearch = type != null && keyword != null;
			if(isSearch) { //검색
				model.addAttribute("list",reviewDao.selectList(type,keyword));	
			}
			else { //목록
				model.addAttribute("list",reviewDao.selectList());
			}
		return "list";
		}
		
	//수정
	@GetMapping("/edit")
	public String edit(Model model,@RequestParam int reviewNo) {
		ReviewDto reviewDto = reviewDao.selectOne(reviewNo);
		model.addAttribute("reviewDto", reviewDto);
		return "review/edit";
	}
		
	@PostMapping("/edit")
	public String edit(@ModelAttribute ReviewDto reviewDto,
		RedirectAttributes attr) {
		boolean result = reviewDao.update(reviewDto);
		if(result) {
				attr.addAttribute("reviewNo", reviewDto.getReviewNo());
				return "redirect:detail";
			}
			else {
				throw new TargetNotFoundException("리뷰번호 존재하지 않음");
			}
		}
	
	//삭제
	@GetMapping("/delete")
	public String delete(@RequestParam int reviewNo) {
		boolean result = reviewDao.delete(reviewNo);
		if(result) {
			return "redirect:list";
		}
		else {
			throw new TargetNotFoundException("리뷰번호 존재하지 않음");
		}
	}
	
}
