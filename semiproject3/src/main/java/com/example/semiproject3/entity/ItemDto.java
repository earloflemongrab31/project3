package com.example.semiproject3.entity;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ItemDto {
	private int itemNo;
	private String cateCode;
	private String itemName;
	private String itemMemo;
	private String itemContent;
	private int itemPrice;
	private String itemColor;
	private String itemSize;
	private int itemTotalCnt;
	private int itemLikeCnt;
	private Date itemDate;
	private int invenIn;
	private int invenOut;
}
