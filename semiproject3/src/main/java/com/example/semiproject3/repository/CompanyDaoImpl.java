package com.example.semiproject3.repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.example.semiproject3.entity.CompanyDto;

@Repository
public class CompanyDaoImpl implements CompanyDao{

	@Autowired
	private JdbcTemplate jdbcTemplate;

	@Override
	public void insert(CompanyDto companyDto) {
		String sql = "insert into company values(?, ?, ?, ?, ?, ?, ?, ?)";
		Object[] param = {
				companyDto.getCompanyNo(), companyDto.getCompanyName(),
				companyDto.getCompanyNumber(), companyDto.getCompanyAddress(),
				companyDto.getCompanyName(), companyDto.getCustomerRank(),
				companyDto.getCustomerNumber(), companyDto.getCustomerExplan()
		};
		jdbcTemplate.update(sql, param);
	}
	
	private RowMapper<CompanyDto> mapper = new RowMapper<CompanyDto>() {

		@Override
		public CompanyDto mapRow(ResultSet rs, int rowNum) throws SQLException {
			return CompanyDto.builder()
						.companyNo(rs.getInt("company_no"))
						.companyName(rs.getString("company_name"))
						.companyNumber(rs.getString("company_number"))
						.companyAddress(rs.getString("company_address"))
						.customerName(rs.getString("customer_name"))
						.customerRank(rs.getString("customer_rank"))
						.customerNumber(rs.getString("customer_number"))
						.customerExplan(rs.getString("customer_explan"))
					.build();		
		}
		
	};
	
	private ResultSetExtractor<CompanyDto> extractor = (rs) -> {
		if(rs.next()) {
			return CompanyDto.builder()
					.companyNo(rs.getInt("company_no"))
					.companyName(rs.getString("company_name"))
					.companyNumber(rs.getString("company_number"))
					.companyAddress(rs.getString("company_address"))
					.customerName(rs.getString("customer_name"))
					.customerRank(rs.getString("customer_rank"))
					.customerNumber(rs.getString("customer_number"))
					.customerExplan(rs.getString("customer_explan"))
				.build();		
		}
		else {
			return null;
		}
	};


	@Override
	public CompanyDto selectOne(int companyNo) {
		String sql = "select * from company where company_no=?";
		Object[] param = {companyNo};
		return jdbcTemplate.query(sql, extractor, param);
	}

	@Override
	public List<CompanyDto> selectList() {
		String sql = "select * from company order by company_no desc";
		return jdbcTemplate.query(sql, mapper);
	}
}

