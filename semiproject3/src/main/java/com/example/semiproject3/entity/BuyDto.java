package com.example.semiproject3.entity;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class BuyDto {
	private int buyNo;
	private String CustomerId;
	private String itemName;
	private int itemPrice;
	private String itemColor;
	private String itemSize;
	private int buyCnt;
	private Date buyDate;
	private int buyFee;
	private String customerPhone;
}
