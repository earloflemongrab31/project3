package com.example.semiproject3.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.semiproject3.entity.InvenDto;
import com.example.semiproject3.repository.CompanyDao;
import com.example.semiproject3.repository.InvenDao;
import com.example.semiproject3.repository.ItemCntDao;
import com.example.semiproject3.repository.ItemDao;
import com.example.semiproject3.vo.InvenListSearchVO;

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
	
	
	//아이템리스트
	@GetMapping("/itemList")
	public String itemList(
			Model model, 
			@ModelAttribute(name="vo") InvenListSearchVO vo) {
			//페이지 네비게이터를 위한 게시글 수를 전달
			int count = invenDao.count(vo);
			vo.setCount(count);
			
			model.addAttribute("invenList", invenDao.selectList(vo));
			
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
			Model model) {
		//하나의 아이템정보를 가지고와서 화면에 뿌려준다. 
			model.addAttribute("itemList", itemDao.selectOne(itemNo));
		//회사 정보를 가지고와서 화면에 뿌려준다. 
			model.addAttribute("companyList",companyDao.selectList());
		return "warehouse/insert";
	}
	@PostMapping("/insert")
	public String insert(@ModelAttribute InvenDto invenDto) {
		
		invenDao.insert(invenDto);

		if(itemCntDao.selectOne(invenDto) == null) {
			itemCntDao.insert(invenDto);
			if((invenDto.getInvenStatus()).equals("입고완료")){
				invenDao.invenIn(invenDto.getInvenQuantity(), invenDto.getItemNo());
				itemCntDao.plus(invenDto.getInvenQuantity(),invenDto.getItemNo());
				return "redirect:invenList";
			}else {
				return "redirect:invenList";
			}
		}
		else {
			if((invenDto.getInvenStatus()).equals("입고완료")){
				itemCntDao.plus(invenDto.getInvenQuantity(),invenDto.getItemNo());
				invenDao.invenIn(invenDto.getInvenQuantity(), invenDto.getItemNo());
				return "redirect:invenList";
			}else if((invenDto.getInvenStatus()).equals("출고완료")) {
				itemCntDao.minus(invenDto.getInvenQuantity(),invenDto.getItemNo());
				invenDao.invenOut(invenDto.getInvenQuantity(), invenDto.getItemNo());
				return "redirect:invenList";
			}else {
				return "redirect:invenList";
			}
		}
		
		
	}
	
	
}
