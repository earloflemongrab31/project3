package com.example.semiproject3.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.semiproject3.constant.SessionConstant;
import com.example.semiproject3.entity.AddressDto;
import com.example.semiproject3.entity.CustomerDto;
import com.example.semiproject3.entity.ItemDto;
import com.example.semiproject3.entity.OrdersDto;
import com.example.semiproject3.repository.AddressDao;
import com.example.semiproject3.repository.CartDao;
import com.example.semiproject3.repository.CustomerDao;
import com.example.semiproject3.repository.ItemDao;
import com.example.semiproject3.repository.OrdersDao;

@Controller
@RequestMapping("/orders")
public class OrdersController {

	@Autowired
	private OrdersDao ordersDao;
		
	@Autowired
	private AddressDao addressDao;
	
	@Autowired
	private CustomerDao customerDao;
	
	@Autowired
	private ItemDao itemDao;
	
	@Autowired
	private CartDao cartDao; 
		
	//등록
	@GetMapping("/insert")
	public String insert(
			HttpSession session,
			@RequestParam int itemNo){
			String loginId = (String) session.getAttribute(SessionConstant.ID);
			
			ItemDto itemDto = itemDao.selectOne(itemNo);
			CustomerDto customerDto = customerDao.selectOne(loginId);
			AddressDto addressDto = addressDao.selectOne(loginId);

		int ordersNo = ordersDao.sequnece();
		ordersDao.insert(OrdersDto.builder()
				.ordersNo(ordersNo)
				.customerId(loginId)
				.itemNo(itemNo)
				.addressNo(addressDto.getAddressNo())
				.customerName(customerDto.getCustomerName())
				.customerNick(customerDto.getCustomerNick())
				.customerPhone(customerDto.getCustomerPhone())
				.customerPoint(customerDto.getCustomerPoint())
				.itemName(itemDto.getItemName())
				.itemColor(itemDto.getItemColor())
				.itemSize(itemDto.getItemSize())
				//.itemCnt(1)
				.itemFee(3000)
				.addressName(addressDto.getAddressName())
				.customerPost(addressDto.getAddressPost())
				.customerHost(addressDto.getAddressHost())
				.customerDetailHost(addressDto.getAddressDetailHost())
				.customerMoney(customerDto.getCustomerMoney())
				.build());
		return "orders/insert";
	}
	
	@GetMapping("/list")
	public String list(Model model, 
					@RequestParam(required = false) String type,
					@RequestParam(required = false) String keyword) {
		boolean isSearch = type != null && keyword != null;
		if(isSearch) { // 검색
			model.addAttribute("list", ordersDao.selectList(type, keyword));
		}
		else { //목록
			model.addAttribute("list", ordersDao.selectList());
		}
		return "orders/list";
	}
}