package com.jinwook.home.service.domain;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Complain extends CommonDTO {

	private int complainNo;
	private User user;
	private String userId;
	private String complainId;
	private Date complainDate;
	private String complainCode;
	private int rcpNo;
	private int orderNo;
	private int commentNo;
	private boolean complainStatus;
	private boolean complainDeleteYn;
	
	
}