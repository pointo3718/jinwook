package com.jinwook.home.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.jinwook.home.common.Criteria;
import com.jinwook.home.service.domain.Cart;
import com.jinwook.home.service.domain.Jpay;
import com.jinwook.home.service.domain.Notice;
import com.jinwook.home.service.domain.Orders;
import com.jinwook.home.service.domain.User;

@Mapper
public interface OrdersMapper {

	public int addOrders(Orders orders); 			//주문
	
	public List<Orders> getOrdersList(String userId); 	//주문내역
	
	public List<Orders> getOrders(int orderNo);		//주문내역상세
	
	public int deleteOrders(Orders orders);			//주문내역삭제
	
	public int updateOrders(Orders orders);			//주문내역(수락,거절,픽업완료)
	
	public int getOrdersTotalCount();				//주문목록 개수
	
	public int addOrdersCart(Cart cart);			//장바구니 담기
		
	public int updateOrdersCart(Cart cart);			//장바구니 수정
		
	public int deleteOrderCartAfter(Cart cart);		//장바구니	삭제(status변경)
	
	public int deleteOrdersCart(Cart cart);			//장바구니 목록삭제
	
	public int deleteOrdersCartAll(Cart cart);		//장바구니 목록전부삭제
	
	public List<Cart> getOrdersCartList(Cart cart);	//장바구니 목록

	public int getCartTotalCount();					//장바구니 품목개수
	
	public int addOrdersJpayPassword(User user);	//진욱페이 비밀번호 등록
	
	public int updateOrdersJpayPassword(User user); //진욱페이 비밀번호 수정
	
	public int addOrdersJpayCharge(Jpay jpay);		
	
	public int addOrdersjBCharge(Object object);
	
	public List<Jpay> getOrdersJpaylist();
	
	public int getOrdersJpaylistTotalCount();
	
	public List<Jpay> getOrdersJpayChargelist();
	
	public int getOrdersJpayChargelistTotalCount();
	
	public int addOrdersNotice();
	
	public int deleteOrdersNotice();
	
	public List<Notice>getOrdersNoticelist();

	public int getOrdersNoticelistTotalCount();
}
 