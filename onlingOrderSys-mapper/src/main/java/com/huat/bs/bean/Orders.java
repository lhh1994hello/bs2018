package com.huat.bs.bean;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonFormat;
@SuppressWarnings("all")
public class Orders implements Serializable{
	private String oid;

	private Date createtime;

	private double totals;

	private String uid;

	private Integer paystate;

	private Integer ostate;

	private String address;

	private String userphone;

	private String deliverpersonid;

	private String purchaser;

	private String notes;
	// 定义一个集合，用来保存该订单所属的所有订单项
	private List<Orderitem> orderItemList;
	// 订单所属的用户
	private User user;

	public String getOid() {
		return oid;
	}

	public void setOid(String oid) {
		this.oid = oid;
	}
	@JsonFormat(pattern="yyyy-MM-dd HH:mm:ss",timezone = "GMT+8") 
	public Date getCreatetime() {
		return createtime;
	}

	public void setCreatetime(Date createtime) {
		this.createtime = createtime;
	}

	public double getTotals() {
		return totals;
	}

	public void setTotals(double totals) {
		this.totals = totals;
	}

	public String getUid() {
		return uid;
	}

	public void setUid(String uid) {
		this.uid = uid;
	}

	public Integer getPaystate() {
		return paystate;
	}

	public void setPaystate(Integer paystate) {
		this.paystate = paystate;
	}

	public Integer getOstate() {
		return ostate;
	}

	public void setOstate(Integer ostate) {
		this.ostate = ostate;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getUserphone() {
		return userphone;
	}

	public void setUserphone(String userphone) {
		this.userphone = userphone;
	}

	public String getDeliverpersonid() {
		return deliverpersonid;
	}

	public void setDeliverpersonid(String deliverpersonid) {
		this.deliverpersonid = deliverpersonid;
	}

	public String getPurchaser() {
		return purchaser;
	}

	public void setPurchaser(String purchaser) {
		this.purchaser = purchaser;
	}

	public String getNotes() {
		return notes;
	}

	public void setNotes(String notes) {
		this.notes = notes;
	}

	public List<Orderitem> getOrderItemList() {
		return orderItemList;
	}

	public void setOrderItemList(List<Orderitem> orderItemList) {
		this.orderItemList = orderItemList;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	@Override
	public String toString() {
		return "Orders [oid=" + oid + ", createtime=" + createtime + ", totals=" + totals + ", uid=" + uid
				+ ", paystate=" + paystate + ", ostate=" + ostate + ", address=" + address + ", userphone=" + userphone
				+ ", purchaser=" + purchaser + ", notes=" + notes + "]";
	}

}