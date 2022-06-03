package com.jinwook.home;

import java.time.LocalDateTime;
import java.util.List;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.util.CollectionUtils;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.datatype.jsr310.JavaTimeModule;
import com.jinwook.home.mapper.StoreMapper;
import com.jinwook.home.service.domain.Coupon;
import com.jinwook.home.service.domain.Orders;
import com.jinwook.home.service.domain.Product;
import com.jinwook.home.service.domain.Request;
import com.jinwook.home.service.domain.Store;

@SpringBootTest
class StoreMapperTest {

	@Autowired
	private StoreMapper storeMapper;
	
	@Test
	public void testOfUpdateStore() {
		Store store = new Store();
		store.setStoreNo(10000);
		store.setStoreIntro("우리상점최고");
		store.setStorePhone("010-2222-3333");
		store.setStoreImage("진욱진욱.jpg");
		store.setStartTime(LocalDateTime.now());
		store.setEndTime(LocalDateTime.now());
		store.setHoliday("충청도");
		store.setBank("신한은행");
		store.setAccNo("110-111-1111");

		int result = storeMapper.updateStore(store);
		System.out.println("결과는" + result + "입니다.");
	}
	
	@Test
	public void testOfAddStoreProduct() {
		
		Product product = new Product();
		product.setStoreNo(10012);
		product.setProdName("사과");
		product.setPrice(1000);
		product.setProdInfo("100g에 1000원");
		product.setProdImg("사과.jpg");
		product.setProdOrign("강원도");

		int result = storeMapper.addStoreProduct(product);
		System.out.println("결과는" + result + "입니다.");				
	}

	@Test
	public void testOfUpdateStoreProduct() {
		Product product = new Product();
		product.setProdNo(10000);
		product.setPrice(100);
		product.setProdInfo("상품정보수정");
		product.setProdImg("홍길동.jpg");
		product.setProdOrign("충청도");

		int result = storeMapper.updateStoreProduct(product);
		System.out.println("결과는" + result + "입니다.");

	}
	
	@Test
	public void testOfDeleteStoreProduct() {
		Product product = new Product();
		product.setProdNo(10018);

		int result = storeMapper.deleteStoreProduct(product);
		System.out.println("결과는" + result + "입니다.");
		
	}


	@Test
	public void testOfIsSoldOut() {
		Product product = new Product();
		product.setProdNo(10000);
		product.setSoldout(true);

		int result = storeMapper.isSoldout(product);
		System.out.println("결과는" + result + "입니다.");		
	}
		
	@Test
	public void testOfIsOpen() {
		Store store = new Store();
		store.setStoreNo(10000);
		store.setOpen(true);

		int result = storeMapper.isOpen(store);
		System.out.println("결과는" + result + "입니다.");		
	}
	
	@Test
	public void testOfAddOrderCoupon() {
		Coupon coupon = new Coupon();
		coupon.setCouponStatus(true);
		coupon.setCouponNo(10015);

		int result = storeMapper.addOrderCoupon(coupon);
		System.out.println("결과는" + result + "입니다.");
	}
	
	@Test
	public void testOfGetCouponList() {
		
		
		int getCouponTotalCount = storeMapper.getCouponTotalCount();
		if (getCouponTotalCount > 0) {
			List<Coupon> couponList = storeMapper.getCouponList("test13");
			
			if (CollectionUtils.isEmpty(couponList) == false) { 		
				for (Coupon coupon : couponList) {
					System.out.println("=========================");
	
					System.out.println(coupon.getCouponNo());
					System.out.println(coupon.getCouponType());					
					System.out.println(coupon.getCouponDc());
					System.out.println(coupon.getCouponValidDate());

					
					System.out.println("=========================");
				}
			}
		}
	}
	
	
	
	@Test
	public void testOfGetStore() {
		Store store = storeMapper.getStore(10011);
//		System.out.println(product.toString());
		try {
			//String boardJson = new ObjectMapper().writeValueAsString(board);
            String storeJson = new ObjectMapper().registerModule(new JavaTimeModule()).writeValueAsString(store);

			System.out.println("=========================");
			System.out.println(storeJson);
			System.out.println("=========================");

		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
	}
	
	@Test
	public void testOfGetStoreReviewStar() {
		
		Orders orders = new Orders();
		orders=storeMapper.getStoreReviewStar(10013);
//		System.out.println(product.toString());
		try {
			//String boardJson = new ObjectMapper().writeValueAsString(board);
            String ordersJson = new ObjectMapper().registerModule(new JavaTimeModule()).writeValueAsString(orders);

			System.out.println("=========================");
			System.out.println(ordersJson);
			System.out.println("=========================");

		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
	}
	
	
	@Test
	public void testOfGetStoreProductList() {
		
		
		int getProductTotalCount = storeMapper.getProductTotalCount();
		if (getProductTotalCount > 0) {
			List<Product> productList = storeMapper.getStoreProductList(10011);
			
			if (CollectionUtils.isEmpty(productList) == false) { 		
				for (Product product : productList) {
					System.out.println("=========================");
	
					System.out.println(product.getProdNo());
					System.out.println(product.getProdName());					
					System.out.println(product.getPrice());
					System.out.println(product.getProdOrign());
					System.out.println(product.getProdInfo());

					
					System.out.println("=========================");
				}
			}
		}
	}
	
	
	@Test
	public void testOfGetStoreWallet() {
		Store store = storeMapper.getStoreWallet("test01");
//		System.out.println(product.toString());
		try {
			//String boardJson = new ObjectMapper().writeValueAsString(board);
            String storeJson = new ObjectMapper().registerModule(new JavaTimeModule()).writeValueAsString(store);

			System.out.println("=========================");
			System.out.println(storeJson);
			System.out.println("=========================");

		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
	}
	
	@Test
	public void testOfGetStoreWalletRefund() {
		
		int getRequestTotalCount = storeMapper.getRequestTotalCount();
		if (getRequestTotalCount > 0) {
			System.out.println(getRequestTotalCount);
			List<Request> requestList = storeMapper.getStoreWalletRefund("test01");
			System.out.println(requestList.get(1));
			if (CollectionUtils.isEmpty(requestList) == false) { 		
				for (Request request : requestList) {
					System.out.println("=========================");
	
					System.out.println(request.getResDate());
					System.out.println(request.getReqDate());					
					System.out.println(request.getRefundMoney());
					System.out.println(request.getReqStatus());

					
					System.out.println("=========================");
				}
			}
		}
	}
}
