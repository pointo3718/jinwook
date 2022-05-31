package com.jinwook.home.service.domain;


import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Product {
   
   private int prodNo; 
   private int storeNo; 
   private String prodName; 
   private String prodImg; 
   private int price; 
   private String prodOrign; 
   private String prodInfo; 
   private boolean isSoldout; 
   
   
   public Product(){
   }

}