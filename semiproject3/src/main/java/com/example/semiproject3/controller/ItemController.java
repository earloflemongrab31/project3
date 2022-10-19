package com.example.semiproject3.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.semiproject3.entity.ItemDto;
import com.example.semiproject3.error.TargetNotFoundException;
import com.example.semiproject3.repository.ItemDao;

@Controller
@RequestMapping("/item")
public class ItemController {
	
	@Autowired
	private ItemDao itemDao;
	
	//상품 등록
	@GetMapping("/insert")
	public String insert() {
		return "item/insert";
	}
	
	@PostMapping("/insert")
	public String insert(
			@ModelAttribute ItemDto itemDto) {
		int itemNo = itemDao.sequence();
		itemDto.setItemNo(itemNo);
		
		itemDao.insert(itemDto);
		
		return "redirect:list";
	}
	
	//상품 목록
	@GetMapping("/list")
	public String list(Model model,
			@RequestParam(required = false) String type,
			@RequestParam(required = false) String keyword) {
		boolean isSearch = type != null && keyword != null;
		if(isSearch) {
			model.addAttribute("list", itemDao.selectList(type, keyword));
		}
		else {
			model.addAttribute("list", itemDao.selectList());
		}
		
		return "item/list";
	}
	
	//상품 정보
	@GetMapping("/detail")
	public String detail(Model model, 
			@RequestParam int itemNo) {
		model.addAttribute("itemDto", itemDao.selectOne(itemNo));
		
		return "item/detail";
	}
	
	//첨부 파일
//	@GetMapping("/download")
//	@ResponseBody
//	public ResponseEntity<ByteArrayResource> download(@RequestParam int itemNo) throws IOException {
//		//[1] 파일 찾기
////		File dir = new File("C:/study/itemImage");
//		File dir = new File("D:/study/itemImage");
//		File target = new File(dir, String.valueOf(itemNo));
//		
//		if(target.exists()) {//파일 존재
//			//[2] 해당 파일의 내용을 불러온다.(apache commons io 의존성 필요)
//			byte[] data = FileUtils.readFileToByteArray(target);
//			ByteArrayResource resource = new ByteArrayResource(data);
//			
//			//[3] 사용자에게 보낼 응답 생성
//			//- header에는 보낼 파일의 정보를, body에는 보낼 파일의 내용을 첨부
//			return ResponseEntity.ok()//ResponseEntity(응답 객체)
//									.header("Content-Encoding", "UTF-8")
//									.header("Content-Length", String.valueOf(data.length))
//									.header("Content-Disposition", "attachment; filename="+itemNo)
//									.header("Content-Type", "application/octet-stream")//현재 보내는 데이터 유형 , "무조건 다운받아라"
//									.body(resource);
//		}
//		else {//파일 없음
//			//1) 우리가 정한 예외를 발생시키는 방법
//			throw new TargetNotFoundException("아이템 없음");
//			
//			//2) 사용자에게 못 찾았음(404)을 전송
////			return ResponseEntity.notFound().build();
//		}
//	}
	
	//상품 수정
	@GetMapping("/update")
	public String update(Model model, @RequestParam int itemNo) {
		model.addAttribute("itemDto", itemDao.selectOne(itemNo));
		return "item/update";
	}
	
	@PostMapping("/update")
	public String update(@ModelAttribute ItemDto itemDto, RedirectAttributes attr) {
		boolean result = itemDao.update(itemDto);
		if(result) {
			attr.addAttribute("itemNo",itemDto.getItemNo());
			return "redirect:detail";
		}
		else {
			throw new TargetNotFoundException("아이템 번호없음");
		}
	}
	
	//상품 삭제
	@GetMapping("/delete")
	public String delete(@RequestParam int itemNo) {
		boolean result = itemDao.delete(itemNo);
		if(result) {
			return "redirect:list";
		}
		else {
			throw new TargetNotFoundException("아이템 번호없음");
		}
		
	}
	
//	@GetMapping("/buylist")
//	public String buylist(Model model, 
//			@RequestParam int itemNo, HttpSession session) {
//		model.addAttribute("itemDto", itemDao.selectOne(itemNo));
//		
//		//(+추가) 좋아요 기록이 있는지 조회하여 첨부
//		String loginId = (String) session.getAttribute(SessionConstant.ID);
//		
//		if(loginId != null) {//회원이라면 좋아요 기록을 조회하여 model에 추가
//			CustomerLikeDto customerLikeDto = new CustomerLikeDto();
//			customerLikeDto.setCustomerId(loginId);
//			customerLikeDto.setItemNo(itemNo);
//			model.addAttribute("isLike", customerLikeDao.check(customerLikeDto));
//		}
//		
//		return "item/buylist";
//	}
//	
//	//좋아요
//	@GetMapping("/like")
//	public String customerLike(@RequestParam int itemNo, 
//			HttpSession session, RedirectAttributes attr) {
//		String loginId = (String)session.getAttribute(SessionConstant.ID);
//		CustomerLikeDto customerLikeDto = new CustomerLikeDto();
//		customerLikeDto.setCustomerId(loginId);
//		customerLikeDto.setItemNo(itemNo);
//		
//		if(customerLikeDao.check(customerLikeDto)) {//좋아요를 한 생태면
//			customerLikeDao.delete(customerLikeDto);//지우세요
//		}
//		else {//좋아요를 한 적이 없는 상태면
//			customerLikeDao.insert(customerLikeDto);//추가하세요
//		}
//		
//		customerLikeDao.refresh(itemNo);//좋아요 조회수 갱신
//		
//		attr.addAttribute("itemNo",itemNo);
//		return "redirect:/item/buylist";
//		
//	}
}
