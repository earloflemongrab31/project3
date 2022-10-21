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

import com.example.semiproject3.entity.ReviewDto;

@Repository
public class ReviewDaoImpl implements ReviewDao {

	@Autowired
	private JdbcTemplate jdbcTemplate;

	//시퀀스 번호 발행
	@Override
	public int sequence() {
		String sql = "select review_seq.nextval from dual";
		return jdbcTemplate.queryForObject(sql, int.class);
	}

	//등록
	@Override
	public void insert(ReviewDto reviewDto) {
		String sql = "insert into review(review_no, item_no, review_star, customer_id, review_name, review_content, review_date) values(review_seq.nextval, ?, ?, ?, ?, ?, ?, sysdate)";
		Object[] param = {
				reviewDto.getReviewNo(), reviewDto.getItemNo(), reviewDto.getReviewStar(),
				reviewDto.getCustomerId(), reviewDto.getReviewName(), reviewDto.getReviewContent(),
				reviewDto.getReviewDate()
		};
		jdbcTemplate.update(sql, param);
	}

	
	//로우맵퍼
	private RowMapper <ReviewDto> mapper = new RowMapper<ReviewDto>() {

		@Override
		public ReviewDto mapRow(ResultSet rs, int rowNum) throws SQLException {
			ReviewDto reviewDto = new ReviewDto();
			reviewDto.setReviewNo(rs.getInt("review_no"));
			reviewDto.setItemNo(rs.getInt("item_no"));
			reviewDto.setReviewStar(rs.getInt("review_star"));
			reviewDto.setCustomerId(rs.getString("customer_id"));
			reviewDto.setReviewName(rs.getString("review_name"));
			reviewDto.setReviewContent(rs.getString("review_content"));
			reviewDto.setReviewDate(rs.getDate("review_date"));
			return reviewDto;
		}
	};
	
	//목록
	@Override
	public List<ReviewDto> selectList() {
		String sql = "select * from select order by review_no desc";
		return jdbcTemplate.query(sql, mapper);
	}

	//검색
	@Override
	public List<ReviewDto> selectList(String type, String keyword) {
		String sql = "select * from customer where instr(#1, ?) > 0 order by review_no desc";
		sql = sql.replace("#1", type);
		Object[] param = {keyword};
		return jdbcTemplate.query(sql, mapper, param);
	}

	//리절트셋
	private ResultSetExtractor<ReviewDto> extractor = new ResultSetExtractor<ReviewDto>() {

		@Override
		public ReviewDto extractData(ResultSet rs) throws SQLException, DataAccessException {
			if(rs.next()) {
				ReviewDto reviewDto = new ReviewDto();
				reviewDto.setReviewNo(rs.getInt("review_no"));
				reviewDto.setItemNo(rs.getInt("item_no"));
				reviewDto.setReviewStar(rs.getInt("review_star"));
				reviewDto.setCustomerId(rs.getString("customer_id"));
				reviewDto.setReviewName(rs.getString("review_name"));
				reviewDto.setReviewContent(rs.getString("review_content"));
				reviewDto.setReviewDate(rs.getDate("review_date"));
				return reviewDto;	
				}
				else {
				return null;
			}
		}
	};
	
	//정보
	@Override
	public ReviewDto selectOne(int reviewNo) {
		String sql = "select * from review where review_no=?";
		Object[] param = {reviewNo};
		return jdbcTemplate.query(sql, extractor, param);
	}

	//수정
	@Override
	public boolean update(ReviewDto reviewDto) {
		String sql = "update review set review_star=?, review_name=?, review_content=? where review_no=?";
		Object[] param = {
				reviewDto.getReviewStar(), reviewDto.getReviewName(),
				reviewDto.getReviewContent(), reviewDto.getReviewNo()
		};
		return jdbcTemplate.update(sql, param) > 0;
	}

	//삭제
	@Override
	public boolean delete(int reviewNo) {
		String sql = "delete review where review_no=?";
		Object[] param = {reviewNo};
		return jdbcTemplate.update(sql, param) > 0;
	}
	
	
}
