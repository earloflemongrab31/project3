package com.example.semiproject3.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.semiproject3.entity.AddressDto;
import com.example.semiproject3.error.TargetNotFoundException;
import com.example.semiproject3.repository.AddressDao;

@Controller
@RequestMapping("/address")

public class AddressController {
   
   @Autowired
   private AddressDao addressDao;
   
   //등록
   @GetMapping("/insert")
   public String insert() {
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
   
   //목록
   @GetMapping("/list")
   public String list(Model model, 
               @RequestParam(required = false) String type,
               @RequestParam(required = false) String keyword) {
      boolean isSearch = type != null && keyword != null;
      if(isSearch) { // 검색
         model.addAttribute("list", addressDao.selectList(type, keyword));
      }
      else { //목록
         model.addAttribute("list", addressDao.selectList());
      }
      
      

    List<AddressDto>listBasic=addressDao.selectOneBasic();
  	model.addAttribute("listBasic", listBasic);
        
      return "address/list";
   }
   
   //수정
   @GetMapping("/edit")
   public String edit(Model model, @RequestParam int addressNo) {
      model.addAttribute("addressDto", addressDao.selectOne(addressNo));
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