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

import com.example.semiproject3.entity.InvenDto;
import com.example.semiproject3.entity.ItemDto;
import com.example.semiproject3.repository.CompanyDao;
import com.example.semiproject3.repository.InvenDao;
import com.example.semiproject3.repository.ItemCntDao;
import com.example.semiproject3.repository.ItemDao;
import com.example.semiproject3.vo.InvenListSearchVO;
import com.example.semiproject3.vo.ItemListSearchVO;

@Controller
@RequestMapping("/warehouse")
public class InvenController {
	
	@Autowired
	private ItemDao itemDao;
	
	@Autowired
	
	private InvenDao invenDao;
	
	@Autowired
	private CompanyDao companyDao;

	@Autowired
	private ItemCntDao itemCntDao;
	
//	@GetMapping("/itemList")
//	public String itemList(
//			Model model,
//			@RequestParam(required = false) String type,
//			@RequestParam(required = false) String keyword) {
//			boolean isSearch = type != null && keyword != null;
//			if(isSearch) {//검색
//				model.addAttribute("itemList", itemDao.selectList(type, keyword));
//				}
//			else {//목록
//				model.addAttribute("itemList", itemDao.selectList());
//				}
//		return "warehouse/itemList";
//	}
	
	
	//전체 상품 현황 리스트
	@GetMapping("/itemList")
	public String itemList(
			Model model, 
			@ModelAttribute(name="vo") ItemListSearchVO vo) {
			//페이지 네비게이터를 위한 게시글 수를 전달
			int count = itemDao.itemCount(vo);
			vo.setCount(count);
			
			model.addAttribute("invenList", itemDao.selectItemList(vo));
			
			return "warehouse/itemList";
	}
	
	//인벤리스트
	@GetMapping("/invenList")
	public String invenList(
			Model model,
			@ModelAttribute(name="vo") InvenListSearchVO vo) {
			//페이지 네비게이터를 위한 게시글 수를 전달
			int count = invenDao.count(vo);
			vo.setCount(count);
		
			model.addAttribute("invenList", invenDao.selectList(vo));

		return "warehouse/invenList";
	}
	
	@GetMapping("/insert")
	public String insert(
			@RequestParam int itemNo,
			@RequestParam(required = false) String itemSize,
			@RequestParam(required = false) String itemColor,
			Model model) {
		//사이즈, 색상을 처음 등록할 때 값이 없음
		boolean repeat = itemSize != null && itemColor != null;
		
		InvenDto invenDto = InvenDto.builder()
										.itemNo(itemNo)
										.itemSize(itemSize)
										.itemColor(itemColor)
									.build();
		if(repeat) {
			model.addAttribute("itemCntDto", itemCntDao.selectOne(invenDto));
		}

		//하나의 아이템정보를 가지고와서 화면에 뿌려준다. 
		model.addAttribute("itemDto", itemDao.selectOne(itemNo));
		//회사 정보를 가지고와서 화면에 뿌려준다. 
		model.addAttribute("companyList",companyDao.selectList());
		return "warehouse/insert";
	}
	
	@PostMapping("/insert")
	public String insert(
			@ModelAttribute InvenDto invenDto,
			RedirectAttributes attr) {
		
		boolean search = itemCntDao.selectOne(invenDto) == null;

		invenDao.insert(invenDto);

		attr.addAttribute("itemNo", invenDto.getItemNo());
		
		if(search) {
			itemCntDao.insert(invenDto);
			invenDao.invenIn(invenDto.getInvenQuantity(), invenDto.getItemNo());
			itemCntDao.plus(invenDto);
			itemDao.plus(invenDto);
			return "redirect:detail";
		}
		else {
			if((invenDto.getInvenStatus()).equals("입고완료")){
				itemCntDao.plus(invenDto);
				invenDao.invenIn(invenDto.getInvenQuantity(), invenDto.getItemNo());
				itemDao.plus(invenDto);
				return "redirect:detail";
			}else if((invenDto.getInvenStatus()).equals("출고완료")) {
				itemCntDao.minus(invenDto);
				invenDao.invenOut(invenDto.getInvenQuantity(), invenDto.getItemNo());
				itemDao.minus(invenDto);
				return "redirect:detail";
			}else {
				return "redirect:detail";
			}
		}
	}
	
	@GetMapping("/detail")
	public String detail(
			RedirectAttributes attr,
			Model model,
			@RequestParam int itemNo) {
		model.addAttribute("itemDto", itemDao.selectOne(itemNo));
		
		model.addAttribute("itemCntList", itemCntDao.selectList(itemNo));
		
		attr.addAttribute(itemNo);
		return "warehouse/detail";
	}

}
