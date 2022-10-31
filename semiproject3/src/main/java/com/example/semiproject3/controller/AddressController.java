package com.example.semiproject3.controller;

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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.semiproject3.constant.SessionConstant;
import com.example.semiproject3.entity.AddressDto;
import com.example.semiproject3.error.TargetNotFoundException;
import com.example.semiproject3.repository.AddressDao;
import com.example.semiproject3.repository.CartDao;
import com.example.semiproject3.repository.CustomerDao;
import com.example.semiproject3.vo.AddressUniteVO;

@Controller
@RequestMapping("/address")

public class AddressController {
   
	@Autowired
	private AddressDao addressDao;
   
	@Autowired
	private CustomerDao customerDao;
	
	@Autowired
	private CartDao cartDao;
   
   //등록
   @GetMapping("/insert")
   public String insert(Model model, HttpSession session) {
	   //장바구니 개수
	   String loginId = (String) session.getAttribute(SessionConstant.ID);
	   model.addAttribute("cartCount",cartDao.cartCount(loginId));
	   return "address/insert";
   }
   
   @PostMapping("/insert")
   public String insert(@ModelAttribute AddressDto addressDto) {
      int addressNo = addressDao.sequence();
      addressDto.setAddressNo(addressNo);
      
      addressDao.insert(addressDto);
      
      addressDao.basicUpdate(addressNo);
      
      
      return "redirect:list";
   }
   
//   //목록
//   @GetMapping("/list")
//   public String list(Model model, HttpSession session,
//               @RequestParam(required = false) String type,
//               @RequestParam(required = false) String keyword) {
//
//		  String loginId = (String) session.getAttribute(SessionConstant.ID);
//
//	      boolean isSearch = type != null && keyword != null;
//	      if(isSearch) { // 검색
//	         model.addAttribute("list", addressDao.selectList(type, keyword));
//	      }
//	      else { //목록
//	         model.addAttribute("list", addressDao.selectList(loginId));
//	      }
//      
//	      List<AddressDto>listBasic=addressDao.selectOneBasic(loginId);
//	      model.addAttribute("listBasic", listBasic);
//  	
//	      return "address/list";
//   }
  
   //목록 페이징 처리
   @GetMapping("/list")
   public String list(Model model,HttpSession session,
		   @ModelAttribute(name="vo") AddressUniteVO vo) {
   
   String loginId = (String) session.getAttribute(SessionConstant.ID);
   
   int count = addressDao.count(vo, loginId);
   vo.setCount(count);
		   
		   
   List<AddressDto>listBasic = addressDao.selectOneBasic(loginId);
   model.addAttribute("listBasic",addressDao.selectOneBasic(loginId));
   model.addAttribute("list",addressDao.selectList(loginId, vo));
   model.addAttribute("param",vo);
   
   //장바구니 개수
   model.addAttribute("cartCount",cartDao.cartCount(loginId));
   return "address/list";
   }
   
   
   
   //수정
   @GetMapping("/edit")
   public String edit(Model model, @RequestParam int addressNo, HttpSession session) {
      model.addAttribute("addressDto", addressDao.selectOne(addressNo));
      //장바구니 개수
      String loginId = (String) session.getAttribute(SessionConstant.ID);
      model.addAttribute("cartCount",cartDao.cartCount(loginId));
      return "address/edit";
      
   }
   
   @PostMapping("/edit")
   public String edit(@ModelAttribute AddressDto addressDto,
         RedirectAttributes attr) {
     
   boolean result = addressDao.update(addressDto);
   if(result) {
      attr.addAttribute("addressNo", addressDto.getAddressNo());
      return "redirect:list";
   }
   else {
      throw new TargetNotFoundException("주소 없음");
   }
}
   
   //주소 목록에서 바로 삭제
   @GetMapping("/delete")
   public String delete(@RequestParam(value="addressNo[]") List<Integer> addressNo) {
      
     for( int i = 0; i < addressNo.size(); i++) {
        boolean result = addressDao.delete(addressNo.get(i));
     }
      if(true) {   
         return "redirect:list";
      }
      else {
         throw new TargetNotFoundException("주소 없음");
      }
   }
   
}