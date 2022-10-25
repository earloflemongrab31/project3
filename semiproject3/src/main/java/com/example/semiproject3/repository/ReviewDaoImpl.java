package com.example.semiproject3.repository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
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
}
