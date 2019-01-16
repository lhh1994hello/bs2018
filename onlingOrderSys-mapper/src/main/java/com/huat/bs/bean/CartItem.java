//创建时间：2018年4月9日,上午9:11:06
package com.huat.bs.bean;

import java.io.Serializable;
import java.math.BigDecimal;

/*
 * 购物车条目，购物车中的信息不存在数据库了
 */
@SuppressWarnings("all")
public class CartItem implements Serializable {
	// 商品
	private Menu menu;
	// 数量
	private int count;

	// 小计，单价乘以数量

	public double getSubtotal() {
		BigDecimal multiplicand = new BigDecimal(count);
		return menu.getPrice().multiply(multiplicand).doubleValue();
	}

	public Menu getMenu() {
		return menu;
	}

	public void setMenu(Menu menu) {
		this.menu = menu;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	@Override
	public String toString() {
		return "CartItem [menu=" + menu + ", count=" + count + "]";
	}

}
