//创建时间:2018年4月27日 下午9:40:07 
package com.huat.bs.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.huat.bs.bean.Cart;
import com.huat.bs.bean.CartItem;
import com.huat.bs.bean.Menu;
import com.huat.bs.bean.Msg;
import com.huat.bs.bean.Orders;
import com.huat.bs.bean.User;

@Controller
public class CartController {
	// 添加购物条目
	@RequestMapping(value = "/addCartItem", method = {RequestMethod.POST,RequestMethod.GET})
	@ResponseBody
	public Msg addCartItem(Menu menu, HttpServletRequest request) {
		System.out.println("添加购物条目.." + menu);
		// 如果订单域中存在订单，就清空
		Orders order = (Orders) request.getSession().getAttribute("order");
		// 如果是重新下单，那就先清空之前显示的订单
		if (order != null) {
			request.getSession().setAttribute("order", null);
		}
		Cart cart = (Cart) request.getSession().getAttribute("cart");
		if(cart==null){
			return Msg.fail().add("msg", "购物车异常");
		}
		User user = (User) request.getSession().getAttribute("session_user");
		// 清空
		if (user == null || user.equals("")) {
			// 还没登录
			return Msg.fail().add("msg", "请先登录");
		}
		// 不查数据库了
		CartItem cartItem = new CartItem();
		cartItem.setCount(cartItem.getCount() + 1);
		cartItem.setMenu(menu);
		// 订单条目放到购物车中
		cart.add(cartItem);
		System.out.println("车：" + cart);
		return Msg.Success().add("cart", cart);
	}

	// 对该条目减一
	@RequestMapping(value = "/delete", method ={RequestMethod.POST,RequestMethod.GET})
	@ResponseBody
	public Msg delete(HttpServletRequest request, @RequestParam(name = "mid", defaultValue = "0") String mid) {
		System.out.println("删除购物条目.." + mid);
		Cart cart = (Cart) request.getSession().getAttribute("cart");
		if(cart!=null){
			cart.delete(mid);
			
		}
		return Msg.Success().add("cart", cart);
	}

	// 清空购物车
	@RequestMapping(value = "/clear", method = {RequestMethod.POST,RequestMethod.GET})
	@ResponseBody
	public Msg clear(HttpServletRequest request) {
		System.out.println("清空购物车..");
		Cart cart = (Cart) request.getSession().getAttribute("cart");
		if(cart!=null)
			cart.clear();
		return Msg.Success();
	}

	// 得到购物车中的数据，送到前台
	@RequestMapping(value = "/getCartSession", method = {RequestMethod.POST,RequestMethod.GET})
	@ResponseBody
	public Cart getCartSession(HttpServletRequest request) {
		Cart cart = (Cart) request.getSession().getAttribute("cart");
		return cart;
	}
}
