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

import com.example.semiproject3.entity.AddressDto;

@Repository
public class AddressDaoImpl implements AddressDao{

	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	//번호 생성(시퀀스)
	@Override
	public int sequence() {
		String sql = "select address_seq.nextval from dual";
		return jdbcTemplate.queryForObject(sql, int.class);
	}

	//등록
	@Override
	public List<AddressDto> insert(AddressDto addressDto) {
		String sql = "insert into address("
				+ "address_no,"
				+ "customer_id,"
				+ "address_name,"
				+ "address_post,"
				+ "address_host,"
				+ "address_detail_host,"
				+ "address_basic)"
				+ "values(?, ?, ?, ?, ?, ?,'Y')";
		Object[] param = {
				addressDto.getAddressNo(),
				addressDto.getCustomerId(),
				addressDto.getAddressName(), addressDto.getAddressPost(),
				addressDto.getAddressHost(), addressDto.getAddressDetailHost()
				
				
		};
		jdbcTemplate.update(sql, param);
		return null;
	}

	//RowMapper
	
	private RowMapper <AddressDto> mapper = new RowMapper<AddressDto>() {

		@Override
		public AddressDto mapRow(ResultSet rs, int rowNum) throws SQLException {
			AddressDto addressDto = new AddressDto();
			addressDto.setAddressNo(rs.getInt("address_no"));
			addressDto.setCustomerId(rs.getString("customer_id"));
			addressDto.setAddressName(rs.getString("address_name"));
			addressDto.setAddressPost(rs.getString("address_post"));
			addressDto.setAddressHost(rs.getString("address_host"));
			addressDto.setAddressDetailHost(rs.getString("address_detail_host"));
			addressDto.setAddressBasic(rs.getString("address_basic"));
			return addressDto;
		}
	};
	
	//ResultSetExtractor
	
	private ResultSetExtractor <AddressDto> extractor = new ResultSetExtractor<AddressDto>() {

		@Override
		public AddressDto extractData(ResultSet rs) throws SQLException, DataAccessException {
			if(rs.next()) {
				AddressDto addressDto = new AddressDto();
				addressDto.setAddressNo(rs.getInt("address_no"));
				addressDto.setCustomerId(rs.getString("customer_id"));
				addressDto.setAddressName(rs.getString("address_name"));
				addressDto.setAddressPost(rs.getString("address_post"));
				addressDto.setAddressHost(rs.getString("address_host"));
				addressDto.setAddressDetailHost(rs.getString("address_detail_host"));
				addressDto.setAddressBasic(rs.getString("address_basic"));
				return addressDto;
			}
			else {
				return null;	
			}
		}
	};
	
	//주소 목록
	@Override
	public List<AddressDto> selectList() {
		String sql = "select * from address order by address_no asc";
		return jdbcTemplate.query(sql, mapper);
	}

	//주소 검색
	@Override
	public List<AddressDto> selectList(String type, String keyword) {
		String sql = "select * from address where instr(#1, ?) > 0 order by address_no desc";
		sql = sql.replace("#1", type);
		Object[] param = {keyword};
		return jdbcTemplate.query(sql, mapper, param);
	}

	//주소 
	@Override
	public AddressDto selectOne(int addressNo) {
		String sql = "select * from address where address_no=?";
		Object[] param = {addressNo};
		return jdbcTemplate.query(sql, extractor, param);
	}

	@Override
	public boolean update(AddressDto addressDto) {
		String sql = "update address set "
				+ "address_name=?,"
				+ "address_post=?,"
				+ "address_host=?,"
				+ "address_detail_host=?"
				+ "where address_no = ?";
		Object[] param = {
				addressDto.getAddressName(),
				addressDto.getAddressPost(), addressDto.getAddressHost(),
				addressDto.getAddressDetailHost(), 
				addressDto.getAddressNo()
		};
		return jdbcTemplate.update(sql, param) > 0;
	}

	//주소 삭제
	@Override
	public boolean delete(int addressNo) {
		String sql = "delete address where address_no = ?";
		Object[] param = {addressNo};
		return jdbcTemplate.update(sql, param ) > 0;
	}
	
	// 기본배송지 업데이트
	@Override
	public boolean addBasic(int addressNo, String addBasic) {
		String sql = "update address set "
				+ "address_basic=? where address_no = ?";
		Object[] param = {
				addBasic, 
				addressNo
		};
		return jdbcTemplate.update(sql, param) > 0;
	}
	
	@Override
	public boolean addBasicUpdate(int addressNo) {
		String sql = "update address set "
				+ "address_basic= 'N' where address_no != ?";
		Object[] param = {
				addressNo
		};
		return jdbcTemplate.update(sql, param) > 0;
	}

		//처음 주소 등록할때 
	@Override
	public boolean basicUpdate(int addressNo) {
//		System.out.println("이값이 뭐죠? :" +addressNo);
		String sql = "update address set "
				+ "address_basic='N'"
				+ "where address_no != ?";
		Object[] param = {
				addressNo
		};
		return jdbcTemplate.update(sql, param) > 0;
	}

	@Override
	public List<AddressDto> selectOneBasic() {
			String sql = "select * from address where address_basic = 'Y'";
			return jdbcTemplate.query(sql, mapper);
		}

	@Override
	public List<AddressDto> selectAddressList(String customerId, int begin, int end) {
		String sql = "select * from ("
				+ "select rownum rn, TMP.* from ("
					+ "select * from address "
					+ "where customer_id = ? "
					+ "order by address_no desc"
				+ ")TMP"
			+ ") where rn between ? and ?";
Object[] param = {customerId, begin, end};
return jdbcTemplate.query(sql, mapper, param);
}

	@Override
	public AddressDto selectOne(String loginId) {
		String sql = "select * from address where customer_id=?";
		Object[] param = {loginId};
		return jdbcTemplate.query(sql, extractor, param);
	}
}
