package com.example.semiproject3.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder

public class OrdersDto {

	private int ordersNo;
	private String customerId;
	private int itemNo;
	private int addressNo;
	private String customerName;
	private String customerNick;
	private String customerPhone;
	private int customerPoint;
	private String itemName;
	private String itemColor;
	private String itemSize;
	private int itemCnt;
	private String addressName;
	private String customerPost;
	private String customerHost;
	private String customerDetailHost;
	private String customerMoney;
	
	
}
