package com.jinwook.home.service.orders;

import java.util.List;

import com.jinwook.home.service.domain.Cart;
import com.jinwook.home.service.domain.Jpay;
import com.jinwook.home.service.domain.Notice;
import com.jinwook.home.service.domain.Orders;
import com.jinwook.home.service.domain.User;

public interface OrdersService {
	
	public int addOrders(Orders orders); 			
	
	public List<Orders> getOrdersList(String userId); 	
	
	public List<Orders> getOrders(int orderNo);		
	
	public int deleteOrders(int orderNo);			
	
	public int updateOrders(Orders orders);			
	
	public int getOrdersTotalCount();				
	
	public int addOrdersCart(Cart cart);			
		
	public int updateOrdersCart(Cart cart);			
		
	public int deleteOrderCartAfter(Cart cart);		
	
	public int deleteOrdersCart(Cart cart);			
	
	public int deleteOrdersCartAll(Cart cart);		
	
	public List<Cart> getOrdersCartList(Cart cart);	

	public int getCartTotalCount();					
	
	public int addOrdersJpayPassword(User user);	
	
	public int updateOrdersJpayPassword(User user); 
	
	public int addOrdersJpayCharge(Jpay jpay);		
	
	public int addOrdersjBCharge(Object object);	
	
	public List<Jpay> getOrdersJpaylist(String userId);			
	
	public int getOrdersJpaylistTotalCount();		
	
	public List<Jpay> getOrdersJpayChargelist();
	
	public int addOrdersNotice(Notice notice);
	
	public int deleteOrdersNotice(Notice notice);
	
	public List<Notice>getOrdersNoticelist(String userId);

	public int getOrdersNoticelistTotalCount();
}
