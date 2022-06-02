package com.jinwook.home.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.jinwook.home.service.domain.Product;

@Mapper
public interface ProductMapper {

	public Product selectProductDetail(int prodNo);  // ��ǰ ��
	
}


