package com.jinwook.home.service.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Cart {

	private int cartNo;
	private String userId;
	private User user;
	private Product product;	//prod_no,prod_name,prod_img,prod_info,price
	private Orders orders;
	private int storeNo;//
	private String storeName;//
	private int prodCount;
	private boolean cartStatus;//
	public Cart() {
		// TODO Auto-generated constructor stub
	}

}
