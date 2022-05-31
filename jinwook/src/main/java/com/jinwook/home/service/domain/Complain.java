package com.jinwook.home.service.domain;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Complain {

	private int complainNo;
	private String userId;
	private String complainId;
	private Date complainDate;
	private char complainCode;
	private String complainTarget;
	private boolean complainStatus;
	
	
}
