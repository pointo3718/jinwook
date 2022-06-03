package com.jinwook.home.service.domain;

import java.sql.Date;
import java.time.LocalDate;
import java.time.LocalDateTime;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Orders {

//	private int storeNo;			//상점번호		|상점(둘다 용도 같음)
//	private String storeName;		//상점이름		|상점
	private Store store;			//상점
//	private String userId;			//유저아이디	|유저
//	private String grade;			//유저등급		|유저
	private User user;				//유저		|유저(세트로 위 주석 받아사용 예정)
	private String buyerName;		//구매자이름	|주문(기본으로 회원아이디에 해당하는 정보담아져있음)
	private String buyerPhone;		//구매자전화번호	|주문(기본으로 회원아이디에 해당하는 정보담아져있음)
	private int orderNo;			//주문번호		|주문
	private Date orderDate;			//주문날짜		|주문
	private int plusTime;			//픽업시간인int	|주문
	private LocalDateTime pickupTime;	//픽업시간형식	|주문
	private String orderReq;		//주문요청		|주문
 	private String orderStatus;		//주문상태		|주문
 	private int finalPrice;			//실결제금액	|주문(회원주문시 쿠폰dc,등급dc 차감액)
//	private String prodName;		//상품이름		|상품
//	private String prodInfo;		//상품설명		|상품
//	private int price;				//상품금액		|상품
//	private String prodImg;			//상품사진		|상품
 	private Product product;		//상품		|상품(세트로 위 주석 받아사용 예정)
	private int prodCount;			//상품수량		|장바구니
	private int orderPrice;			//주문금액		|장바구니
//	private int couponNo;			//쿠폰번호		|쿠폰
//	private String couponType;		//쿠폰타입		|쿠폰
//	private int couponDc;			//쿠폰할인금액	|쿠폰
	private Coupon coupon;
	private String reviewTitle;		//리뷰제목		|주문리뷰
	private String reviewContent;	//리뷰내용		|주문리뷰
	private LocalDate reviewDate;	//리뷰날짜		|주문리뷰
	private int reviewStar;			//별점		|주문리뷰
	private String reviewImg1;		//리뷰사진 1	|주문리뷰
	private String reviewImg2;		//리뷰사진 2	|주문리뷰
	private String reviewImg3;		//리뷰사진 3	|주문리뷰
	
	public Orders() {
		// TODO Auto-generated constructor stub
	}

}