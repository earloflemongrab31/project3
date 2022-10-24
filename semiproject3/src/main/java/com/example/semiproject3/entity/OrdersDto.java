package com.example.semiproject3.entity;

import java.sql.Date;

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
	private String itemName;
	private int itemPrice;
	private String itemColor;
	private String itemSize;
	private int ordersCnt;
	private Date ordersDate;
	private int buyFee;
	private String customerPhone;
	
	
}
