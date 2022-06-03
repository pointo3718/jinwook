package com.jinwook.home.service.domain;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Coupon {
   
   private int couponNo;
   private User user;
   private String couponType;
   private boolean couponStatus; 
   private Date couponValidDate; 
   private int couponDc; 
   
   public Coupon(){
   }

}