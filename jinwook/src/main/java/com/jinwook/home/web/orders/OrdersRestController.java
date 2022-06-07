package com.jinwook.home.web.orders;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.jinwook.home.service.orders.OrdersService;
import com.jinwook.home.service.user.UserService;

@RestController
@RequestMapping("/orders/*")
public class OrdersRestController {
	
	///Field
	@Autowired
	@Qualifier("ordersServiceImpl")
	private OrdersService ordersService;
	
}