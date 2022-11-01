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
import com.example.semiproject3.vo.ReviewListSearchVO;

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
               .imageNo(rs.getInt("image_no"))
               .reviewBlind(rs.getString("review_blind")!=null)
               .reviewCnt(rs.getInt("review_cnt"))
               .build();
      }
   }; 
   private RowMapper<ReviewDto> mapper1=new RowMapper<ReviewDto>() {
	      
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
	               .reviewBlind(rs.getString("review_blind")!=null)
	               .reviewCnt(rs.getInt("review_cnt"))
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
                      .imageNo(rs.getInt("image_no"))
                      .reviewBlind(rs.getString("review_blind")!=null)
                      .reviewCnt(rs.getInt("review_cnt"))
                      .build();
         }
         return null;
      }
   };
   
   
   private ResultSetExtractor<ReviewDto> extractor2= new ResultSetExtractor<ReviewDto>() {
	      
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
	                      .reviewBlind(rs.getString("review_blind")!=null)
	                      .reviewCnt(rs.getInt("review_cnt"))
	                      .build();
	         }
	         return null;
	      }
	   };
   
   @Override
   public void insert(ReviewDto reviewDto) {
      String sql="insert into review values(?,?,?,?,?,?,?,sysdate,null,0)";
      Object[] param= {
            reviewDto.getReviewNo(),
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
  
   //하나의리뷰정보+이미지 
   @Override
   public ReviewDto selectOne(int reviewNo) {
      //String sql="select * from review where review_no=?";
	  String sql="select * from review_real where item_no=?";
      Object[] param= {reviewNo};
      return jdbcTemplate.query(sql,extractor,param);
   }
   //하나의리뷰정보
   @Override
   public ReviewDto selectOne2(int reviewNo) {
      String sql="select * from review where review_no=?";
	  //String sql="select * from review_real where item_no=?";
      Object[] param= {reviewNo};
      return jdbcTemplate.query(sql,extractor2,param);
   }
   //시퀀스번호 생성
   @Override
   public int sequence() {
      String sql = "select orders_seq.nextval from dual";
      return jdbcTemplate.queryForObject(sql, int.class);      
      
   }
   //사진
   @Override
   public void connectAttachment(int reviewNo, int imageNo) {
      String sql="insert into review_image(review_no, image_no) values(?,?)";
      Object[] param= {reviewNo,imageNo};
      jdbcTemplate.update(sql,param); 
      
   }
   
   //아이템 번호 첨부 뷰 (review_real)
   @Override
   public List<ReviewDto> selectList2(int itemNo) {
      String sql="select * from review_real where item_no=? order by review_no desc";
      Object[] param= {itemNo};
      return jdbcTemplate.query(sql, mapper,param);
   }
   
//블라인드처리 
@Override
	public boolean updateBlind(int reviewNo, boolean b) {
		String sql=" update review set review_blind=? where review_no=?";
		String reviewBlind= b?"Y":null;
		Object[] param= {reviewBlind,reviewNo};
		return jdbcTemplate.update(sql,param)>0;
	}

//리뷰 눌렀을떄 하나 플러스 
@Override
	public void plus(int reviewNo) {
		String sql="update review set review_cnt=review_cnt+1 where review_no=?";
		Object[] param= {reviewNo};
		jdbcTemplate.update(sql,param);
	}

@Override
	public void minus(int reviewNo) {
	String sql="update review set review_cnt=review_cnt-1 where review_no=?";
	Object[] param= {reviewNo};
	jdbcTemplate.update(sql,param);
		
	}

//삭제
@Override
	public boolean delete(int reviewNo) {
		String sql="delete review where review_no=?";
		Object[] param= {reviewNo};
		return jdbcTemplate.update(sql,param)>0;
	}

@Override
public List<ReviewDto> selectList(ReviewListSearchVO vo, String loginId) {
	if(vo.isSearch()) {
		return search(vo,loginId);
	}
	else {
		return list(vo);
	}
}

@Override
public List<ReviewDto> list(ReviewListSearchVO vo) {
	String sql = "select * from (select rownum rn, TMP.* from(select * from review order by review_no desc)TMP) where rn between ? and ?";
	Object[] param = {vo.startRow(), vo.endRow()};
	return jdbcTemplate.query(sql, mapper1, param);
}

@Override
public List<ReviewDto> search(ReviewListSearchVO vo, String loginId) {
	String sql = "select * from ("
			+ "select rownum rn, TMP.* from ("
				+ "select * from review where instr(#1,?) > 0 "
				+ "order by review_no desc"
			+ ")TMP"
		+ ") where rn between ? and ?";
	sql = sql.replace("#1", vo.getType());
	Object[] param = {
			vo.getKeyword(), loginId, vo.startRow(), vo.endRow()
};
return jdbcTemplate.query(sql, mapper1, param);
}

@Override
public int count(ReviewListSearchVO vo) {
	if(vo.isSearch()) {
		return searchCount(vo);
	}
	else {
		return listCount(vo);
	}
}

@Override
public int searchCount(ReviewListSearchVO vo) {
	String sql = "select count(*) from review where instr(#1, ?) > 0";
	sql = sql.replace("#1", vo.getType());
	Object[] param = {vo.getKeyword()};
	return jdbcTemplate.queryForObject(sql, int.class, param);
}

@Override
public int listCount(ReviewListSearchVO vo) {
	String sql = "select count(*) from review";
	return jdbcTemplate.queryForObject(sql, int.class);
	}

@Override
public List<ReviewDto> customerSelectList(String loginId, ReviewListSearchVO vo) {
	if(vo.isSearch()) {
		return search(vo,loginId);
	}
	else {
		return list(vo);
	}
	
	}
}

