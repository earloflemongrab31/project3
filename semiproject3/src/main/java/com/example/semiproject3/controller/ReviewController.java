package com.example.semiproject3.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.example.semiproject3.constant.SessionConstant;
import com.example.semiproject3.entity.ReportDto;
import com.example.semiproject3.entity.ReviewDto;
import com.example.semiproject3.repository.ImageDao;
import com.example.semiproject3.repository.ReportDao;
import com.example.semiproject3.repository.ReviewDao;

@Controller
@RequestMapping("/review")
public class ReviewController {

	@Autowired
	private ReviewDao reviewDao;
	
	@Autowired
	private ImageDao imageDao;
	
	@Autowired
	private ReportDao reportDao; 
	
	@GetMapping("/insert")
	public String insert(
			@RequestParam int itemNo,
			HttpSession session) {
		session.setAttribute("itemNo", itemNo);
		return "review/insert";
	}
	@PostMapping("/insert")
	public String insert(
			@ModelAttribute ReviewDto reviewDto,
			HttpSession session,
			@RequestParam MultipartFile attachment){
		
		String loginId = (String)session.getAttribute(SessionConstant.ID);
		int itemNo=(int)session.getAttribute("itemNo");
		reviewDto.setCustomerId(loginId);
		reviewDto.setItemNo(itemNo);
		reviewDao.insert(reviewDto);
		
		return "redirect:/item/buydetail?itemNo="+itemNo;
	}
	
	//신고
	@GetMapping("/report")
	public String report(
			@RequestParam int reviewNo,
			Model model,
			HttpSession session
			) {
		//세션을 이융해 리뷰번호를 담는다. 
		session.setAttribute("reviewNo", reviewNo);
		//하나 리뷰 정보를 불러와 화면에 뿌려준다. 
		model.addAttribute("review",reviewDao.selectOne(reviewNo));
		return "review/report";
	}
	@PostMapping("/report")
	public String report(
			@ModelAttribute ReportDto reportDto,
			HttpSession session
			) {
		int reviewNo=(int)session.getAttribute("reviewNo");
		//하나의 리뷰정보를 불러온다.
		ReviewDto reviewDto=reviewDao.selectOne(reviewNo);
		reportDao.insert(reportDto.builder()
				.customerId(reviewDto.getCustomerId())
				.reviewContent(reviewDto.getReviewContent())
				.reportRadio(reportDto.getReportRadio())
				.reportContent(reportDto.getReportContent())
				.build());
		
		return "redirect:/";
	}

}
