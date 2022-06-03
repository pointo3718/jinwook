package com.jinwook.home.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.jinwook.home.service.domain.Cart;
import com.jinwook.home.service.domain.Orders;

@Mapper
public interface OrdersMapper {

	public int addOrders(Orders orders); 	//주문
	
	public List<Orders> getOrdersList(String userId); 	//주문내역
	
	public Orders getOrders(int orderNo);	//주문내역상세
	
	public int deleteOrders(Orders orders);	//주문내역삭제
	
	public int updateOrders(Orders orders);	//주문내역(수락,거절,픽업완료)
	
	public int getOrdersTotalCount();		// 주문 목록 개수
	
	public int addOrdersCart(Cart cart);	// 장바구니 담기
		
	public int updateOrdersCart(Cart cart);	// 장바구니 수정
	
	public int deleteOrdersCart(Cart cart);	// 장바구니 삭제
	
	public List<Cart> getOrdersCartList();	// 장바구니 목록
	
	
	
	
	
	
	
}
 