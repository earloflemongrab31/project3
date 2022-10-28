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
	private int itemTotalCnt;
	private String itemName;
	private String itemColor;
	private String itemSize;
	private int itemCnt;
	private Date cartDate;
	private int itemPrice;
	private int deliveryFee;
	private int cartPrice;
	private String imageMain;
}
