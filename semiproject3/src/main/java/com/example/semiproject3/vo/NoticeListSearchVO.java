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
	
	public int endRow() {
		return p * size;
	}
	
	public int startRow() {
		return endRow() - (size - 1);
	}
}
