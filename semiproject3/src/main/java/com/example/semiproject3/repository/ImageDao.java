package com.example.semiproject3.repository;

import java.util.List;

import com.example.semiproject3.entity.ImageDto;

public interface ImageDao {
	//번호 생성
	int sequence();
	
	//이미지 등록
	void insert(ImageDto imageDto);
	
	//이미지 목록
	List<ImageDto> selectList();
	
	//이미지 정보	
	ImageDto selectOne(int imageNo);
	
	//이미지 삭제
	boolean delete(int imageNo);
	
	//아이템 이미지 관련(item_image_view 조회)
	List<ImageDto> selectItemImageList();
	List<ImageDto> selectItemImageList(int itemNo);
}
