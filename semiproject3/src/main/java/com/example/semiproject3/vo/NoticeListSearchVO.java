package com.example.semiproject3.vo;

import lombok.Data;
import lombok.ToString;


@Data
public class NoticeListSearchVO {

	private String type, keyword;
	@ToString.Include
	public boolean isSearch() {
		return type != null && keyword != null;
	}
	
	//현재 페이지 번호(없을 경우 1로 설정)
	private int p = 1;
	private int size = 10;
	
	@ToString.Include
	public int endRow() {
		return p * size;
	}
	
	@ToString.Include
	public int startRow() {
		return endRow() - (size - 1);
	}
	
	//총 게시글 수 
	private int count;
	
	//화면에 표시할 블럭 개수
	private int blockSize = 10;
	
	@ToString.Include
	public int pageCount() {
		return (count + size - 1) / size;
	}
	
	public int endBlock() {
		return (p+9);
	}
	
}
