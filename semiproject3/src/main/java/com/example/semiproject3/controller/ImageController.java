package com.example.semiproject3.controller;

import java.io.File;
import java.io.IOException;
import java.nio.charset.StandardCharsets;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.semiproject3.entity.ImageDto;
import com.example.semiproject3.error.TargetNotFoundException;
import com.example.semiproject3.repository.ImageDao;

@RestController//@Controller+@ResponseBody
@RequestMapping("/image")
public class ImageController {
	
	@Autowired
	private ImageDao imageDao;
	

//	맥북용
//	private final File directory = new File(System.getProperty("user.home")+"/upload/main");
	private final File directory = new File(System.getProperty("user.home")+"/upload/itemImage");
//	화니꼬
//	private final File directory = new File("C:/study/itemImage");
//	D드라이브용
//	private final File directory = new File("D:/study/itemImage");
	
	//이미지 불러오기
	@GetMapping("/download/{imageNo}")
	public ResponseEntity<ByteArrayResource> download(@PathVariable int imageNo) throws IOException {
		
		//[1]DB에서 이미지 검색
		ImageDto imageDto = imageDao.selectOne(imageNo);
		if(imageDto == null) {//이미지 없으면
//			return ResponseEntity.notFound().build();//404 error 전송
			throw new TargetNotFoundException("이미지 없음");	
		}
			
		//[2] 찾은 이미지 불러오기
		File target = new File(directory, String.valueOf(imageNo));
		
		if(target.exists()) {//파일 존재
			//[2] 해당 파일의 내용을 불러온다.(apache commons io 의존성 필요)
			byte[] data = FileUtils.readFileToByteArray(target);
			ByteArrayResource resource = new ByteArrayResource(data);
			
			//[3] 사용자에게 보낼 응답 생성
			//- header에는 보낼 파일의 정보를, body에는 보낼 파일의 내용을 첨부
			return ResponseEntity.ok()//ResponseEntity(응답 객체)
//										.header("Content-Encoding", "UTF-8")
									.header(HttpHeaders.CONTENT_ENCODING, StandardCharsets.UTF_8.name())
									.header("Content-Length", String.valueOf(data.length))
									.header("Content-Disposition", "attachment; filename="+imageNo)
									.header("Content-Type", "application/octet-stream")//현재 보내는 데이터 유형 , "무조건 다운받아라"
									.body(resource);
		}
		else {//파일 없음
			//1) 우리가 정한 예외를 발생시키는 방법
			throw new TargetNotFoundException("아이템 없음");
			
			//2) 사용자에게 못 찾았음(404)을 전송
//				return ResponseEntity.notFound().build();
		}
	}
}
