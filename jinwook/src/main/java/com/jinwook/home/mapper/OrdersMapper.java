package com.jinwook.home.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.jinwook.home.service.domain.Orders;

@Mapper
public interface OrdersMapper {

	public int addOrders(Orders orders); //주문
	
	public List<Orders> selectOrdersList(); //주문내역
	
	public Orders getOrders(int orderNo);	//주문내역상세
	
	public int deleteOrders(Orders orders);	//주문내역삭제
	
	public int updateOrders(Orders orders);	//주문내역(수락,거절,픽업완료)
	
	
	
}
 