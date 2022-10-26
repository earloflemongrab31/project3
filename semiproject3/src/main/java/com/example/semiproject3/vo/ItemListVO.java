package com.example.semiproject3.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ItemListVO {
	
	private int itemNo;
	private String itemSize;
	private String itemColor;
	private int itemTotalCnt;
	private String itemCate;
	private String itemName;
	private String itemMemo;
	private String itemContent;
	private int itemPrice;
	private int itemLikeCnt;
	private Date itemDate;
	private int imageNo;
	private String imageMain;
	
}
