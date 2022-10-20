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

import com.example.semiproject3.entity.InvenDto;

@Repository
public class InvenDaoImpl implements InvenDao{

	@Autowired 
	private JdbcTemplate jdbcTemplate;
	
	
	//로우뭽퍼!
	private RowMapper <InvenDto> mapper = new RowMapper<InvenDto>() {

		@Override
		public InvenDto mapRow(ResultSet rs, int rowNum) throws SQLException {
			InvenDto invenDto = new InvenDto();
			invenDto.setItemNo(rs.getInt("item_no"));
			invenDto.setItemCnt(rs.getInt("item_cnt"));
			invenDto.setItemIn(rs.getDate("item_in"));
			invenDto.setItemOut(rs.getDate("item_out"));
			invenDto.setItemSize(rs.getString("item_size"));
			invenDto.setItemColor(rs.getString("item_color"));
			return invenDto;
		}
	};
	
	//리절트쉣!
	private ResultSetExtractor <InvenDto> extractor = new ResultSetExtractor<InvenDto>() {

		@Override
		public InvenDto extractData(ResultSet rs) throws SQLException, DataAccessException {
			if(rs.next()) {
				InvenDto invenDto = new InvenDto();
				invenDto.setItemNo(rs.getInt("item_no"));
				invenDto.setItemCnt(rs.getInt("item_cnt"));
				invenDto.setItemIn(rs.getDate("item_in"));
				invenDto.setItemOut(rs.getDate("item_out"));
				invenDto.setItemSize(rs.getString("item_size"));
				invenDto.setItemColor(rs.getString("item_color"));
				return invenDto;
			}
			else {
				return null;	
			}
		}
	};
	
	//등록
	@Override
	public void insert(InvenDto invenDto) {
		String sql = "insert into inven (item_no, item_cnt, item_in, item_out, item_size, item_color) values(?, 0, sysdate, sysdate, ?, ?)";
		Object[] param = {
				invenDto.getItemNo(), invenDto.getItemCnt(),
				invenDto.getItemIn(), invenDto.getItemOut(),
				invenDto.getItemSize(), invenDto.getItemColor()
		};
		jdbcTemplate.update(sql, param);
	}

	//목록
	@Override
	public List<InvenDto> selectList() {
		String sql = "select * from inven order by item_no desc";
		return jdbcTemplate.query(sql, mapper);
	}

	//목록(타입,키워드 포함)
	@Override
	public List<InvenDto> selectList(String type, String keyword) {
		String sql = "select * from inven where instr(#1, ?) > 0 order by item_no desc";
		sql = sql.replace("#1", type);
		Object[] param = {keyword};
		return jdbcTemplate.query(sql, mapper, param);
	}

	//재고 정보(아이템번호)
	@Override
	public InvenDto selectOne(int itemNo) {
		String sql = "select * from inven where item_no=?";
		Object[] param = {itemNo};
		return jdbcTemplate.query(sql, extractor, param);
	}

	//수정
	@Override
	public boolean update(InvenDto invenDto) {
		String sql = "update inven set item_cnt=?, item_in=?, item_out=?,item_size=?, item_color=? where item_no=?";
		Object[] param = {
				invenDto.getItemCnt(), invenDto.getItemIn(),
				invenDto.getItemOut(), invenDto.getItemSize(),
				invenDto.getItemColor(), invenDto.getItemNo()
		};
		return jdbcTemplate.update(sql, param) > 0; 
	}

	//삭제
	@Override
	public boolean delete(int itemNo) {
		String sql = "delete inven where item_no=?";
		Object[] param = {itemNo};
		return jdbcTemplate.update(sql, param) > 0;
	}
}
