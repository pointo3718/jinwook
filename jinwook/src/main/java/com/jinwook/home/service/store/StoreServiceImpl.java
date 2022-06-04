package com.jinwook.home.service.store;


import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jinwook.home.mapper.StoreMapper;
import com.jinwook.home.service.domain.Coupon;
import com.jinwook.home.service.domain.Product;
import com.jinwook.home.service.domain.Store;


@Service
public class StoreServiceImpl implements StoreService{
		
	@Autowired
	private StoreMapper storeMapper;
	
	@Override
	public int updateStore(Store store){
		
		return storeMapper.updateStore(store);
	}
	
	@Override
	public int addStoreProduct(Product product){
		
		return storeMapper.addStoreProduct(product);
	}
	
	@Override
	public int updateStoreProduct(Product product){
		
		return storeMapper.updateStoreProduct(product);
	}
	
	@Override
	public int deleteStoreProduct(Product product){
		
		return storeMapper.deleteStoreProduct(product);
	}
	
	
	@Override
	public int isSoldout(Product product){
		
		return storeMapper.isSoldout(product);
	}
	
	@Override
	public int isOpen(Store store){
		
		return storeMapper.isOpen(store);
	}
	
	@Override
	public int addOrderCoupon(Coupon coupon){
		
		return storeMapper.addOrderCoupon(coupon);
	}
	
	@Override	
	public List<Coupon> getCouponList(String userId) {
		List<Coupon> couponList = Collections.emptyList();

		int couponTotalCount = storeMapper.getCouponTotalCount();

		if (couponTotalCount > 0) {
			couponList = storeMapper.getCouponList(userId);
		}

		return couponList;
	}
	
	@Override	
	public List<Store> getStore(int storeNo) {
		List<Store> getStore = Collections.emptyList();

		int storeTotalCount = storeMapper.getStoreTotalCount();

		if (storeTotalCount > 0) {
			getStore = storeMapper.getStore(storeNo);
		}

		return getStore;
	}
	
	@Override	
	public List<Store> getStoreWallet(int storeNo) {
		List<Store> getStoreWallet = Collections.emptyList();

		int storeTotalCount = storeMapper.getStoreTotalCount();

		if (storeTotalCount > 0) {
			getStoreWallet = storeMapper.getStoreWallet(storeNo);
		}

		return getStoreWallet;
	}
	
	
}
