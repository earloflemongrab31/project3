package com.example.semiproject3.repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.example.semiproject3.entity.CompanyDto;
import com.example.semiproject3.vo.CompanyListSearchVO;

@Repository
public class CompanyDaoImpl implements CompanyDao{
	
	@Autowired 
	JdbcTemplate jdbcTemplate;
	
	//RowMapper
	private RowMapper<CompanyDto> mapper=new RowMapper<CompanyDto>() {
		@Override
		public CompanyDto mapRow(ResultSet rs, int idx) throws SQLException {
			return CompanyDto.builder()
					.companyNo(rs.getInt("company_no"))
					.companyName(rs.getString("company_name"))
					.companyNumber(rs.getString("company_number"))
					.companyAddress(rs.getString("company_address"))
					.customerName(rs.getString("customer_name"))
					.customerRank(rs.getString("customer_rank"))
					.customerNumber(rs.getString("customer_number"))
					.companyExplan(rs.getString("company_explan"))
				.build();
		}
	};
	
	
	//RowMapper2+이미지추가 
		private RowMapper<CompanyDto> mapper2=new RowMapper<CompanyDto>() {
			@Override
			public CompanyDto mapRow(ResultSet rs, int idx) throws SQLException {
				return CompanyDto.builder()
						.companyNo(rs.getInt("company_no"))
						.companyName(rs.getString("company_name"))
						.companyNumber(rs.getString("company_number"))
						.companyAddress(rs.getString("company_address"))
						.customerName(rs.getString("customer_name"))
						.customerRank(rs.getString("customer_rank"))
						.customerNumber(rs.getString("customer_number"))
						.companyExplan(rs.getString("company_explan"))
						.imageNo(rs.getInt("image_no"))
					.build();
			}
		};
		
	//ResultSetExtractor
	private ResultSetExtractor<CompanyDto> extractor= new ResultSetExtractor<CompanyDto>() {
		@Override
		public CompanyDto extractData(ResultSet rs) throws SQLException, DataAccessException {
			if(rs.next()) {
				return CompanyDto.builder()
						.companyNo(rs.getInt("company_no"))
						.companyName(rs.getString("company_name"))
						.companyNumber(rs.getString("company_number"))
						.companyAddress(rs.getString("company_address"))
						.customerName(rs.getString("customer_name"))
						.customerRank(rs.getString("customer_rank"))
						.customerNumber(rs.getString("customer_number"))
						.companyExplan(rs.getString("company_explan"))
					.build();
			}else {
				return null;
			}
		}
	};
	
	//번호 생성
	@Override
	public int sequence() {
		String sql = "select company_seq.nextval from dual";
		
		return jdbcTemplate.queryForObject(sql, int.class);
	}
		
	
	//입력
	@Override
	public void insert(CompanyDto companyDto) {
		String sql="insert into company "
				+ "values(?,?,?,?,?,?,?,?)";
		Object[] param= {
				companyDto.getCompanyNo(),
				companyDto.getCompanyName(),
				companyDto.getCompanyNumber(),
				companyDto.getCompanyAddress(),
				companyDto.getCustomerName(),
				companyDto.getCustomerRank(),
				companyDto.getCustomerNumber(),
				companyDto.getCompanyExplan()
		};
		jdbcTemplate.update(sql,param);
	}
	//상세
	@Override
	public CompanyDto selectOne(int companyNo) {
		String sql="select * from company where company_no=?";
		Object[] param= {companyNo};
		return jdbcTemplate.query(sql,extractor,param);
	}
	
	//목록
	@Override
	public List<CompanyDto> selectList() {
		String sql="select * from company order by company_no desc";
		return jdbcTemplate.query(sql, mapper);
	}
	
	//수정
	@Override
	public boolean update(CompanyDto companyDto) {
		String sql="update company set "
				+ "company_name=?,"
				+ "company_number=?, "
				+ "company_address=?, "
				+ "customer_name=?, "
				+ "customer_rank=?, "
				+ "customer_number=?, "
				+ "company_explan=?  "
				+ " where company_no=?";
		Object[] param= {
				companyDto.getCompanyName(),
				companyDto.getCompanyNumber(),
				companyDto.getCompanyAddress(),
				companyDto.getCustomerName(),
				companyDto.getCustomerRank(),
				companyDto.getCustomerNumber(),
				companyDto.getCompanyExplan(),
				companyDto.getCompanyNo()
		};
		return jdbcTemplate.update(sql, param)>0;
	}
	//삭제
	@Override
	public boolean delete(int companyNo) {
	String sql="delete company where company_no=?";
	Object[] param= {companyNo};
	return jdbcTemplate.update(sql,param)>0;
}

	
	@Override
	public List<CompanyDto> selectList(CompanyListSearchVO vo) {
		if(vo.isSearch()) { //검색
		return search(vo);
		}
		else {
			return list(vo);
		}
	}


	@Override
	public List<CompanyDto> list(CompanyListSearchVO vo) {
		String sql = "select * from ("
				+ "select rownum rn, TMP.* from("
					+ "select * from company order by company_no desc"
				+ ")TMP"
			+ ") where rn between ? and ?";
		Object[] param = {vo.startRow(), vo.endRow()};
		return jdbcTemplate.query(sql, mapper, param);
	}


	@Override
	public List<CompanyDto> search(CompanyListSearchVO vo) {
		String sql = "select * from ("
				+ "select rownum rn, TMP.* from ("
					+ "select * from company where instr(#1,?) > 0 "
					+ "order by company_no desc"
				+ ")TMP"
			+ ") where rn between ? and ?";
		sql = sql.replace("#1", vo.getType());
		Object[] param = {
				vo.getKeyword(), vo.startRow(), vo.endRow()
		};
		return jdbcTemplate.query(sql, mapper, param);
	}


	@Override
	public int count(CompanyListSearchVO vo) {
		if(vo.isSearch()) {//검색
			return searchCount(vo);
		}
		else {
			return listCount(vo);
		}
	}

	@Override
	public int searchCount(CompanyListSearchVO vo) {
		String sql = "select count(*) from company where instr(#1, ?) > 0";
		sql = sql.replace("#1", vo.getType());
		Object[] param = {vo.getKeyword()};
		return jdbcTemplate.queryForObject(sql, int.class, param);
	}


	@Override
	public int listCount(CompanyListSearchVO vo) {
		String sql = "select count(*) from company";
		return jdbcTemplate.queryForObject(sql, int.class);
	}
	
	@Override
	public void connectAttachment(int companyNo, int imageNo) {
		String sql="insert into company_image values(?,?) ";
		Object[] param= {companyNo,imageNo};
		jdbcTemplate.update(sql,param);
	}
	
	@Override
	public List<CompanyDto> selectList2() {
		String sql="select * from company_image_view";
		return jdbcTemplate.query(sql, mapper2);
	}
}