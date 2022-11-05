package com.example.semiproject3.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @Builder @NoArgsConstructor @AllArgsConstructor
public class OrdersDto {

	private int ordersNo;
	private String customerId;
	private int itemNo;
	private String itemName;
	private int itemPrice;
	private String itemColor;
	private String itemSize;
	private int itemCnt;
	private int imageNo;
}
