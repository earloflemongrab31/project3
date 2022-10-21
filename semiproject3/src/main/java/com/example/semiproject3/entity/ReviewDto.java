package com.example.semiproject3.entity;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class ReviewDto {

	private int reviewNo, itemNo, reviewStar;
	private String customerId, reviewName, reviewContent;
	private Date reviewDate;
}
