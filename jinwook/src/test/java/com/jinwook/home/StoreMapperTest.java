package com.jinwook.home;

import java.time.LocalDateTime;
import java.util.List;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.util.CollectionUtils;

import com.jinwook.home.common.Criteria;
import com.jinwook.home.mapper.StoreMapper;
import com.jinwook.home.service.domain.Coupon;
import com.jinwook.home.service.domain.Product;
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
		coupon.setCouponNo(10025);

		int result = storeMapper.addOrderCoupon(coupon);
		System.out.println("결과는" + result + "입니다.");
	}
	
//	@Test
//	public void testOfGetCouponList() {
//		
//		
//		int getCouponTotalCount = storeMapper.getCouponTotalCount();
//		if (getCouponTotalCount > 0) {
//			List<Coupon> couponList = storeMapper.getCouponList("test13");
//			
//			if (CollectionUtils.isEmpty(couponList) == false) { 		
//				for (Coupon coupon : couponList) {
//					System.out.println("=========================");
//	
//					System.out.println(coupon.getCouponNo());
//					System.out.println(coupon.getCouponType());					
//					System.out.println(coupon.getCouponDc());
//					System.out.println(coupon.getCouponValidDate());
//
//					
//					System.out.println("=========================");
//				}
//			}
//		}
//	}
	
	
	@Test
	public void testOfGetCouponListPaging() {
		
		Criteria criteria = new Criteria();
		
		
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
		
		
		int getStoreTotalCount = storeMapper.getStoreTotalCount();
		if (getStoreTotalCount > 0) {
			List<Store> getStore = storeMapper.getStore(10010);
			
			if (CollectionUtils.isEmpty(getStore) == false) { 		
				for (Store store : getStore) {
					System.out.println("=========================");
	
					System.out.println(store.getStoreNo());
					System.out.println(store.getStoreName());	
					System.out.println(store.getStoreType());
					System.out.println(store.getStoreAddr());
					System.out.println(store.getStartTime());
					System.out.println(store.getEndTime());
					System.out.println(store.getHoliday());
					System.out.println(store.getStoreIntro());					
				    System.out.println(store.getOrders().getReviewStar());
					System.out.println(store.getProduct().getProdNo());
					System.out.println(store.getProduct().getProdName());
					System.out.println(store.getProduct().getPrice());
					System.out.println(store.getProduct().getProdOrign());
					System.out.println(store.getProduct().getProdInfo());
					System.out.println(store.getProduct().isSoldout());
					

					
					System.out.println("=========================");
				}
			}
		}
	}
		
	@Test
	public void testOfGetStoreWallet() {
		
		int getStoreTotalCount = storeMapper.getStoreTotalCount();
		if (getStoreTotalCount > 0) {
			System.out.println(getStoreTotalCount);
			List<Store> walletList = storeMapper.getStoreWallet(10000);
			if (CollectionUtils.isEmpty(walletList) == false) { 		
				for (Store store : walletList) {
					System.out.println("=========================");
					
					System.out.println(store.getTotalEarn());					
					System.out.println(store.getUser().getJpBalance());
					System.out.println(store.getRequest().getResDate());
					System.out.println(store.getRequest().getReqDate());					
					System.out.println(store.getRequest().getRefundMoney());
					System.out.println(store.getRequest().getReqStatus());

					
					System.out.println("=========================");
				}
			}
		}
	}
}
