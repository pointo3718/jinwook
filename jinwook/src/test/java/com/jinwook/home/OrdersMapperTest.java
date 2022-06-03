package com.jinwook.home;

import java.time.LocalDateTime;
import java.util.List;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.util.CollectionUtils;

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
		orders.setUser(user);
		orders.setStore(store);
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
		User user = new User();
//		user.setUserId("test01");
		
//		Store store = new Store();
//		store.setStoreNo(10000);
//		store.setStoreName("진욱이네");
		
		Product product = new Product();
		product.setProdName("감자");
		product.setProdImg("가암자.jsp");
		
		Cart cart = new Cart();
		
		
//		Orders orders = new Orders();
//		orders.setUser(user);
		
		int ordersTotalCount = ordersMapper.getOrdersTotalCount();
		if(ordersTotalCount > 0) {
			List<Orders> ordersList = ordersMapper.getOrdersList("test01");
			System.out.println(ordersList.get(1)); 
			System.out.println(ordersTotalCount);
			if(CollectionUtils.isEmpty(ordersList) == false) {
				System.out.println("==2");
				for(Orders orders : ordersList) {
//					orders.setUser(user);
//					cart.setProduct(product);
//					orders.setStore(store);
//					orders.setProduct(product);
					
					System.out.println("=========================");
					System.out.println(orders.getUser().getUserId());
					System.out.println(orders.getOrderNo());
					System.out.println(orders.getOrderStatus());
					System.out.println(orders.getPickupTime());
					System.out.println(orders.getOrderDate());
					System.out.println(orders.getOrderPrice());
					
//					Product product = ordersMapper.get
					System.out.println(orders.getProduct().getProdName());
					System.out.println(orders.getProduct().getProdImg());
					System.out.println("=========================");
				}
			}
		}
	}
	
	//@Test
	public void testgetOrders() {
		
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
			Cart cart= new Cart();
			cart.setUserId("test01");
			cart.setOrderNo(10000);
			cart.setCartStatus(true);
			int result = ordersMapper.deleteOrdersCart(cart);
			System.out.println("결과는"+result+"입니다.");
		}
		
	//@Test
	public void testgetOrdersCartList() {
		User user = new User();
		user.setUserId("test01");
		
		Product product = new Product();
//		product.getProdName();
//		product.getProdInfo();
//		product.getProdImg();
//		product.getPrice();
//		
//		Cart cart = new Cart();
//		cart.getStoreName();
//		cart.getProdCount();
		
		Orders orders = new Orders();
		orders.getOrderPrice();
	int getCartTotalCount = ordersMapper.getCartTotalCount();
	if(getCartTotalCount > 0) {
		List<Cart> cartList = ordersMapper.getOrdersCartList();
		System.out.println("==3=="+getCartTotalCount);
		System.out.println("=="+cartList);
		if(CollectionUtils.isEmpty(cartList) == false) {
			System.out.println("==5==");
			for(Cart cart : cartList) {
	//			cart.setUser(user);
				cart.setProduct(product);
	//			cart.setO
				
				System.out.println("=========================");
				System.out.println(cart.getUserId());
				System.out.println(cart.getProduct().getProdName());
				System.out.println(cart.getProduct().getProdInfo());
				System.out.println(cart.getProduct().getProdImg());
				System.out.println(cart.getProduct().getPrice());
				System.out.println(cart.getProdCount());
	//			System.out.println(cart.getOrderNo());
				System.out.println("=========================");
				}
			}
		}
	}
	
//	@Test
//	public 
}
