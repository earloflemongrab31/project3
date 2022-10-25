package com.example.semiproject3.entity;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @AllArgsConstructor @NoArgsConstructor @Builder
public class CardDto {
	private int cardNo;
	private String cardName,cardType;
	private long cardSize;
	private Date cardTime;
}
