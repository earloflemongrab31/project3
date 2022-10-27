package com.example.semiproject3.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class OrdersItemDto {
	private String customerId;
	private int itemNo;
	private String itemName;
	private String itemSize;
	private String itemColor;
	private int itemCnt;
	private int itemPrice;
}
