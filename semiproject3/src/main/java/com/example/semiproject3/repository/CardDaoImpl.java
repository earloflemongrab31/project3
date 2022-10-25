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
	

}
