package com.example.semiproject3.entity;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class CustomerDto {
	private String customerId;
	private String customerPw;
	private String customerPwsearch;
	private String customerNick;
	private String customerName;
	private String customerPhone;
	private String customerTel;
	private Date customerBirth;
	private String customerEmail;
	private int customerPoint;
	private int customerMoney;
	private String customerGrade;
	private Date customerJoin;
	private Date customerLogin;
	private int cartTotalCnt;
	private int cartTotalMoney;
	private int customerLike;
	
}
