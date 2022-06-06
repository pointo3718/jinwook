package com.jinwook.home.service.orders;

import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.jinwook.home.mapper.OrdersMapper;
import com.jinwook.home.service.domain.Board;
import com.jinwook.home.service.domain.Cart;
import com.jinwook.home.service.domain.Jpay;
import com.jinwook.home.service.domain.Notice;
import com.jinwook.home.service.domain.Orders;
import com.jinwook.home.service.domain.Store;
import com.jinwook.home.service.domain.User;

@Service("ordersServiceImpl")
public class OrdersServiceImpl implements OrdersService{

	@Autowired
	@Qualifier("ordersMapper")
	private OrdersMapper ordersMapper;
	
	@Override
	public int addOrders(Orders orders) {
		
		return ordersMapper.addOrders(orders);
	}

	@Override
	public List<Orders> getOrdersList(String userId) {
		List<Orders> ordersList = Collections.emptyList();

		int OrdersTotalCount = ordersMapper.getOrdersTotalCount();

		if (OrdersTotalCount > 0) {
			ordersList = ordersMapper.getOrdersList(userId);
		}

		return ordersList;
	}

	@Override
	public List<Orders> getOrders(int orderNo) {
		List<Orders> ordersList = Collections.emptyList();

		ordersList = ordersMapper.getOrders(orderNo);

		return ordersList;
	}

	@Override
	public int deleteOrders(int orderNo) {
		
		return ordersMapper.deleteOrders(orderNo);
	}

	@Override
	public int updateOrders(Orders orders) {
		
		return ordersMapper.updateOrders(orders);
	}

	@Override
	public int addOrdersCart(Cart cart) {
		
		return ordersMapper.addOrdersCart(cart);
	}

	@Override
	public int updateOrdersCart(Cart cart) {
		
		return ordersMapper.updateOrdersCart(cart);
	}

	@Override
	public int deleteOrdersCartAfter(Cart cart) {
		
		return ordersMapper.deleteOrdersCartAfter(cart);
	}

	@Override
	public int deleteOrdersCart(int cartNo) {
		
		return ordersMapper.deleteOrdersCart(cartNo);
	}

	@Override
	public int deleteOrdersCartAll(boolean cartStatus) {
		
		return ordersMapper.deleteOrdersCartAll(cartStatus);
	}

	@Override
	public List<Cart> getOrdersCartList(Cart cart) {
		List<Cart> cartList = Collections.emptyList();

		int CartTotalCount = ordersMapper.getCartTotalCount();

		if (CartTotalCount > 0) {
			cartList = ordersMapper.getOrdersCartList(cart);
		}

		return cartList;
	}

	@Override
	public int addOrdersJpayPassword(User user) {
		
		return ordersMapper.addOrdersJpayPassword(user);
	}

	@Override
	public int updateOrdersJpayPassword(User user) {
		
		return ordersMapper.updateOrdersJpayPassword(user);
	}

	@Override
	public int addOrdersJpayCharge(Jpay jpay) {
		
		return ordersMapper.addOrdersJpayCharge(jpay);
	}

	@Override
	public int addOrdersjBCharge(Object object) {
		
		return ordersMapper.addOrdersjBCharge(object);
	}

	@Override
	public List<Jpay> getOrdersJpaylist(String userId) {
		List<Jpay> jpayList = Collections.emptyList();

		int OrdersJpaylistTotalCount = ordersMapper.getOrdersJpaylistTotalCount();

		if (OrdersJpaylistTotalCount > 0) {
			jpayList = ordersMapper.getOrdersJpaylist(userId);
		}

		return jpayList;
	}

	@Override
	public int addOrdersNotice(Notice notice) {
		
		return ordersMapper.addOrdersNotice(notice);
	}

	@Override
	public int deleteOrdersNotice(int notiNo) {
		
		return ordersMapper.deleteOrdersNotice(notiNo);
	}

	@Override
	public List<Notice> getOrdersNoticelist(String receiveId) {
		List<Notice> noticeList = Collections.emptyList();

		int OrdersNoticelistTotalCount = ordersMapper.getOrdersNoticelistTotalCount();

		if (OrdersNoticelistTotalCount > 0) {
			noticeList = ordersMapper.getOrdersNoticelist(receiveId);
		}

		return noticeList;
	}
	
	@Override
	public int updateOrdersCeoJb(Jpay jpay) {
		
		return ordersMapper.updateOrdersCeoJb(jpay);
	}

	@Override
	public int updateOrdersCeoEarn(Store store) {
		
		return ordersMapper.updateOrdersCeoEarn(store);
	}

}
