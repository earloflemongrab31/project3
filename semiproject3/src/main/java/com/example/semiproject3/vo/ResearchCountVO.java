package com.example.semiproject3.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data@NoArgsConstructor@AllArgsConstructor@Builder
public class ResearchCountVO {
	private String researchSex;
	private String researchAge;
	private String researchPath;
	private String researchInterest;
	private String researchBest;
	private String researchSatisfaction;
	private int cnt;
	
}
