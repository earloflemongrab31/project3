package com.example.semiproject3.entity;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @AllArgsConstructor @NoArgsConstructor @Builder
public class ResearchDto {

	private int researchNumber;
	private String researchCustomerId;
	private String researchSex;
	private String researchAge;
	private String researchPath;
	private String researchInterest;
	private String researchBest;
	private String researchSatisfaction;
	private String researchPayment;
	private String researchPurpose;
	private String researchComplain;
	private String researchIdea;
	private Date researchDate;
}
