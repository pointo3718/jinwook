package com.jinwook.home.service.store;

import com.jinwook.home.service.domain.Product;

public interface StoreDao {
	
	public void updateStoreProduct(Product product) throws Exception;

}
