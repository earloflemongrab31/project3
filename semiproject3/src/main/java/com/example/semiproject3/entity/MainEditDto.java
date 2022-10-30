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
public class MainEditDto {
	private int mainNo;
	private String mainEditor;
	private String mainContent;
	private Date mainTime;
	private String searchHolder;
}
