package com.example.semiproject3.entity;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class AddressEditDto {

	private List<Integer> addressNo;
	private String customerId;
	private String addressName;
	private String addressPost;
	private String addressHost;
	private String addressDetailHost;
	private String addressBasic;
	
}

