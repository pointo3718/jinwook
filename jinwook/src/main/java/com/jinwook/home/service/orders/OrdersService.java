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
	
	public int updateOrders(Orders orders);			//주문내역(수락,거절,픽업완료)
	
	public int getOrdersTotalCount();				//주문목록 개수
	
	public int addOrdersCart(Cart cart);			//장바구니 담기
		
	public int updateOrdersCart(Cart cart);			//장바구니 수정
		
	public int deleteOrderCartAfter(Cart cart);		//장바구니	삭제(status변경)
	
	public int deleteOrdersCart(int cartNo);			//장바구니 목록삭제
	
	public int deleteOrdersCartAll(boolean cartStatus);		//장바구니 목록전부삭제
	
	public List<Cart> getOrdersCartList(Cart cart);	//장바구니 목록

	public int getCartTotalCount();					//장바구니 품목개수
	
	public int addOrdersJpayPassword(User user);	//진욱페이 비밀번호 등록
	
	public int updateOrdersJpayPassword(User user); //진욱페이 비밀번호 수정
	
	public int addOrdersJpayCharge(Jpay jpay);		//진욱페이 충전
	
	public int addOrdersjBCharge(Object object);	//진욱페이 잔액 
	
	public List<Jpay> getOrdersJpaylist(String userId);			//진욱페이 내역
	
	public int getOrdersJpaylistTotalCount();		//진욱페이 내역카운트
	
	public int addOrdersNotice(Notice notice);
	
	public int deleteOrdersNotice(int notiNo);
	
	public List<Notice>getOrdersNoticelist(String receiveId);

	public int getOrdersNoticelistTotalCount();
	
	public int updateOrdersCeoJb(Jpay jpay);
	
	public int updateOrdersCeoEarn(Store store);
}
