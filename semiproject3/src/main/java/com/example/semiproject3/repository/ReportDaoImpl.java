package com.example.semiproject3.repository;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
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

	//RowMapper
	private RowMapper <ReportDto> mapper = (rs, idx) -> {
		return ReportDto.builder()
				.reportNo(rs.getInt("report_no"))
				.customerId(rs.getString("customer_id"))
				.reviewContent(rs.getString("review_content"))
				.reportRadio(rs.getString("report_radio"))
				.reportContent(rs.getString("report_content"))
				.reportDate(rs.getDate("report_date"))
				.build();
	};
	
	//목록
	@Override
	public List<ReportDto> selectList() {
		String sql = "select * from report order by report_no desc";
		return jdbcTemplate.query(sql, mapper);
	}

	@Override
	public List<ReportDto> selectList(String type, String keyword) {
		String sql = "select * from report where instr(#1, ?) > 0 order by #1 desc";
		sql = sql.replace("#1", type);
		Object[] param = {keyword};
		return jdbcTemplate.query(sql, mapper, param);
	}

}
