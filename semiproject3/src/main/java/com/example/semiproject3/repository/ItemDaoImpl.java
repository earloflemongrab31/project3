package com.example.semiproject3.repository;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.example.semiproject3.entity.ItemDto;

@Repository
public class ItemDaoImpl implements ItemDao {

	@Override
	public int sequence() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void add(ItemDto itemDto) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<ItemDto> selectList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<ItemDto> selectList(String type, String keyword) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ItemDto selectOne(int itemNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean update(ItemDto itemDto) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean delete(int itemNo) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean like(int itemNo) {
		// TODO Auto-generated method stub
		return false;
	}

}
