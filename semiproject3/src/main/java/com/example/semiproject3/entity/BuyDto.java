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
	private int buyNo, itemNo, itemCnt, deliveryFee, itemTotalPrice;
	private String customerId, deliveryStatus, itemName, itemSize, itemColor, 
	deliveryName, deliveryPhone, deliveryPost, deliveryHost, deliveryDetailHost;
	private Date buyDate;
}
