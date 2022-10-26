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

import com.example.semiproject3.entity.CardDto;
import com.example.semiproject3.entity.CartDto;
import com.example.semiproject3.entity.CompanyDto;
import com.example.semiproject3.vo.CardListSearchVO;
import com.example.semiproject3.vo.CompanyListSearchVO;

@Repository
public class CardDaoImpl implements CardDao{
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	private RowMapper<CardDto> mapper=new RowMapper<CardDto>() {
		@Override
		public CardDto mapRow(ResultSet rs, int rowNum) throws SQLException {
			return CardDto.builder()
					.cardNo(rs.getInt("card_no"))
					.cardName(rs.getString("card_name"))
					.cardType(rs.getString("card_type"))
					.cardSize(rs.getInt("card_size"))
					.cardTime(rs.getDate("card_time"))
					.build();
		}
	};
	
	private ResultSetExtractor<CardDto> extracter=new ResultSetExtractor<CardDto>() {
		
		@Override
		public CardDto extractData(ResultSet rs) throws SQLException, DataAccessException {
			if(rs.next()) {
				return CardDto.builder()
						.cardNo(rs.getInt("card_no"))
						.cardName(rs.getString("card_name"))
						.cardType(rs.getString("card_type"))
						.cardSize(rs.getInt("card_size"))
						.cardTime(rs.getDate("card_time"))
						.build();
			}else {
				return null;
			}
		}
	};
	
	@Override
	public int sequence() {
		String sql="select card_seq.nextval from dual ";
		return jdbcTemplate.queryForObject(sql, int.class);
	}
	
	
	@Override
	public void insert(CardDto cardDto) {
		String sql="insert into card values(?,?,?,?,sysdate)";
		Object[] param= {
				cardDto.getCardNo(),
				cardDto.getCardName(),
				cardDto.getCardType(),
				cardDto.getCardSize()
		};
		jdbcTemplate.update(sql,param);
	}
	
	@Override
	public boolean delete(int cardNo) {
		String sql="delete card where card_no=?";
		Object[] param= {cardNo};
		return jdbcTemplate.update(sql, param)>0;
	}
	
	@Override
	public List<CardDto> selectList() {
		String sql="select * from card";
		return jdbcTemplate.query(sql, mapper);
	}
	@Override
	public CardDto selectOne(int cardNo) {
		String sql="select * from card where card_no=?";
		Object[] param= {cardNo};
		return jdbcTemplate.query(sql, extracter,param);
	}


	@Override
	public List<CardDto> selectList(CardListSearchVO vo) {
		if(vo.isSearch()) { //검색
			return search(vo);
			}
			else {
				return list(vo);
			}
		}


	@Override
	public List<CardDto> list(CardListSearchVO vo) {
		String sql = "select * from ("
				+ "select rownum rn, TMP.* from("
					+ "select * from card order by card_no desc"
				+ ")TMP"
			+ ") where rn between ? and ?";
		Object[] param = {vo.startRow(), vo.endRow()};
		return jdbcTemplate.query(sql, mapper, param);
	}



	@Override
	public List<CardDto> search(CardListSearchVO vo) {
		String sql = "select * from ("
				+ "select rownum rn, TMP.* from ("
					+ "select * from card where instr(#1,?) > 0 "
					+ "order by card_no desc"
				+ ")TMP"
			+ ") where rn between ? and ?";
		sql = sql.replace("#1", vo.getType());
		Object[] param = {
				vo.getKeyword(), vo.startRow(), vo.endRow()
		};
		return jdbcTemplate.query(sql, mapper, param);
	}


	@Override
	public int count(CardListSearchVO vo) {
		if(vo.isSearch()) {//검색
			return searchCount(vo);
		}
		else {
			return listCount(vo);
		}
	}


	@Override
	public int searchCount(CardListSearchVO vo) {
		String sql = "select count(*) from company where instr(#1, ?) > 0";
		sql = sql.replace("#1", vo.getType());
		Object[] param = {vo.getKeyword()};
		return jdbcTemplate.queryForObject(sql, int.class, param);
	}


	@Override
	public int listCount(CardListSearchVO vo) {
		String sql = "select count(*) from company";
		return jdbcTemplate.queryForObject(sql, int.class);
	}

}
