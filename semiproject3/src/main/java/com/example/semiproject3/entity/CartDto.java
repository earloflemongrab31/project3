package com.example.semiproject3.entity;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @AllArgsConstructor @NoArgsConstructor @Builder
public class CartDto {
	private int cartNo;
	private String customerId;
	private int itemNo;
	private int cartItemMoney;
	private String cartItemName;
	private int cartItemPrice;
	private String cartItemColor;
	private String cartItemSize;
	private Date cartDate;
}

