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
               .imageNo(rs.getInt("image_no"))
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
      String sql="insert into review values(?,?,?,?,?,?,?,sysdate)";
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
   //하나의리뷰정보 
   @Override
   public ReviewDto selectOne(int reviewNo) {
      String sql="select * from review where review_no=?";
      Object[] param= {reviewNo};
      return jdbcTemplate.query(sql,extractor,param);
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
      String sql="select * from  review_real where item_no=?";
      Object[] param= {itemNo};
      return jdbcTemplate.query(sql, mapper,param);
   }
}