package com.example.semiproject3.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class MainImageDto {
	private int mainNo;
	private int imageNo;
	private String imagePath;
}
