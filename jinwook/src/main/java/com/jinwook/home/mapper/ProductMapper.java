package com.jinwook.home.mapper;

import com.jinwook.home.service.domain.Product;

public interface ProductMapper {

	public Product selectProductDetail(int prodNo);  // 상품 상세
}

