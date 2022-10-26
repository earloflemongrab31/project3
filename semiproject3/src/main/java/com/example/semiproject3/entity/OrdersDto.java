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
	private int addressNo;
	private String customerName;
	private String customerNick;
	private String customerPhone;
	private String itemName;
	private String itemColor;
	private String itemSize;
	private String addressName;
	private String customerPost;
	private String customerHost;
	private String customerDetailHost;
	private int customerPoint; //0
	private int itemCnt; //0
	private int itemFee; //3000
	private int customerMoney; //0
	
	
}
