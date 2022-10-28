package com.example.semiproject3.entity;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @Builder @NoArgsConstructor @AllArgsConstructor
public class OrdersDto {

	private int ordersNo;
	private String customerId;
	private int itemNo;
	private String customerName;
	private String customerPhone;
	private String addressName;
	private String addressPhone;
	private String customerPost;
	private String customerHost;
	private String customerDetailHost;
	private int payMoney;
	private int deliveryFee;
	private String itemName;
	private int itemPrice;
	private String itemSize;
	private String itemColor;
	private int itemCnt;
	private Date ordersTime;
}
