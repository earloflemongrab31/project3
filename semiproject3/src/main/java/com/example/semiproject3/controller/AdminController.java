package com.example.semiproject3.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
import com.example.semiproject3.entity.MainImageDto;
import com.example.semiproject3.error.TargetNotFoundException;
import com.example.semiproject3.repository.AdminDao;
import com.example.semiproject3.repository.ImageDao;
import com.example.semiproject3.repository.MainEditDao;
import com.example.semiproject3.repository.MainImageDao;

@Controller
@RequestMapping("/admin")

public class AdminController {

	@Autowired
	private AdminDao adminDao;
	
	@Autowired
	private ImageDao imageDao;
	
	@Autowired
	private MainEditDao mainEditDao;

	@Autowired
	private MainImageDao mainImageDao;
	
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
		return "admin/mainEdit";
	}
	
	@PostMapping("/main")
	public String main(
			HttpSession session,
			@RequestParam List<MultipartFile> mainImage,
			@RequestParam String mainContent, 
			HttpServletRequest request,
			HttpServletResponse response) throws IllegalStateException, IOException {
		
		//기존 이미지 삭제
		List<MainImageDto> mainImageList = mainImageDao.selectAll();
		for(MainImageDto dto : mainImageList) {
			imageDao.delete(dto.getImageNo());
		}
		
		//로그인 된 아이디 수정한 사람으로 저장
		String editor = (String)session.getAttribute(SessionConstant.ID);

		if(mainEditDao.select() == null) {
			mainEditDao.insert(editor);
		}
		

		mainEditDao.update(editor, mainContent);
		
		/* html로부터 imagePath을 getParmeterValues로 배열로 전달 받아서 배열로 저장한다 */
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		String[] imagePath = request.getParameterValues("imagePath");
		
		
		//imagePath 배열 내용 추출용
		int num = 0;
		
		for(MultipartFile image : mainImage) {
			if(!image.isEmpty()) {
				int imageNo = imageDao.sequence();
				
				imageDao.insert(ImageDto.builder()
						.imageNo(imageNo)
						.imageName(image.getOriginalFilename())
						.imageType(image.getContentType())
						.imageSize(image.getSize())
						.imageMain("0")
				.build());
				
//					File dir = new File("D:/upload/main");
//					맥북용
				File dir = new File(System.getProperty("user.home")+"/upload/main");
				dir.mkdirs();
				
				File target = new File(dir, String.valueOf(imageNo));
				image.transferTo(target);
				
				//이미지랑 경로랑 같이 저장
				mainImageDao.insert(imageNo, imagePath[num]);
				
				num++;
			}
		}
		
		return "redirect:/";
	}
	
}
