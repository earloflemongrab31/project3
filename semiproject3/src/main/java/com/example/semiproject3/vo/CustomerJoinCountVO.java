package com.example.semiproject3.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data@NoArgsConstructor@AllArgsConstructor@Builder
public class CustomerJoinCountVO {

	private Date customerJoin;
	private int cnt;
}
