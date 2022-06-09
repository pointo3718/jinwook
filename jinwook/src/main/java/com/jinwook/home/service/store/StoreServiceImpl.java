package com.jinwook.home.service.store;

import java.sql.Date;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;

import com.jinwook.home.common.PaginationInfo;
import com.jinwook.home.mapper.StoreMapper;
import com.jinwook.home.service.domain.Coupon;
import com.jinwook.home.service.domain.Product;
import com.jinwook.home.service.domain.Store;

@Service
public class StoreServiceImpl implements StoreService {

	@Autowired
	private StoreMapper storeMapper;

	@Override
	public void updateStore(Store store) {

		storeMapper.updateStore(store);
	}

	@Override
	public void addStoreProduct(Product product) {

		storeMapper.addStoreProduct(product);
	}

	@Override
	public void updateStoreProduct(Product product) {

		storeMapper.updateStoreProduct(product);
	}

	@Override
	public void deleteStoreProduct(Product product) {

		storeMapper.deleteStoreProduct(product);
	}

	@Override
	public void isSoldout(Product product) {

		storeMapper.isSoldout(product);

	}

	@Override
	public void isOpen(Store store) {

		storeMapper.isOpen(store);
	}

	@Override
	public void addOrderCoupon(Coupon coupon) {

		storeMapper.addOrderCoupon(coupon);
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
	public List<Store> getStore(Store store){
		
		List<Store> getStore = Collections.emptyList();
		
		int storeTotalCount = storeMapper.getStoreTotalCount(store);

		PaginationInfo paginationInfo = new PaginationInfo(store);
		paginationInfo.setTotalRecordCount(storeTotalCount);

		store.setPaginationInfo(paginationInfo);

		if (storeTotalCount > 0) {
			getStore = storeMapper.getStore(store);
		}

		return getStore;
	}


	



	@Override
	public List<Store> getStoreWallet(@RequestParam("storeNo") int storeNo, @RequestParam("orderDateStart") Date orderDateStart,			
			@RequestParam("orderDateEnd") Date orderDateEnd) {
		List<Store> getStoreWallet = Collections.emptyList();

		int storeTotalCount = storeMapper.getStoreWalletTotalCount();

		if (storeTotalCount > 0) {
			getStoreWallet = storeMapper.getStoreWallet(storeNo, orderDateStart, orderDateEnd);
		}

		return getStoreWallet;
	}

}
