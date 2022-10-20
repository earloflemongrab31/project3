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
public class CustomerLikeDto {
	
		private String customerId;
		private int itemNo;
		private Date likeDate;
	
}
