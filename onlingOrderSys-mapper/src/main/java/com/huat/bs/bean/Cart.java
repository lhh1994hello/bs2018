//创建时间：2018年4月9日,上午9:23:34
package com.huat.bs.bean;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Collection;
import java.util.LinkedHashMap;
import java.util.Map;

/*
 * 购物车，里面放的是购物条目
 */
@SuppressWarnings("all")
public class Cart implements Serializable {
	private Map<String, CartItem> map = new LinkedHashMap<String, CartItem>();

	// 购物车价格总计
	public double getTotal() {
		BigDecimal total = new BigDecimal("0");
		for (CartItem cartItem : map.values()) {
			BigDecimal subtotal = new BigDecimal("" + cartItem.getSubtotal());
			total = total.add(subtotal);
		}
		//System.out.println("购物车总计：" + total.doubleValue());
		return total.doubleValue();
	}

	// 添加购物车
	public void add(CartItem cartItem) {
		if (map.containsKey(cartItem.getMenu().getMid())) {
			CartItem oldItem = map.get(cartItem.getMenu().getMid());
			oldItem.setCount(oldItem.getCount() + cartItem.getCount());
			map.put(cartItem.getMenu().getMid(), oldItem);
		} else {
			map.put(cartItem.getMenu().getMid(), cartItem);
		}
	}

	// 清空购物车
	public void clear() {
		map.clear();
	}

	// 删除条目，先判断数量，如果数量大于1，数量减一，等于1，就删除
	public void delete(String mid) {
		CartItem cartItem = map.get(mid);
		if(cartItem==null)
			return ;
		if (cartItem.getCount() > 1) {
			cartItem.setCount(cartItem.getCount() - 1);
			map.put(mid, cartItem);
		} else {
			map.remove(mid);
		}

	}

	// 获得所有条目
	public Collection<CartItem> getCartItems() {
		return map.values();
	}

	@Override
	public String toString() {
		return "Cart [map=" + map + "]";
	}

}
