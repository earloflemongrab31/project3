package com.example.semiproject3.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.example.semiproject3.constant.SessionConstant;
import com.example.semiproject3.entity.ReviewDto;
import com.example.semiproject3.entity.ReviewLikeDto;
import com.example.semiproject3.repository.ReviewDao;
import com.example.semiproject3.repository.ReviewLikeDao;

@CrossOrigin
@RestController
@RequestMapping("/rest/review")
public class ReviewRestController {
	
	@Autowired
	private ReviewDao reviewDao;
	@Autowired
	private ReviewLikeDao reviewLikeDao;
	
	@PostMapping("/like")
	public ReviewDto reviewLike(
			@RequestParam int reviewNo,
			@RequestParam int itemNo,
			HttpSession session,
			Model model
			){
		String loginId = (String)session.getAttribute(SessionConstant.ID);
		ReviewLikeDto dto=new ReviewLikeDto();
		dto.setCustomerId(loginId);
		dto.setReviewNo(reviewNo);
		
		if(reviewLikeDao.check(dto)) { // 좋아요한 상태라면  지우고
			reviewDao.minus(reviewNo);
			reviewLikeDao.delete(dto);
		}else {
			reviewDao.plus(reviewNo);
			reviewLikeDao.insert(dto); //좋아요값이없는 상태라면 넣어라
		}
			
		return reviewDao.selectOne2(reviewNo);
	}
}

