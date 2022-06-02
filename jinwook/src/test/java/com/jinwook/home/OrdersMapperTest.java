package com.jinwook.home;

import java.time.LocalDateTime;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.jinwook.home.mapper.OrdersMapper;
import com.jinwook.home.service.domain.Coupon;
import com.jinwook.home.service.domain.Orders;
import com.jinwook.home.service.domain.Product;
import com.jinwook.home.service.domain.User;

@SpringBootTest
public class OrdersMapperTest {
	
	@Autowired
	private OrdersMapper ordersMapper;
	
	//@Test
	public void testOfaddOrders() {
		Product product = new Product();
		product.setProdNo(10000);
		product.setPrice(500);
		
		User user = new User();
		user.setUserId("test01");
		user.setGrade("일반회원");
		
		Coupon coupon = new Coupon();
		coupon.setCouponNo(10000);
		coupon.setCouponType("0");
		coupon.setCouponDc(30);
		
		Orders orders = new Orders();
		orders.setUser(user);
		orders.setStoreNo(10000);
		orders.setBuyerName("강진욱");
		orders.setBuyerPhone("010-1234-9876");
		orders.setPickupTime(LocalDateTime.now());
		orders.setOrderReq(null);
		orders.setProdCount(3);
		orders.setOrderStatus("0");
		orders.setProduct(product);
		orders.setOrderPrice(10000);
		orders.setFinalPrice(5000);
		orders.setCoupon(coupon);
			
		int result = ordersMapper.addOrders(orders);
		System.out.println("결과는"+result+"입니다.");
	}
	
	//@Test
	public void testOfupdateOrders() {
		Orders orders = new Orders();
		orders.setOrderNo(10003);
		orders.setOrderStatus("1");
		int result = ordersMapper.updateOrders(orders);
		System.out.println("결과는"+result+"입니다.");
	}
	
	//@Test
	public void testOfdeleteOrders() {	
		Orders orders = new Orders();
		orders.setOrderNo(10005);
		int result = ordersMapper.deleteOrders(orders);
	    System.out.println("결과는" + result + "입니다.");
	     
	}
	
	@Test
	public void testSelectListOrders() {
		Orders orders = new Orders();
		orders.getUser().getUserId();
//		Map<String> map = orders
		
//		List<Object> list = (List<Object>)map.get("list")
	}
	
}
