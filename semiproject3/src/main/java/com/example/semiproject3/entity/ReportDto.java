package com.example.semiproject3.entity;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @AllArgsConstructor @NoArgsConstructor @Builder
public class ReportDto {

	private int reportNo;
	private String customerId;
	private String reviewContent;
	private String reportRadio;
	private Date reportDate;
	private String reportContent;
	private String who;
	
}
