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
	private int orderNo;
	private String CustomerId;
	private int itemNo;
	private int addressNo;
	private int buyCnt;
	private Date buyDate;
}
