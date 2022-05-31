package com.jinwook.home.service.domain;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Notice {
	
	private int notiNo;
	private String sendId;
	private String receiveId;
	private int orderNo;
	private char notiType;
	private String notiContent;
	private String storeName;
	private String buyerName;
	private Date notiDate;

}
