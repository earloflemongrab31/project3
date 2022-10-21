package com.example.semiproject3.entity;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data @NoArgsConstructor @AllArgsConstructor @Builder 
public class InvenDto {
	private int invenNo;
	private int itemNo;
	private int itemCate;
	private String itemName;
	private String itemSize;
	private String itemColor;
	private String invenInout;
	private Date invenDate;
	private String invenName;
	private String invenPhone;
	private String invenStatus;
	private int invenQuantity;
}
