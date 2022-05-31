package com.jinwook.home.service.domain;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Request {

   int reqNo;
   String userId;
   String reqCode;
   Date reqDate;
   Date resDate;
   String reqStatus;
   int refundMoney;
   String adTitle;
   String adContent;
   String adImg;
   
}