package com.example.semiproject3.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.semiproject3.constant.SessionConstant;
import com.example.semiproject3.entity.ImageDto;
import com.example.semiproject3.entity.ReportDto;
import com.example.semiproject3.entity.ReviewDto;
import com.example.semiproject3.entity.ReviewLikeDto;
import com.example.semiproject3.repository.ImageDao;
import com.example.semiproject3.repository.ReportDao;
import com.example.semiproject3.repository.ReviewDao;
import com.example.semiproject3.repository.ReviewLikeDao;
import com.example.semiproject3.vo.ReviewListSearchVO;

@Controller
@RequestMapping("/review")
public class ReviewController {

	@Autowired
	private ReviewDao reviewDao;
	
	@Autowired
	private ImageDao imageDao;
	
	@Autowired
	private ReportDao reportDao; 
	
	@Autowired
	private ReviewLikeDao reviewLikeDao;
	
	//리뷰작성
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
			@RequestParam List<MultipartFile> attachment) throws IllegalStateException, IOException{
			
			//리뷰저장
			String loginId = (String)session.getAttribute(SessionConstant.ID);
			int itemNo=(int)session.getAttribute("itemNo");
			int reviewNo=reviewDao.sequence();
			reviewDto.setReviewNo(reviewNo);
			reviewDto.setCustomerId(loginId);
			reviewDto.setItemNo(itemNo);
			reviewDto.setReviewContent(reviewDto.getReviewContent());
			reviewDto.setReviewStar(reviewDto.getReviewStar());
			reviewDto.setReviewShipping(reviewDto.getReviewShipping());
			reviewDto.setReviewPackaging(reviewDto.getReviewPackaging());
			reviewDao.insert(reviewDto);
		
		
			for(MultipartFile file:attachment) {
				if(!file.isEmpty()) {
					//DB등록
					int imageNo=imageDao.sequence();
					imageDao.insert(ImageDto.builder()
							.imageNo(imageNo)
							.imageName(file.getOriginalFilename())
							.imageType(file.getContentType())
							.imageSize(file.getSize())
							.build());
					//파일저장
					File dir=new File("D:/upload");
					dir.mkdirs();
					File target = new File(dir,String.valueOf(imageNo));
					file.transferTo(target);
					
					
					//review_image 연결테이블에 연결정보저장(리뷰번호 / 첨부파일번호)
						reviewDao.connectAttachment(reviewNo, imageNo);
					
					
				}
				
			}
		
		return "redirect:/item/buydetail?itemNo="+itemNo;
	}
	
	//신고
	@GetMapping("/report")
	public String report(
			@RequestParam int reviewNo,
			@RequestParam int itemNo,
			Model model,
			HttpSession session,
			RedirectAttributes attr
			) {
		//지금 접속해있는 사용자의 아이디값을 가지고온다. 
		String loginId = (String)session.getAttribute(SessionConstant.ID);
		//세션을 이융해 리뷰번호를 담는다. 
		session.setAttribute("reviewNo", reviewNo);
		//세션을 이용해 아이템정보값을 담는다.
		session.setAttribute("itemNo", itemNo);
		//하나 리뷰 정보를 불러와 화면에 뿌려준다. 
		model.addAttribute("review",reviewDao.selectOne2(reviewNo));
		//하나의 리뷰정보를 가지고 온다. 
		ReviewDto reviewDto=reviewDao.selectOne2(reviewNo);
		//만약 자기자신의 글에 신고를 했다면 화면을 튕긴다. 
		attr.addAttribute("reviewNo",reviewNo);
		attr.addAttribute("itemNo",itemNo);
		return "/review/report";
		}
	
	@PostMapping("/report")
	public String report(
			@ModelAttribute ReportDto reportDto1,
			HttpSession session,
			RedirectAttributes attr
			) {
		int reviewNo=(int)session.getAttribute("reviewNo");
		//세션값에서 아이템 정보를 불러온다.
		int itemNo=(int)session.getAttribute("itemNo");
		//하나의 리뷰정보를 불러온다.
		ReviewDto reviewDto=reviewDao.selectOne2(reviewNo);
//		//회원아이디값을 불러온다.
		String loginId = (String)session.getAttribute(SessionConstant.ID);
		reportDao.insert(ReportDto.builder()
				.customerId(reviewDto.getCustomerId())
				.reviewContent(reviewDto.getReviewContent())
				.reportRadio(reportDto1.getReportRadio())
				.reportContent(reportDto1.getReportContent())
				.who(loginId)
				.build());
		
		attr.addAttribute("itemNo",itemNo);
		return "redirect:/item/buydetail";
	}
	
	//리뷰좋아요
	@GetMapping("/like")
	public String reviewLike(
			HttpSession session,
			@RequestParam int reviewNo,
			@RequestParam int itemNo,
			Model model
			) {
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
		model.addAttribute("isReview",reviewLikeDao.check(dto));
		return "redirect:/item/buydetail?itemNo="+itemNo;
	}
	
//	//신고목록
//	@GetMapping("/reportList")
//	public String reportList(Model model, 
//					@RequestParam(required = false) String type,
//					@RequestParam(required = false) String keyword) {
//		boolean isSearch = type != null && keyword != null;
//		if(isSearch) { // 검색
//			model.addAttribute("reportList", reportDao.selectList(type, keyword));
//		}
//		else { //목록
//			model.addAttribute("reportList", reportDao.selectList());
//		}
//		return "review/reportList";
//		
		
	//신고목록 페이징 처리
	@GetMapping("/reportList")
	public String reportList(Model model,
			@ModelAttribute(name="vo") ReviewListSearchVO vo) {
	
	int count = reportDao.count(vo);
	vo.setCount(count);
	
	model.addAttribute("reportList",reportDao.selectList(vo));
	model.addAttribute("param",vo);
	return "review/reportList";
	
	}
	@GetMapping("/blind")
	public String blind(
			@RequestParam int reviewNo,
			@RequestParam int itemNo,
			RedirectAttributes attr) {
		ReviewDto reviewDto=reviewDao.selectOne2(reviewNo);
		reviewDao.updateBlind(reviewNo,!reviewDto.isReviewBlind());
		attr.addAttribute("itemNo",itemNo);
		return "redirect:/item/buydetail";
	};

}
