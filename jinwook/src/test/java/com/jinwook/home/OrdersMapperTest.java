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
import com.jinwook.home.service.domain.Orders;
import com.jinwook.home.service.domain.Product;
import com.jinwook.home.service.domain.Store;
import com.jinwook.home.service.domain.User;

@SpringBootTest
public class OrdersMapperTest {
	
	@Autowired
	private OrdersMapper ordersMapper;
	
	@Test
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
//					System.out.println(orders.getOrderNo());
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
		public void testdeleteOrdersCart() {
			Orders orders = new Orders();
			orders.setOrderNo(10000);
			
			Cart cart= new Cart();
			cart.setUserId("test01");
			cart.setOrders(orders);
			cart.setCartStatus(true);
			int result = ordersMapper.deleteOrdersCart(cart);
			System.out.println("결과는"+result+"입니다.");
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
	
//	@Test
//	public 
}
