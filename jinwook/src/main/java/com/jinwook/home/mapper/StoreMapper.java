package com.jinwook.home.mapper;


import org.apache.ibatis.annotations.Mapper;

import com.jinwook.home.service.domain.Product;
import com.jinwook.home.service.domain.Store;

@Mapper
public interface StoreMapper {
	
	public int updateStore(Store store);
	
	public int getStore(Store store);
	
	public int addStoreProduct(Product Product);

	public int updateStoreProduct(Product product);
	   
	public int deleteStoreProduct(Product Product);
	   
	public int isSoldout(Product Product);
	
	public int isOpen(Store store);

}
