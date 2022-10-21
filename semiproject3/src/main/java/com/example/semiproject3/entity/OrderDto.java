package com.example.semiproject3.entity;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder

public class OrderDto {

	private int orderNo;
	private String customerId;
	private int cartNo;
	private int itemNo;
	private int addressNo;
	private String itemName;
	private int itemPrice;
	private String itemColor;
	private String itemSize;
	private int orderCnt;
	private Date orderDate;
	private int buyFee;
	private String customerPhone;
	
	
}
