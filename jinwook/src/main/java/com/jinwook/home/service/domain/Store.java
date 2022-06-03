package com.jinwook.home.service.domain;

import java.sql.Date;
import java.time.LocalDateTime;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Store {

   private int storeNo;
   private User user;
   private Orders orders;
   private Product product;
   private String userId;
   private String storeName;
   private String storeAddr;
   private String storeType;
   private boolean storeStatus;
   private String storePhone;
   private String storeIntro;
   private Date storeStart;
   private LocalDateTime startTime;
   private LocalDateTime endTime;
   private String holiday;
   private String bussinessCard;
   private String storeImage;
   private String accNo;
   private String bank;
   private int totalEarn;
   private boolean isOpen;
   
   
   public Store(){
   }

}