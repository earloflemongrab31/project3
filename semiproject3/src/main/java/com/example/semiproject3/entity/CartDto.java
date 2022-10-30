package com.example.semiproject3.entity;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @AllArgsConstructor @NoArgsConstructor @Builder
public class CartDto {
	private int imageNo;
	private int cartNo;
	private String customerId;
	private int itemNo;
	private int itemTotalCnt;
	private String itemName;
	private String itemColor;
	private String itemSize;
	private int itemCnt;
	private Date cartDate;
	private int itemPrice;
	private int deliveryFee;
	private int cartPrice;
	
}
