package com.jinwook.home.service.orders;

import java.util.List;

import com.jinwook.home.service.domain.Cart;
import com.jinwook.home.service.domain.Jpay;
import com.jinwook.home.service.domain.Notice;
import com.jinwook.home.service.domain.Orders;
import com.jinwook.home.service.domain.Store;
import com.jinwook.home.service.domain.User;

public interface OrdersService {
   
public int addOrders(Orders orders);          
   
   public List<Orders> getOrdersList(String userId);    
   
   public List<Orders> getOrders(int orderNo);      
   
   public int deleteOrders(int orderNo);         
   
   public int updateOrders(Orders orders);               
   
   public int addOrdersCart(Cart cart);         
      
   public int updateOrdersCart(Cart cart);         
      
   public int deleteOrdersCartAfter(Cart cart);      
   
   public int deleteOrdersCart(int cartNo);         
   
   public int deleteOrdersCartAll(boolean cartStatus);      
   
   public List<Cart> getOrdersCartList(Cart cart);            
   
   public int addOrdersJpayPassword(User user);   
   
   public int updateOrdersJpayPassword(User user); 
   
   public int addOrdersJpayCharge(Jpay jpay);      
   
   public int addOrdersjBCharge(Object object);   
   
   public List<Jpay> getOrdersJpaylist(String userId);            
   
   public int addOrdersNotice(Notice notice);
   
   public int deleteOrdersNotice(int notiNo);
   
   public List<Notice>getOrdersNoticelist(String receiveId);

   public int updateOrdersCeoJb(Jpay jpay);
   
   public int updateOrdersCeoEarn(Store store);
}