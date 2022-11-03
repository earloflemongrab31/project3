package com.example.semiproject3.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
import com.example.semiproject3.entity.AdminDto;
import com.example.semiproject3.entity.ImageDto;
import com.example.semiproject3.entity.MainImageDto;
import com.example.semiproject3.error.TargetNotFoundException;
import com.example.semiproject3.repository.AdminDao;
import com.example.semiproject3.repository.CenterDao;
import com.example.semiproject3.repository.CustomerDao;
import com.example.semiproject3.repository.ImageDao;
import com.example.semiproject3.repository.MainEditDao;
import com.example.semiproject3.repository.MainImageDao;
import com.example.semiproject3.repository.NoticeDao;
import com.example.semiproject3.vo.BuyListSearchVO;

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
	
	@Autowired
	private  NoticeDao noticeDao;
	
	@Autowired
	private  CenterDao centerDao;
	
	@Autowired
	private  CustomerDao customerDao;

	
	@GetMapping("/")
	public String home(
			Model model, 
			HttpSession session) {
		String loginId = (String)session.getAttribute(SessionConstant.ID);
		model.addAttribute("adminDto", adminDao.selectOne(loginId));
		model.addAttribute("noticeList", noticeDao.selectListForMain());
		model.addAttribute("centerList", centerDao.selectListForMain());
		model.addAttribute("customerList", customerDao.selectList());
		return "admin/home";
	}
	
	@GetMapping("/insert")
	public String insert() {
		return "admin/insert";
	}
	
	@PostMapping("/insert")
	public String insert(@ModelAttribute AdminDto adminDto) {
		adminDao.insert(adminDto);
		return "redirect:list";
	}
	
	
	//페이징
	@GetMapping("/list")
	public String list(Model model,HttpSession session,
			@ModelAttribute(name="vo") BuyListSearchVO vo) { 
	
		int count = adminDao.count(vo);
		vo.setCount(count);
		
		String loginId = (String)session.getAttribute(SessionConstant.ID);
		model.addAttribute("list",adminDao.selectList());
		return "admin/list";
	}
	
	
	@GetMapping("/delete")
	public String delete(@RequestParam String adminId) {
		boolean result = adminDao.delete(adminId);
		if(result) {
			return "redirect:list";
		}
		else {
			throw new TargetNotFoundException("존재하지 않는 아이디입니다");
		}
		
	}
	
	
	@GetMapping("/edit")
	public String edit(Model model, @RequestParam String adminId) {
		model.addAttribute("adminDto", adminDao.selectOne(adminId));
		return "admin/edit";
	}
	
	@PostMapping("/edit")
	public String edit(@ModelAttribute AdminDto adminDto, RedirectAttributes attr) {

		boolean result = adminDao.update(adminDto);
	
		adminDto.getAdminId();
		
		// 메인관리자 변경시 나머지 일반 관리자로 업데이트
		adminDao.update2(adminDto);
		
		if(result) {
			attr.addAttribute("adminId",adminDto.getAdminId());
					return "redirect:/customer/login";
		}
		else {
			throw new TargetNotFoundException("변경실패");
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
	public String main(
			Model model) {
		model.addAttribute("mainEditDto", mainEditDao.select());
		model.addAttribute("pathList", mainImageDao.selectAll());
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
				
				File dir = new File("D:/study/main");
//					맥북용
//				File dir = new File(System.getProperty("user.home")+"/upload/main");
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
