package com.example.semiproject3.repository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.example.semiproject3.entity.ResearchDto;

@Repository
public class ResearchDaoImpl implements ResearchDao{
	
	@Autowired
	JdbcTemplate jdbcTemplate;
	
	//insert 
	@Override
	public void insert(ResearchDto researchDto) {
		String sql="insert into research values(research_seq.nextval,?,?,?,?,?,?,?,?,?,?,?,sysdate)";
		Object param[]= {
				researchDto.getResearchCustomerId(),
				researchDto.getResearchSex(),
				researchDto.getResearchAge(),
				researchDto.getResearchPath(),
				researchDto.getResearchInterest(),
				researchDto.getResearchBest(),
				researchDto.getResearchSatisfaction(),
				researchDto.getResearchPayment(),
				researchDto.getResearchPurpose(),
				researchDto.getResearchComplain(),
				researchDto.getResearchIdea(),
		};
				jdbcTemplate.update(sql,param);
	}
	
	
}
