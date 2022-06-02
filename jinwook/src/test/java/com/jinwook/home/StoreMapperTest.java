package com.jinwook.home;

import java.time.LocalDateTime;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.jinwook.home.mapper.StoreMapper;
import com.jinwook.home.service.domain.Product;
import com.jinwook.home.service.domain.Store;

@SpringBootTest
class StoreMapperTest {

	@Autowired
	private StoreMapper storeMapper;

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
	public void testOfIsSoldOut() {
		Product product = new Product();
		product.setProdNo(10000);
		product.setSoldout(true);

		int result = storeMapper.isSoldout(product);
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
	public void testOfIsOpen() {
		Store store = new Store();
		store.setStoreNo(10000);
		store.setOpen(true);

		int result = storeMapper.isOpen(store);
		System.out.println("결과는" + result + "입니다.");		
	}
	
	@Test
	public void testOfGetStore() { 
		Store store = new Store();  
		store.setStoreNo(10013);

		int result = storeMapper.getStore(store);
		System.out.println("결과는" + result + "입니다.");
	}
	
}
