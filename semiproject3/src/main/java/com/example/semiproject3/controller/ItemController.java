package com.example.semiproject3.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.annotation.PostConstruct;

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

import com.example.semiproject3.entity.ImageDto;
import com.example.semiproject3.entity.ItemDto;
import com.example.semiproject3.error.TargetNotFoundException;
import com.example.semiproject3.repository.ImageDao;
import com.example.semiproject3.repository.ItemDao;

@Controller
@RequestMapping("/item")
public class ItemController {
	
	@Autowired
	private ItemDao itemDao;
	
	@Autowired
	private ImageDao imageDao;
	
	
//	private final File directory = new File("C:/study/itemImage");
	private final File directory = new File("D:/study/itemImage");
	
	//이미지 저장소 폴더 생성
	@PostConstruct
	public void prepare() {//최소 실행시 딱 한번만 실행되는 코드
		directory.mkdirs();
	}
	
	//상품 등록
	@GetMapping("/insert")
	public String insert() {
		return "item/insert";
	}
	
	@PostMapping("/insert")
	public String insert(
			@ModelAttribute ItemDto itemDto,
			@RequestParam List<MultipartFile> itemImage) throws IllegalStateException, IOException {
		
		//등록 아이템에 미리 번호 생성
		int itemNo = itemDao.sequence();
		itemDto.setItemNo(itemNo);
		
		itemDao.insert(itemDto);
		
		//아이템을 등록한 후 이미지를 등록 및 연결
		for(MultipartFile image : itemImage) {
			
			if(!image.isEmpty()) {//이미지가 있다면
				
				//이미지 DB에 저장
				int imageNo = imageDao.sequence();
				imageDao.insert(ImageDto.builder()
										.imageNo(imageNo)
										.imageName(image.getOriginalFilename())
										.imageType(image.getContentType())
										.imageSize(image.getSize())
									.build());
				//파일 저장
				File target = new File(directory, String.valueOf(imageNo));
				image.transferTo(target);
				
				//+ 연결 테이블에 연결 정보를 저장(아이템 번호, 이미지 번호)
				itemDao.connectImage(itemNo,imageNo);
			}
		}
		
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
		
		//상품 정보에 이미지 불러오기
		model.addAttribute("itemImageList", imageDao.selectItemImageList(itemNo));
		
		return "item/detail";
	}
	
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
