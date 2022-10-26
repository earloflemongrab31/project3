package com.example.semiproject3.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ItemCntDto {
	private int itemNo;
	private String itemSize;
	private String itemColor;
	private int itemTotalCnt;
}
