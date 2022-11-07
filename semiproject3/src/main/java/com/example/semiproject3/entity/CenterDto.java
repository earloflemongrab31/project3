package com.example.semiproject3.entity;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class CenterDto {

	private int centerNo;
	private String customerId;
	private String adminId;
	private String centerTitle;
	private String customerContent;
	private String adminContent;
	private Date customerDate;
	private Date adminDate;
	private String centerHead;
	private String moneyConfirm;
}
