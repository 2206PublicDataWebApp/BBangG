package com.kh.bbang.order.domain;

import java.util.Arrays;

public class OrderProduct {
	private String[] orderProductNm;
	private Integer[] orderProductCtn;
	private Integer[] orderProductPrice;

	public String[] getOrderProductNm() {
		return orderProductNm;
	}

	public void setOrderProductNm(String[] orderProductNm) {
		this.orderProductNm = orderProductNm;
	}

	public Integer[] getOrderProductCtn() {
		return orderProductCtn;
	}

	public void setOrderProductCtn(Integer[] orderProductCtn) {
		this.orderProductCtn = orderProductCtn;
	}

	public Integer[] getOrderProductPrice() {
		return orderProductPrice;
	}

	public void setOrderProductPrice(Integer[] orderProductPrice) {
		this.orderProductPrice = orderProductPrice;
	}

	@Override
	public String toString() {
		return Arrays.toString(orderProductNm) + " " + Arrays.toString(orderProductCtn) + "개 "
				+ Arrays.toString(orderProductPrice) + "원";
	}

}
