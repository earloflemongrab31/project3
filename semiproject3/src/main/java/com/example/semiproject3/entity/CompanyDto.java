package com.example.semiproject3.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @AllArgsConstructor @NoArgsConstructor @Builder
public class CompanyDto {
	
	private int companyNo;
	private String companyName;
	private String companyNumber;
	private String companyAddress;
	private String customerName;
	private String customerRank;
	private String customerNumber;
	private String companyExplan;
}