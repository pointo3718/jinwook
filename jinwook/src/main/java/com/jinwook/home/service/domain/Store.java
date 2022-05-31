package com.jinwook.home.service.domain;

import java.sql.Date;
import java.sql.Time;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Store {

   private int storeNo;
   private String userId;
   private String storeName;
   private String storeAddr;
   private String storeType;
   private boolean storeStatus;
   private String storePhone;
   private String storeIntro;
   private Date storeStart;
   private Time startTime;
   private Time endTime;
   private Date holiday;
   private String bussinessCard;
   private String storeImage;
   private String accNo;
   private String bank;
   private int totalEarn;
   private boolean isOpen;
   
   
   public Store(){
   }

}