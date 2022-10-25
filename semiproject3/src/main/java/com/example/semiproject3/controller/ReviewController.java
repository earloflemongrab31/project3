package com.example.semiproject3.controller;

import java.io.File;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.example.semiproject3.constant.SessionConstant;
import com.example.semiproject3.entity.ImageDto;
import com.example.semiproject3.entity.ReviewDto;
import com.example.semiproject3.repository.ImageDao;
import com.example.semiproject3.repository.ReviewDao;

@Controller
@RequestMapping("/review")
public class ReviewController {

	@Autowired
	private ReviewDao reviewDao;
	
	@Autowired
	private ImageDao imageDao;
	
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

}
