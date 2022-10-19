package com.example.semiproject3.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class AdminDto {

	private String adminId;
	private String adminPw;
	private String adminName;
	private String adminNick;
	private String adminGrade;
			
}
