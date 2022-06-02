package com.jinwook.home.service.domain;

import java.sql.Date;
import java.sql.Time;
import java.time.LocalDateTime;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Orders {

	private int storeNo;			//������ȣ		|����(�Ѵ� �뵵 ����)
	private String storeName;		//�����̸�		|����
//	private String userId;			//�������̵�	|����
//	private String grade;			//�������		|����
	private User user;				//����		|����(��Ʈ�� �� �ּ� �޾ƻ�� ����)
	private String buyerName;		//�������̸�	|�ֹ�(�⺻���� ȸ�����̵� �ش��ϴ� �������������)
	private String buyerPhone;		//��������ȭ��ȣ	|�ֹ�(�⺻���� ȸ�����̵� �ش��ϴ� �������������)
	private int orderNo;			//�ֹ���ȣ		|�ֹ�
	private Date orderDate;			//�ֹ���¥		|�ֹ�
	private LocalDateTime pickupTime;		//�Ⱦ��ð�		|�ֹ�
	private String orderReq;		//�ֹ���û		|�ֹ�
 	private String orderStatus;		//�ֹ�����		|�ֹ�
 	private int finalPrice;			//�ǰ����ݾ�	|�ֹ�(ȸ���ֹ��� ����dc,���dc ������)
//	private String prodName;		//��ǰ�̸�		|��ǰ
//	private String prodInfo;		//��ǰ����		|��ǰ
//	private int price;				//��ǰ�ݾ�		|��ǰ
//	private String prodImg;			//��ǰ����		|��ǰ
 	private Product product;		//��ǰ		|��ǰ(��Ʈ�� �� �ּ� �޾ƻ�� ����)
	private int prodCount;			//��ǰ����		|��ٱ���
	private int orderPrice;			//�ֹ��ݾ�		|��ٱ���
//	private int couponNo;			//������ȣ		|����
//	private String couponType;		//����Ÿ��		|����
//	private int couponDc;			//�������αݾ�	|����
	private Coupon coupon;
	private String reviewTitle;		//��������		|�ֹ�����
	private String reviewContent;	//���䳻��		|�ֹ�����
	private Date reviewDate;		//���䳯¥		|�ֹ�����
	private int reviewStar;			//����		|�ֹ�����
	private String reviewImg1;		//������� 1	|�ֹ�����
	private String reviewImg2;		//������� 2	|�ֹ�����
	private String reviewImg3;		//������� 3	|�ֹ�����
	
	public Orders() {
		// TODO Auto-generated constructor stub
	}

}