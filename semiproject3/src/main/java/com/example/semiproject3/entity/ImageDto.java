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
public class ImageDto {
	private int imageNo;
	private String imageName;
	private String imageType;
	private Long imageSize;
	private Date imageTime;
	private String imageMain;
}
