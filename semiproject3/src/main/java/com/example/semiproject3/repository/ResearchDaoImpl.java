package com.example.semiproject3.repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.example.semiproject3.entity.AddressDto;
import com.example.semiproject3.entity.ResearchDto;

@Repository
public class ResearchDaoImpl implements ResearchDao{
	
	@Autowired
	JdbcTemplate jdbcTemplate;
	
	
	private RowMapper <ResearchDto> mapper = new RowMapper<ResearchDto>() {

		@Override
		public ResearchDto mapRow(ResultSet rs, int rowNum) throws SQLException {
			ResearchDto researchDto = new ResearchDto();
			researchDto.setResearchNumber(rs.getInt("research_number"));
			researchDto.setResearchCustomerId(rs.getString("research_customerId"));
			researchDto.setResearchSex(rs.getString("research_sex"));
			researchDto.setResearchAge(rs.getString("research_age"));
			researchDto.setResearchPath(rs.getString("research_path"));
			researchDto.setResearchInterest(rs.getString("research_interest"));
			researchDto.setResearchBest(rs.getString("research_best"));
			researchDto.setResearchSatisfaction(rs.getString("research_satisfaction"));
			researchDto.setResearchPayment(rs.getString("research_payment"));
			researchDto.setResearchPurpose(rs.getString("research_purpose"));
			researchDto.setResearchComplain(rs.getString("research_complain"));
			researchDto.setResearchIdea(rs.getString("research_idea"));
			researchDto.setResearchDate(rs.getDate("research_date"));
			return researchDto;
		}
	};
	//insert 
	@Override
	public void insert(ResearchDto researchDto) {
		String sql="insert into research("
				+ "research_number,"
				+ "research_customerid,"
				+ "research_sex,"
				+ "research_age,"
				+ "research_path,"
				+ "research_interest,"
				+ "research_best,"
				+ "research_satisfaction,"
				+ "research_payment,"
				+ "research_purpose,"
				+ "research_complain,"
				+ "research_idea) "
				+ "values(research_seq.nextval,?,?,?,?,?,?,?,?,?,?,?)";
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
				researchDto.getResearchIdea()
		};
				jdbcTemplate.update(sql,param);
	}
	
		//리서치 아이디 중복방지
		@Override
		public int overlapId(String customerId) {
		String sql="select count(*) from research where research_customerId=?";
		Object[] param= {customerId};
		return jdbcTemplate.queryForObject(sql, int.class, param);
	}

		@Override
		public List<ResearchDto> selectList() {
			String sql = "select * from research order by research_number desc";
			return jdbcTemplate.query(sql, mapper);
		}
}
