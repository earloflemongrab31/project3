package com.example.semiproject3.repository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.example.semiproject3.entity.ReviewLikeDto;

@Repository
public class ReviewLikeDaoImpl implements ReviewLikeDao{
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	//입력
	@Override
	public void insert(ReviewLikeDto dto) {
		String sql="insert into review_like values(?,?,sysdate)";
		Object[] param= {
				dto.getCustomerId(),
				dto.getReviewNo(),
		};
		
		jdbcTemplate.update(sql,param);
		
	}
	//삭제
	@Override
	public void delete(ReviewLikeDto dto) {
		String sql="delete review_like where customer_id=? and review_no=?";
		Object[] param= {
				dto.getCustomerId(),
				dto.getReviewNo()
		};
		
		jdbcTemplate.update(sql,param);
	}
	
	//좋아요갯수 체크
	@Override
	public boolean check(ReviewLikeDto dto) {
		String sql="select count(*) from review_like where customer_id=? and review_no=?";
		Object[] param= {
				dto.getCustomerId(),
				dto.getReviewNo()
		};
		int count=jdbcTemplate.queryForObject(sql, int.class,param);
		
		return count==1;
	}
	
	//리뷰에 달린 좋아요 갯수
	@Override
	public int count(int reviewNo) {
		String sql="select count(*) from review_like where review_no=?";
		Object[] param= {reviewNo};
		return jdbcTemplate.queryForObject(sql, int.class,param);
	}
}
