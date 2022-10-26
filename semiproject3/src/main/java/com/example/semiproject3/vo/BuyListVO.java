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
public class BuyListVO {
	private int imageNo;
	private int itemNo;
	private String itemCate;
	private String itemName;
	private String itemMemo;
	private String itemContent;
	private int itemPrice;
	private String itemColor;
	private String itemSize;
	private int itemTotalCnt;
	private int itemLikeCnt;
	private Date itemDate;
	private String imageMain;
	private int invenQuantity;
}
