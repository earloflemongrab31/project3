package com.example.semiproject3.controller;

import java.io.File;
import java.io.IOException;

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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.semiproject3.entity.CardDto;
import com.example.semiproject3.entity.CompanyDto;
import com.example.semiproject3.repository.CardDao;
import com.example.semiproject3.repository.CompanyDao;

@Controller
@RequestMapping("/company")
public class CompanyController {

	@Autowired
	private CompanyDao companyDao;
	@Autowired
	private CardDao cardDao;
	
	@GetMapping("/insert")
	public String insert() {
		return "company/insert";
	}
	@PostMapping("/insert")
	public String insert(
			@ModelAttribute CompanyDto companyDto,
			RedirectAttributes attr,
			@RequestParam MultipartFile card) throws IllegalStateException, IOException {
		//Db저장
		int cardNo=cardDao.sequence();
		cardDao.insert(
				CardDto.builder()
				.cardNo(cardNo)
				.cardName(card.getOriginalFilename())
				.cardType(card.getContentType())
				.cardSize(card.getSize())
				.build());
		//파일저장
		File dir=new File("D:/upload");
		dir.mkdirs();
		File target=new File(dir, String.valueOf(cardNo));
		card.transferTo(target);
		
		int no=companyDao.sequence();
		companyDto.setCompanyNo(no);
		companyDao.insert(companyDto);
		attr.addAttribute("companyNo",companyDto.getCompanyNo());
		return "redirect:detail";
	}
	
	@GetMapping("/detail")
	public String detail(
			@RequestParam int companyNo,
			Model model
			){
		model.addAttribute("companyDto",companyDao.selectOne(companyNo));
		return "company/detail";
	}
	@GetMapping("/list")
	public String list(Model model){
		model.addAttribute("list",companyDao.selectList());
		return "company/list";
	}
	@GetMapping("/delete")
	public String delete(@RequestParam int companyNo) {
		companyDao.delete(companyNo);
		return "redirect:list";
	}
	@GetMapping("/update")
	public String update(
			@RequestParam int companyNo,
			Model model) {
		//하나의 정보를 불러와 jsp에 뿌려준다. 
		model.addAttribute("companyDto",companyDao.selectOne(companyNo));
		return "company/update";
	}
	@PostMapping("/update")
	public String update(
			@ModelAttribute CompanyDto companyDto,
			RedirectAttributes attr) {
		companyDao.update(companyDto);
		attr.addAttribute("companyNo",companyDto.getCompanyNo());
		return "redirect:detail";
	}
	// 명함 이미지 
	@GetMapping("/cardList")
	public String cardlist(Model model) {
		model.addAttribute("list", cardDao.selectList());
		return "company/cardList";
	}
	@GetMapping("/download")
	public ResponseEntity<ByteArrayResource> download(
			@RequestParam int cardNo) throws IOException{
		// db 파일탐색 
		CardDto dto=cardDao.selectOne(cardNo);
		if(dto==null) {//파일이 없으면
			return ResponseEntity.notFound().build();
		}
		//파일불러고오기 
		File dir=new File("D:/upload");
		File target=new File(dir,String.valueOf(cardNo));
		byte[] data=FileUtils.readFileToByteArray(target);
		ByteArrayResource resource=new ByteArrayResource(data);
		
		//응답 객체를 만들어 데이터 전송 
		return ResponseEntity.ok()
				.header("Content-Encoding", "UTF-8")
				.header("Content-Length", String.valueOf(dto.getCardSize()))
				.header("Content-Disposition", "attachment:filename"+dto.getCardName())
				.header("Content-Type", dto.getCardType())
				.body(resource);
	}
}
