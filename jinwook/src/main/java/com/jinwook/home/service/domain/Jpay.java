package com.jinwook.home.service.domain;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Jpay {

	private int jpNo;
	private String userId;
	private int orderNo;
	private int jpStatus;
	private int finalPrice;
	private int chargePay;
	private Date jpDate; 
	
	public Jpay() {
		// TODO Auto-generated constructor stub
	}

}