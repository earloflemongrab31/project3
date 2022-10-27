package com.example.semiproject3.repository;

import java.util.List;

import com.example.semiproject3.entity.OrdersItemDto;

public interface OrdersItemDao {
	void insert(OrdersItemDto ordersItemDto);

	List<OrdersItemDto> selectOrdersItemList(String customerId);
}
