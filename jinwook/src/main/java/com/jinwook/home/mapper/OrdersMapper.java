package com.jinwook.home.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.jinwook.home.common.Criteria;
import com.jinwook.home.service.domain.Cart;
import com.jinwook.home.service.domain.Jpay;
import com.jinwook.home.service.domain.Notice;
import com.jinwook.home.service.domain.Orders;
import com.jinwook.home.service.domain.Store;
import com.jinwook.home.service.domain.User;

@Mapper
public interface OrdersMapper {

   public int addOrders(Orders orders);          //주문
   
   public List<Orders> getOrdersList(String userId);    //주문내역
   
   public List<Orders> getOrders(int orderNo);      //주문내역상세
   
   public int deleteOrders(int orderNo);         //주문내역삭제
   
   public int updateOrders(Orders orders);         //주문내역(수락,거절,픽업완료)
   
   public int getOrdersTotalCount();            //주문목록 개수
   
   public int addOrdersCart(Cart cart);         //장바구니 담기
      
   public int updateOrdersCart(Cart cart);         //장바구니 수정
      
   public int deleteOrdersCartAfter(Cart cart);      //장바구니   삭제(status변경)
   
   public int deleteOrdersCart(int cartNo);         //장바구니 목록삭제
   
   public int deleteOrdersCartAll(boolean cartStatus);      //장바구니 목록전부삭제
   
   public List<Cart> getOrdersCartList(Cart cart);   //장바구니 목록

   public int getCartTotalCount();               //장바구니 품목개수
   
   public int addOrdersJpayPassword(User user);   //진욱페이 비밀번호 등록
   
   public int updateOrdersJpayPassword(User user); //진욱페이 비밀번호 수정
   
   public int addOrdersJpayCharge(Jpay jpay);      //진욱페이 충전
   
   public int addOrdersjBCharge(Object object);   //진욱페이 잔액 
   
   public List<Jpay> getOrdersJpaylist(String userId);         //진욱페이 내역
   
   public int getOrdersJpaylistTotalCount();      //진욱페이 내역카운트
   
   public int addOrdersNotice(Notice notice);      //알림등록
   
   public int deleteOrdersNotice(int notiNo);      //알림삭제
   
   public List<Notice>getOrdersNoticelist(String receiveId);    //알림목록

   public int getOrdersNoticelistTotalCount();      //알림목록개수
   
   public int updateOrdersCeoJb(Jpay jpay);      //사장님 jb증가
   
   public int updateOrdersCeoEarn(Store store);   //사장님 매출액 증가
}
 