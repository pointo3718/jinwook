package com.jinwook.home.service.domain;

import java.sql.Date;
import java.sql.Time;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Orders {

	private String userId;
	private int orderNo;
	private String storeNo;
	private String prodName;
	private int prodCount;
	private String prodInfo;
	private Date orderDate;
	private Time pickupTime;
	private int orderPrice;
	private String orderStatus;
	private String buyerName;
	private String buyerPhone;
	private String orderReq;
	private String reviewTitle;
	private String reviewContent;
	private Date reviewDate;
	private int reviewStar;
	private String reviewImg1;
	private String reviewImg2;
	private String reviewImg3;
	
	
	
	public Orders() {
		// TODO Auto-generated constructor stub
	}

}