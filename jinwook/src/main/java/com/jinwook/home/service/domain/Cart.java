package com.jinwook.home.service.domain;

import java.sql.Date;
import java.sql.Time;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Cart {

	private int cartNo;
	private String userId;
	private int prodNo;
	private int orderNo;
	private String storeName;
	private int prodCount;
	private int cartStatus;

	public Cart() {
		// TODO Auto-generated constructor stub
	}

}
