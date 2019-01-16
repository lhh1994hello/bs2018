package com.huat.bs.bean;

import java.io.Serializable;
import java.util.Date;
@SuppressWarnings("all")
public class Orderitem implements Serializable{
	private String oiid;

	private Integer count;

	private double subtotal;

	private String oid;
	private Orders order;// 订单项属于哪个订单

	private String mid;
	private Menu menu;// 订单项所包含的菜品

	private Date createtime;

	private Integer state;

	private String info;

	public Orders getOrder() {
		return order;
	}

	public void setOrder(Orders order) {
		this.order = order;
	}

	public Menu getMenu() {
		return menu;
	}

	public void setMenu(Menu menu) {
		this.menu = menu;
	}

	public String getOiid() {
		return oiid;
	}

	public void setOiid(String oiid) {
		this.oiid = oiid == null ? null : oiid.trim();
	}

	public Integer getCount() {
		return count;
	}

	public void setCount(Integer count) {
		this.count = count;
	}

	public double getSubtotal() {
		return subtotal;
	}

	public void setSubtotal(double subtotal) {
		this.subtotal = subtotal;
	}

	public String getOid() {
		return oid;
	}

	public void setOid(String oid) {
		this.oid = oid == null ? null : oid.trim();
	}

	public String getMid() {
		return mid;
	}

	public void setMid(String mid) {
		this.mid = mid == null ? null : mid.trim();
	}

	public Date getCreatetime() {
		return createtime;
	}

	public void setCreatetime(Date createtime) {
		this.createtime = createtime;
	}

	public Integer getState() {
		return state;
	}

	public void setState(Integer state) {
		this.state = state;
	}

	public String getInfo() {
		return info;
	}

	public void setInfo(String info) {
		this.info = info == null ? null : info.trim();
	}
}