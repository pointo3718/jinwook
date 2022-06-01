package com.jinwook.home.mapper;


import org.apache.ibatis.annotations.Mapper;

import com.jinwook.home.service.domain.Store;

@Mapper
public interface StoreMapper {
	
	public int updateStore(Store params);
	
	public int getStore(Long storeNo);

}
