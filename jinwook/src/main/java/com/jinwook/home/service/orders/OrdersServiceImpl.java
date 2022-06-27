package com.jinwook.home.service.orders;

import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.jinwook.home.common.PaginationInfo;
import com.jinwook.home.mapper.OrdersMapper;
import com.jinwook.home.service.domain.Cart;
import com.jinwook.home.service.domain.Coupon;
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
		
		ordersMapper.addOrders(orders);
		System.out.println(orders);
		Orders newOrders = ordersMapper.getNewOrders();
		System.out.println("newOrders"+newOrders);
		int orderNo= newOrders.getOrderNo();
		String userId = newOrders.getUserId();
		Cart cart = new Cart();
		cart.setOrders(newOrders);
		cart.setUserId(userId);
		Coupon coupon = new Coupon();
		coupon.setUserId(userId);
		coupon.getCouponNo();
		System.out.println(coupon);
		ordersMapper.updateOrdersCoupon(coupon);
		System.out.println(cart);
		int result = ordersMapper.deleteOrdersCartAfter(cart);
		System.out.println(result);
		return result;
	}

	@Override
	public List<Orders> getOrdersList(Orders orders) {
		List<Orders> ordersList = Collections.emptyList();

		int OrdersTotalCount = ordersMapper.getOrdersTotalCount(orders);
		PaginationInfo paginationInfo = new PaginationInfo(orders);
	    paginationInfo.setTotalRecordCount(OrdersTotalCount);

	    orders.setPaginationInfo(paginationInfo);

		if (OrdersTotalCount > 0) {
			ordersList = ordersMapper.getOrdersList(orders);
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
	public List<Jpay> getOrdersJpayList(Jpay jpay) {
		List<Jpay> jpayList = Collections.emptyList();

		int OrdersJpayListTotalCount = ordersMapper.getOrdersJpayListTotalCount(jpay);
		PaginationInfo paginationInfo = new PaginationInfo(jpay);
	    paginationInfo.setTotalRecordCount(OrdersJpayListTotalCount);

	    jpay.setPaginationInfo(paginationInfo);

		if (OrdersJpayListTotalCount > 0) {
			jpayList = ordersMapper.getOrdersJpayList(jpay);
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
	public List<Notice> getOrdersNoticeList(Notice notice) {
		List<Notice> noticeList = Collections.emptyList();
		
		int OrdersNoticeListTotalCount = ordersMapper.getOrdersNoticeListTotalCount(notice);
		PaginationInfo paginationInfo = new PaginationInfo(notice);
	    paginationInfo.setTotalRecordCount(OrdersNoticeListTotalCount);

	    notice.setPaginationInfo(paginationInfo);
		
		if (OrdersNoticeListTotalCount > 0) {
			noticeList = ordersMapper.getOrdersNoticeList(notice);
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

	@Override
	public int checkJpPassword(User user) {
		
		return ordersMapper.checkJpPassword(user);
	}

	@Override
	public int updateOrdersCoupon(Coupon coupon) {
		
		return ordersMapper.updateOrdersCoupon(coupon);
	}


}
