package com.example.semiproject3.entity;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data @NoArgsConstructor @AllArgsConstructor @Builder 
public class InvenDto {
	
	private int itemNo, itemCnt;
	private Date itemIn, itemOut;
	private String itemSize, itemColor;
	
}
