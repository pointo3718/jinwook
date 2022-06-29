package com.jinwook.home.service.orders;

import java.util.List;
import java.util.Map;

import com.jinwook.home.service.domain.Attach;
import com.jinwook.home.service.domain.Cart;
import com.jinwook.home.service.domain.Coupon;
import com.jinwook.home.service.domain.Jpay;
import com.jinwook.home.service.domain.Notice;
import com.jinwook.home.service.domain.Orders;
import com.jinwook.home.service.domain.Store;
import com.jinwook.home.service.domain.User;

public interface OrdersService {
   
public int addOrders(Orders orders);          
   
   public List<Orders> getOrdersList(Orders orders);    
   
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
   
   public List<Jpay> getOrdersJpayList(Jpay jpay);            
   
   public int addOrdersNotice(Notice notice);
   
   public int deleteOrdersNotice(int notiNo);
   
   public List<Notice>getOrdersNoticeList(Notice notice);

   public int updateOrdersCeoJb(Jpay jpay);
   
   public int updateOrdersCeoEarn(Store store);
   
   public int checkJpPassword(User user);
   
   public int updateOrdersCoupon(Coupon coupon);
   
   public int importJpayCharge(User user);
   
   // 첨부파일 조회
	public Attach selectFileList(int prodNo) throws Exception;
	
	public int updateOrdersStatus(Orders orders);

}