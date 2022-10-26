package com.example.semiproject3.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
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
			@RequestParam int itemNo
			){
			String loginId = (String) session.getAttribute(SessionConstant.ID);
						
			ItemDto itemDto = itemDao.selectOne(itemNo);
			CustomerDto customerDto = customerDao.selectOne(loginId);
			AddressDto addressDto = addressDao.selectOne(loginId);

			int ordersNo = ordersDao.sequnece();
			
			ordersDao.insert(OrdersDto.builder()
					.ordersNo(ordersNo)
					.customerId(loginId)
					.itemNo(itemDto.getItemNo())
					.addressNo(addressDto.getAddressNo())
					.customerName(customerDto.getCustomerName())
					.customerNick(customerDto.getCustomerNick())
					.customerPhone(customerDto.getCustomerPhone())
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
		
		
//		ordersDao.insert(OrdersDto.builder()
//				.ordersNo(ordersNo)
//				.customerId(loginId)
//				.itemNo(itemNo)
//				.addressNo(addressDto.getAddressNo())
//				.customerName(customerDto.getCustomerName())
//				.customerNick(customerDto.getCustomerNick())
//				.customerPhone(customerDto.getCustomerPhone())
//				.customerPoint(customerDto.getCustomerPoint())
//				.itemName(itemDto.getItemName())
//				.itemColor(itemDto.getItemColor())
//				.itemSize(itemDto.getItemSize())
//				//.itemCnt(1)
//				.itemFee(3000)
//				.addressName(addressDto.getAddressName())
//				.customerPost(addressDto.getAddressPost())
//				.customerHost(addressDto.getAddressHost())
//				.customerDetailHost(addressDto.getAddressDetailHost())
//				.customerMoney(customerDto.getCustomerMoney())
//				.build());
		return "orders/insert";
	}
	
	//목록
	@GetMapping("/list")
	public String list(Model model, HttpSession session) {
		
		String loginId = (String)session.getAttribute(SessionConstant.ID);
		model.addAttribute("orders",ordersDao.selectList(loginId));
		model.addAttribute("oredresCount",ordersDao.selectOrders(loginId));
		return "orders/list";
	}
	
	//삭제
	@GetMapping("/delete")
	public String delete(@RequestParam int itemNo,HttpSession session) {
	
	String loginId = (String) session.getAttribute(SessionConstant.ID);
	OrdersDto ordersDto = new OrdersDto();
	ordersDto.setCustomerId(loginId);
	ordersDto.setItemNo(itemNo);
	ordersDao.delete(ordersDto);
		return "redirect:orders/list";
	}
	
	//
//	@GetMapping("/address")
//	public String address(@ModelAttribute AddressDto addressDto, HttpSession session) {
//	String loginId = (String) session.getAttribute(SessionConstant.ID);
//	OrdersDto ordersDto = new OrdersDto();
//	ordersDto.setCustomerId(loginId);
//	ordersDto.setAddressNo(0);
//	
//		return "orders/address";
	

}