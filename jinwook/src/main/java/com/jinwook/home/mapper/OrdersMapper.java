package com.jinwook.home.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.jinwook.home.service.domain.Orders;

@Mapper
public interface OrdersMapper {

	public int addOrders(Orders orders); //�ֹ�
	
	public List<Orders> selectOrdersList(); //�ֹ�����
	
	public Orders getOrders(int orderNo);	//�ֹ�������
	
	public int deleteOrders(Orders orders);	//�ֹ���������
	
	public int updateOrders(Orders orders);	//�ֹ�����(����,����,�Ⱦ��Ϸ�)
	
	
	
}
 