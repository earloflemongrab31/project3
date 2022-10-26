package com.example.semiproject3.repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.apache.tomcat.util.net.TLSClientHelloExtractor.ExtractorResult;
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

	private RowMapper<ReviewDto> mapper=new RowMapper<ReviewDto>() {
		
		@Override
		public ReviewDto mapRow(ResultSet rs, int rowNum) throws SQLException {
			return ReviewDto.builder()
					.reviewNo(rs.getInt("review_no"))
					.customerId(rs.getString("customer_id"))
					.itemNo(rs.getInt("item_no"))
					.reviewContent(rs.getString("review_content"))
					.reviewStar(rs.getInt("review_star"))
					.reviewShipping(rs.getString("review_shipping"))
					.reviewPackaging(rs.getString("review_packaging"))
					.reviewDate(rs.getDate("review_date"))
					.build();
		}
	}; 
	
	
	private ResultSetExtractor<ReviewDto> extractor= new ResultSetExtractor<ReviewDto>() {
		
		@Override
		public ReviewDto extractData(ResultSet rs) throws SQLException, DataAccessException {
			if(rs.next()) {
				return ReviewDto.builder()
						.reviewNo(rs.getInt("review_no"))
						.customerId(rs.getString("customer_id"))
						.itemNo(rs.getInt("item_no"))
						.reviewContent(rs.getString("review_content"))
						.reviewStar(rs.getInt("review_star"))
						.reviewShipping(rs.getString("review_shipping"))
						.reviewPackaging(rs.getString("review_packaging"))
						.reviewDate(rs.getDate("review_date"))
						.build();
			}
			return null;
		}
	};
	
	
	@Override
	public void insert(ReviewDto reviewDto) {
		String sql="insert into review values(review_seq.nextval,?,?,?,?,?,?,sysdate)";
		Object[] param= {
				reviewDto.getCustomerId(),
				reviewDto.getItemNo(),
				reviewDto.getReviewContent(),
				reviewDto.getReviewStar(),
				reviewDto.getReviewShipping(),
				reviewDto.getReviewPackaging()
		};
		jdbcTemplate.update(sql,param);
	}
	
	@Override
	public List<ReviewDto> selectList(int itemNo) {
		String sql="select * from review where item_no=?";
		Object[] param= {itemNo};
		return jdbcTemplate.query(sql, mapper,param);
	}
	//하나의리뷰정보 
	@Override
	public ReviewDto selectOne(int reviewNo) {
		String sql="select * from review where review_no=?";
		Object[] param= {reviewNo};
		return jdbcTemplate.query(sql,extractor,param);
	}
}
