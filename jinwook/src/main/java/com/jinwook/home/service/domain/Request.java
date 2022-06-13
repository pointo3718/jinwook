package com.jinwook.home.service.domain;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Request extends CommonDTO  {

	private int reqNo;
	private User user;
	private String userId;
	private Store store;
	private int storeNo;
	private String reqCode;
	private Date reqDate;
	private Date resDate;
	private String reqStatus;
	private int refundMoney;
	private String adTitle;
	private String adContent;
	private String adImg;
	private int countPickup;
	
	
	
	public Request() {}
   
}