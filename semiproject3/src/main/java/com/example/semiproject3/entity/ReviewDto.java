package com.example.semiproject3.entity;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class ReviewDto {
	private int reviewNo;
	private String customerId;
	private int itemNo;
	private String reviewContent;
	private int reviewStar;
	private String reviewShipping;
	private String reviewPackaging;
	private Date reviewDate;
	private int imageNo;
	private boolean reviewBlind;
	}

