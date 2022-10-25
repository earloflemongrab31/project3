package com.example.semiproject3.controller;

import java.util.List;

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
import com.example.semiproject3.entity.AdminDto;
import com.example.semiproject3.entity.ImageDto;
import com.example.semiproject3.entity.MainEditDto;
import com.example.semiproject3.error.TargetNotFoundException;
import com.example.semiproject3.repository.AdminDao;
import com.example.semiproject3.repository.ImageDao;

@Controller
@RequestMapping("/admin")

public class AdminController {

	@Autowired
	private AdminDao adminDao;
	
	@Autowired
	private ImageDao imageDao;
	
	@GetMapping("/")
	public String home() {
		return "admin/home";
	}
	
	@GetMapping("/insert")
	public String insert() {
		return "admin/insert";
	}
	
	@PostMapping("/insert")
	public String insert(@ModelAttribute AdminDto adminDto) {
		adminDao.insert(adminDto);
		return "redirect:/";
	}
	
	@GetMapping("/delete")
	public String delete(@RequestParam String adminId) {
		boolean result = adminDao.delete(adminId);
		if(result) {
			return "redirect:/";
		}
		else {
			throw new TargetNotFoundException("존재하지 않는 아이디입니다");
		}
		
	}
	
	@PostMapping("/login")
	public String login(HttpSession session,
			@RequestParam String adminId,
			@RequestParam String adminPw) {
		AdminDto findDto = adminDao.selectOne(adminId);
		
		if(findDto == null) {
			return "redirect:/customer/login?error";
		}
		
		boolean isLogin = adminPw.equals(findDto.getAdminPw());
		if(isLogin) {
			session.setAttribute(SessionConstant.ID, adminId);
			session.setAttribute(SessionConstant.GRADE, findDto.getAdminGrade());
			
			return "redirect:/admin/";
		}
		else {
			return "redirect:/customer/login?error";
		}
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.removeAttribute(SessionConstant.ID);
		session.removeAttribute(SessionConstant.GRADE);
		return "redirect:/login";
	}
	
	@GetMapping("/main")
	public String main() {
		return "admin/main";
	}
	
	@PostMapping("/main")
	public String main(
			HttpSession session,
			@RequestParam List<MultipartFile> mainImage,
			@ModelAttribute MainEditDto mainEditDto) {
		
		return "redirect:/";
	}
	
}
