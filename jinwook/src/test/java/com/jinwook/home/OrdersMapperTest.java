package com.jinwook.home;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Map;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.util.CollectionUtils;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.datatype.jsr310.JavaTimeModule;
import com.jinwook.home.mapper.OrdersMapper;
import com.jinwook.home.service.domain.Cart;
import com.jinwook.home.service.domain.Coupon;
import com.jinwook.home.service.domain.Jpay;
import com.jinwook.home.service.domain.Orders;
import com.jinwook.home.service.domain.Product;
import com.jinwook.home.service.domain.Store;
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
		
		Store store = new Store();
		store.setStoreNo(10000);
		
		
		Orders orders = new Orders();
		orders.setPlusTime(90);
		orders.setUser(user);
		orders.setStore(store);
		orders.setBuyerName("강진욱");
		orders.setBuyerPhone("010-1234-9876");
		orders.setPickupTime(LocalDateTime.now().plusMinutes(orders.getPlusTime()));
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
		orders.setOrderNo(10006);
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
	
	//@Test
	public void testSelectListOrders() {
		int ordersTotalCount = ordersMapper.getOrdersTotalCount();
		if(ordersTotalCount > 0) {
			List<Orders> ordersList = ordersMapper.getOrdersList("test01");
			System.out.println(ordersList.get(1)); 
			System.out.println(ordersTotalCount);
			if(CollectionUtils.isEmpty(ordersList) == false) {
				System.out.println("==2");
				for(Orders orders : ordersList) {
					
					System.out.println("=========================");
					System.out.println(orders.getUser().getUserId());
					System.out.println(orders.getOrderNo());
					System.out.println(orders.getOrderStatus());
					System.out.println(orders.getPickupTime());
					System.out.println(orders.getOrderDate());
					System.out.println(orders.getOrderPrice());
					System.out.println(orders.getProduct().getProdName());
					System.out.println(orders.getProduct().getProdImg());
					System.out.println("=========================");
				}
			}
		}
	}
	
	//@Test
	public void testgetOrders() {
		int ordersTotalCount = ordersMapper.getOrdersTotalCount();
		if(ordersTotalCount > 0) {
			List<Orders> ordersGet = ordersMapper.getOrders(10007);
			if(CollectionUtils.isEmpty(ordersGet) == false) {
				System.out.println("==2");
				for(Orders orders : ordersGet) {
				
					System.out.println("=========================");
					System.out.println(orders.getUser().getUserId());
					System.out.println(orders.getProduct().getProdName());
					System.out.println(orders.getProdCount());
					System.out.println(orders.getProduct().getPrice());
					System.out.println(orders.getProduct().getProdInfo());
					System.out.println(orders.getProduct().getProdImg());
					System.out.println(orders.getStore().getStoreName());
					System.out.println(orders.getOrderDate());
					System.out.println(orders.getOrderPrice());
					System.out.println(orders.getBuyerName());
					System.out.println(orders.getBuyerPhone());
					System.out.println(orders.getOrderReq());
					System.out.println(orders.getPickupTime());
					System.out.println(orders.getOrderStatus());
					System.out.println("=========================");
				}
			}
		}
	}
	
	//@Test
	public void testaddOrdersCart() {
		
		Product product = new Product();
		product.setProdNo(10003);
		
		Cart cart = new Cart();
		cart.setUserId("test01");
		cart.setProduct(product);
//		cart.setOrderNo(null);// 
		cart.setProdCount(2);
		cart.setStoreName("진욱이네");
		cart.setCartStatus(false);
		
		int result = ordersMapper.addOrdersCart(cart);
		System.out.println("결과는"+result+"입니다.");
	}
	
	//@Test
	public void testupdateOrdersCart() {
		Cart cart= new Cart();
		cart.setUserId("test01");
		cart.setCartNo(10005);
		cart.setProdCount(4);
		int result = ordersMapper.updateOrdersCart(cart);
		System.out.println("결과는"+result+"입니다.");
	}
	
	//@Test
	public void testdeleteOrderCartAfter() {
		Orders orders = new Orders();
		orders.setOrderNo(10003);
		
		Cart cart = new Cart();
		cart.setUserId("test01");
		cart.setCartNo(10006);
		cart.setCartStatus(true);
		cart.setOrders(orders);
		int result = ordersMapper.deleteOrderCartAfter(cart);
		System.out.println("결과는"+result+"입니다.");
	}
	
	//@Test
		public void testdeleteOrdersCart() {
			Cart cart = new Cart();
			cart.setCartNo(10011);
			int result = ordersMapper.deleteOrdersCart(cart);
		    System.out.println("결과는" + result + "입니다.");
		}
		
	//@Test
		public void testdeleteOrdersCartAll() {
			Cart cart = new Cart();
			cart.setCartStatus(false);
			int result = ordersMapper.deleteOrdersCartAll(cart);
		    System.out.println("결과는" + result + "입니다.");
		}
		
	//@Test
	public void testgetOrdersCartList() {
		
	int getCartTotalCount = ordersMapper.getCartTotalCount();
	if(getCartTotalCount > 0) {
		Cart carts = new Cart();
		carts.setUserId("test01");
		carts.setCartStatus(false);
		carts.setStoreName("진욱이네");
		List<Cart> cartList = ordersMapper.getOrdersCartList(carts);
		if(CollectionUtils.isEmpty(cartList) == false) {
			for(Cart cart : cartList) {

				System.out.println("=========================");
				System.out.println(cart.getStoreName());
				System.out.println(cart.getProduct().getProdImg());
				System.out.println(cart.getProduct().getProdName());
				System.out.println(cart.getProduct().getProdInfo());
				System.out.println(cart.getProdCount());
				System.out.println(cart.getProduct().getPrice());
				System.out.println(cart.getOrders().getOrderPrice());
				System.out.println("=========================");
				}
			}
		}
	}
	
	//@Test
	public void testaddJpayPassword() {
		User user = new User();
		user.setUserId("test01");
		user.setJpPassword("333333");
		
		int result = ordersMapper.addOrdersJpayPassword(user);
		System.out.println("결과는"+result+"입니다.");
	}
	
	//@Test
	public void testupdateOrdersJpayPassword() {
		User user = new User();
		user.setUserId("test01");
		user.setJpPassword("012345");
		
		int result = ordersMapper.updateOrdersJpayPassword(user);
		System.out.println("결과는"+result+"입니다.");
	}
	
	@Test
	public void addOrdersjBCharge() {
		Jpay jpay = new Jpay();
		jpay.setJpStatus(1);
		jpay.setUserId("test01");
		jpay.setJpNo(10000);
		jpay.setOrderNo(10047);
		
		int result = ordersMapper.addOrdersjBCharge(jpay);
	      System.out.println("결과는 " + result + "입니다.");

	}

	
	
	//@Test
	public void testaddOrdersJpayCharge() {
		Jpay jpay = new Jpay();
		jpay.setUserId("test01");
		jpay.setOrderNo(0);
		jpay.setJpStatus(1);
		jpay.setFinalPrice(0);
		jpay.setChargePay(1000);
		
		int result = ordersMapper.addOrdersJpayCharge(jpay);
		System.out.println("결과는"+result+"입니다.");
	}
	
	

}
