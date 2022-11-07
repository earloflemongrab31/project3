package com.example.semiproject3.controller;

import java.io.File;
import java.io.IOException;
import java.nio.charset.StandardCharsets;

import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.example.semiproject3.constant.SessionConstant;
import com.example.semiproject3.entity.ImageDto;
import com.example.semiproject3.error.TargetNotFoundException;
import com.example.semiproject3.repository.CartDao;
import com.example.semiproject3.repository.ImageDao;
import com.example.semiproject3.repository.ItemDao;
import com.example.semiproject3.repository.MainEditDao;
import com.example.semiproject3.repository.MainImageDao;
import com.example.semiproject3.repository.ResearchDao;

@Controller
public class HomeController {
	
//	맥북용
//	private final File directory = new File(System.getProperty("user.home")+"/upload/main");
//	C드라이브용
//	private final File directory = new File("C:/study/main");
//	D드라이브용
//	private final File directory = new File("D:/study/main");
	private final File directory = new File("D:/upload/kh10C/main");
	
	@Autowired
	private CartDao cartDao;
	
	@Autowired
	private MainImageDao mainImageDao;
	
	@Autowired
	private MainEditDao mainEditDao;
	
	@Autowired
	private ImageDao imageDao;
	
	@Autowired
	private ItemDao itemDao;
	
	@Autowired
	private ResearchDao researchDao;
	
	@GetMapping("/")
	public String home(
			Model model,
			HttpSession session
			){
		//장바구니 개수
		String loginId = (String) session.getAttribute(SessionConstant.ID);
		model.addAttribute("cartCount",cartDao.cartCount(loginId));
		
		//메인이미지
		model.addAttribute("mainImageList", mainImageDao.selectAll());
		
		//메인내용
		model.addAttribute("mainEditDto", mainEditDao.select());
		
		//새상품 리스트-이미지 등록된 상품 시간 역순
		model.addAttribute("itemList", itemDao.selectList());
		
		//설문조사 이행 여부
		model.addAttribute("researchOverlap", researchDao.overlapId(loginId));
		
		return "home";

	}
	
	@GetMapping("/download/{imageNo}")
	public ResponseEntity<ByteArrayResource> download(@PathVariable int imageNo) throws IOException {
		
		//[1]DB에서 이미지 검색
		ImageDto imageDto = imageDao.selectOne(imageNo);
		if(imageDto == null) {//이미지 없으면
//			return ResponseEntity.notFound().build();//404 error 전송
			throw new TargetNotFoundException("이미지 없음");	
		}
			
		//[2] 찾은 이미지 불러오기
		File target = new File(directory, String.valueOf(imageNo));
		
		if(target.exists()) {//파일 존재
			//[2] 해당 파일의 내용을 불러온다.(apache commons io 의존성 필요)
			byte[] data = FileUtils.readFileToByteArray(target);
			ByteArrayResource resource = new ByteArrayResource(data);
			
			//[3] 사용자에게 보낼 응답 생성
			//- header에는 보낼 파일의 정보를, body에는 보낼 파일의 내용을 첨부
			return ResponseEntity.ok()//ResponseEntity(응답 객체)
//										.header("Content-Encoding", "UTF-8")
									.header(HttpHeaders.CONTENT_ENCODING, StandardCharsets.UTF_8.name())
									.header("Content-Length", String.valueOf(data.length))
									.header("Content-Disposition", "attachment; filename="+imageNo)
									.header("Content-Type", "application/octet-stream")//현재 보내는 데이터 유형 , "무조건 다운받아라"
									.body(resource);
		}
		else {//파일 없음
			//1) 우리가 정한 예외를 발생시키는 방법
			throw new TargetNotFoundException("아이템 없음");
			
			//2) 사용자에게 못 찾았음(404)을 전송
//				return ResponseEntity.notFound().build();
		}
	}
	
	@GetMapping("/block-survey")
	public String blockSurvey(HttpSession session) {
		session.setAttribute("blockSurvey", "Y");
		return "redirect:/";
	}

}