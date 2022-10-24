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
public class CartListVO {
	private int imageNo;
	private int cartNo;
	private String customerId;
	private int itemNo;
	private int cartItemMoney;
	private String cartItemName;
	private int cartItemPrice;
	private String cartItemColor;
	private String cartItemSize;
	private Date cartDate;
	private String imageMain;
}
