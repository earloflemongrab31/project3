package com.example.semiproject3.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

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
import com.example.semiproject3.entity.ImageDto;
import com.example.semiproject3.repository.CardDao;
import com.example.semiproject3.repository.CompanyDao;
import com.example.semiproject3.repository.ImageDao;
import com.example.semiproject3.vo.CompanyUniteVO;

@Controller
@RequestMapping("/company")
public class CompanyController {

   @Autowired
   private CompanyDao companyDao;
   @Autowired
   private CardDao cardDao;
   @Autowired
   private ImageDao imageDao;
   
   @GetMapping("/insert")
   public String insert() {
      return "company/insert";
   }
   @PostMapping("/insert")
   public String insert(
         @ModelAttribute CompanyDto companyDto,
         RedirectAttributes attr,
         @RequestParam List<MultipartFile> attachment) throws IllegalStateException, IOException {
      
         int companyNo=companyDao.sequence();
         companyDto.setCompanyNo(companyNo);
         companyDao.insert(companyDto);
         attr.addAttribute("companyNo",companyDto.getCompanyNo());
         
      
         
         for(MultipartFile file:attachment) {
            if(!file.isEmpty()) {
               
               //DB등록
               int imageNo=imageDao.sequence();
               imageDao.insert(ImageDto.builder()
                     .imageNo(imageNo)
                     .imageName(file.getOriginalFilename())
                     .imageType(file.getContentType())
                     .imageSize(file.getSize())
                     .build());
               
               //파일저장
//               File dir=new File("D:/upload/card");
               File dir=new File("D:/upload/kh10C/card");
               dir.mkdirs();
               File target = new File(dir,String.valueOf(imageNo));
               file.transferTo(target);
               
               
               // 연결테이블에 연결정보저장(컴퍼니번호  / 첨부파일번호)
                  companyDao.connectAttachment(companyNo, imageNo);
            }
            
         }
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
   
   //목록(페이징처리)
   @GetMapping("/list")
   public String list(Model model, 
         @ModelAttribute(name="vo") CompanyUniteVO vo) {

      //페이지 네비게이터를 위한 게시글 수를 전달
      int count = companyDao.count(vo);
      vo.setCount(count);
      
      //model.addAttribute("list", companyDao.selectList(vo));
      model.addAttribute("list",companyDao.selectList(vo));
      model.addAttribute("param",vo);
      return "company/list";
   }
   
   // 명함 이미지(페이징처리)
   @GetMapping("/cardList")
   public String cardlist(Model model,
         @ModelAttribute(name="vo") CompanyUniteVO vo){
      
      int count = cardDao.count(vo);
      
      vo.setCount(count);
      
      
      model.addAttribute("param",vo);
      model.addAttribute("cardList",cardDao.selectList(vo));
      return "company/cardList";
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
   
   @GetMapping("/download")
   public ResponseEntity<ByteArrayResource> download(
         @RequestParam int cardNo) throws IOException{
      // db 파일탐색 
      CardDto dto=cardDao.selectOne(cardNo);
      if(dto==null) {//파일이 없으면
         return ResponseEntity.notFound().build();
      }
      //파일불러고오기 
//      File dir=new File("D:/upload/card");
      File dir=new File("D:/upload/kh10C/card");
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