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

import com.example.semiproject3.entity.CenterDto;
import com.example.semiproject3.entity.CustomerDto;
import com.example.semiproject3.vo.CenterListSearchVO;

@Repository
public class CenterDaoImpl implements CenterDao {

	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	//로우매퍼
		private RowMapper<CenterDto> mapper = new RowMapper<CenterDto>() {
			
			@Override
			public CenterDto mapRow(ResultSet rs, int rowNum) throws SQLException {
				CenterDto centerDto = new CenterDto();
				centerDto.setCenterNo(rs.getInt("center_no"));
				centerDto.setCustomerId(rs.getString("customer_id"));
				centerDto.setAdminId(rs.getString("admin_id"));
				centerDto.setCenterTitle(rs.getString("center_title"));
				centerDto.setCustomerContent(rs.getString("customer_content"));
				centerDto.setAdminContent(rs.getString("admin_content"));
				centerDto.setCustomerDate(rs.getDate("customer_date"));
				centerDto.setAdminDate(rs.getDate("admin_date"));
				centerDto.setCenterHead(rs.getString("center_head"));
				centerDto.setMoneyConfirm(rs.getString("money_confirm"));
				return centerDto;
			}
		};
	
		//리절트셋
		
		private ResultSetExtractor<CenterDto> extractor = new ResultSetExtractor<CenterDto>() {

			@Override
			public CenterDto extractData(ResultSet rs) throws SQLException, DataAccessException {
				if(rs.next()) {
					CenterDto centerDto = new CenterDto();
					centerDto.setCenterNo(rs.getInt("center_no"));
					centerDto.setCustomerId(rs.getString("customer_id"));
					centerDto.setAdminId(rs.getString("admin_id"));
					centerDto.setCenterTitle(rs.getString("center_title"));
					centerDto.setCustomerContent(rs.getString("customer_content"));
					centerDto.setAdminContent(rs.getString("admin_content"));
					centerDto.setCustomerDate(rs.getDate("customer_date"));
					centerDto.setAdminDate(rs.getDate("admin_date"));
					centerDto.setCenterHead(rs.getString("center_head"));
					centerDto.setMoneyConfirm(rs.getString("money_confirm"));
					return centerDto;
				}
				else {
					return null;
				}
			}
		};
	
		//등록
		@Override
		public void insert(CenterDto centerDto) {
			String sql = "insert into center ("
					+ "center_no,"
					+ "customer_id,"
					+ "center_title,"
					+ "customer_content,"
					+ "customer_date, "
					+ "center_head)"
					+ "values (center_seq.nextval, ?, ?, ?, sysdate, ?)";
			Object[] param = {
					centerDto.getCustomerId(), centerDto.getCenterTitle(), 
					centerDto.getCustomerContent(), centerDto.getCenterHead()
			};
			jdbcTemplate.update(sql, param);
			
		}	

		
		
	//목록
	@Override
	public List<CenterDto> selectList() {
		String sql = "select * from center order by center_no desc";
		return jdbcTemplate.query(sql, mapper);
	}

	//타입키워드 목록
	@Override
	public List<CenterDto> selectList(String type, String keyword) {
		String sql = "select * from center where instr(#1, ?) > 0 order by center_no desc";
		//				"select * from center where DATE1 < 작성일  AND DATE2 > 작성일order by center_no desc";
		sql = sql.replace("#1", type);
		Object[] param = {keyword};
		return jdbcTemplate.query(sql, mapper, param);
	}

	//셀렉트원
	@Override
	public CenterDto selectOne(int centerNo) {
		String sql = "select * from center where center_no=?";
		Object[] param = {centerNo};
		return jdbcTemplate.query(sql, extractor, param);
	}

	//삭제
	@Override
	public boolean delete(int centerNo) {
		String sql ="delete center where center_no=?";
		Object[] param = {centerNo};
		return jdbcTemplate.update(sql, param) > 0;
	}

	//번호 생성(시퀀스)
	@Override
	public int sequence() {
		String sql = "select center_seq.nextval from dual";
		return jdbcTemplate.queryForObject(sql, int.class);
	}

	//수정
	@Override
	public boolean update(CenterDto centerDto) {
	String sql = "update center set admin_content=?, center_title=?, customer_content=?, admin_date=sysdate where center_no=?";
	Object[]param = {centerDto.getAdminContent(), centerDto.getCenterTitle(), centerDto.getCustomerContent(), centerDto.getCenterNo()};		
	return jdbcTemplate.update(sql, param) > 0;
		}

	//페이징
	@Override
	public int count(CenterListSearchVO vo) {
		if(vo.isSearch()) { //검색이라면
			return searchCount(vo);
		}
		else { //목록이라면
			return listCount(vo);
		}
	}

	@Override
	public int searchCount(CenterListSearchVO vo) {
		String sql = "select count(*) from center where instr(#1, ?) > 0";
		sql = sql.replace("#1", vo.getType());
		Object[] param = {vo.getKeyword()};
		
		return jdbcTemplate.queryForObject(sql, int.class, param);
	}

	@Override
	public int listCount(CenterListSearchVO vo) {
		String sql = "select count(*) from center";
		
		return jdbcTemplate.queryForObject(sql, int.class);		
	}

	@Override
	public List<CenterDto> selectList(CenterListSearchVO vo) {
		if(vo.isSearch()) {//검색이라면
			return search(vo);
		}
		else {
			return list(vo);
		}
	}



	@Override
	public List<CenterDto> list(CenterListSearchVO vo) {
		String sql = "select * from ("
				+ "select rownum rn, TMP.* from("
					+ "select * from center order by center_no desc"
				+ ")TMP"
			+ ") where rn between ? and ?";
		Object[] param = {vo.startRow(), vo.endRow()};
		
		return jdbcTemplate.query(sql, mapper, param);
	}



	@Override
	public List<CenterDto> search(CenterListSearchVO vo) {
		String sql = "select * from ("
				+ "select rownum rn, TMP.* from ("
					+ "select * from center where instr(#1,?) > 0 "
					+ "order by center_no desc"
				+ ")TMP"
			+ ") where rn between ? and ?";
		sql = sql.replace("#1", vo.getType());
		Object[] param = {vo.getKeyword(), vo.startRow(), vo.endRow()};
		
		return jdbcTemplate.query(sql, mapper, param);
	}



	@Override
	public List<CenterDto> selectListForMain() {
		CenterListSearchVO vo = new CenterListSearchVO();
		return list(vo);
	}



	@Override
	public boolean updateMoney(String customerId) {
		String sql = "update center set money_confirm='Y' where customer_id=?";
		return jdbcTemplate.update(sql, customerId) > 0;
	}

}
	
