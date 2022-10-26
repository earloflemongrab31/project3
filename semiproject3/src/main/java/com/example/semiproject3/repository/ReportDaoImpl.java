package com.example.semiproject3.repository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.example.semiproject3.entity.ReportDto;

@Repository
public class ReportDaoImpl implements ReportDao{
	
	@Autowired
	JdbcTemplate jdbcTemplate;
	
	//입력
	@Override
	public void insert(ReportDto reportDto) {
		String sql="insert into report values(report_seq.nextval,?,?,?,?,sysdate)";
		Object[] param= {
				reportDto.getCustomerId(),
				reportDto.getReviewContent(),
				reportDto.getReportRadio(),
				reportDto.getReportContent()
		};
		jdbcTemplate.update(sql,param);
		
	}

}
