package com.huat.bs.bean;

import java.io.Serializable;
import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;
@SuppressWarnings("all")
public class Feedback implements Serializable{
	private String fid;

	private String userid;// 用户ID
	private User user;
	private String userphone;// 联系方式

	private Date createtime;// 创建时间
	
	private String substance;// 反馈信息
	//这个评价对应的用户
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getFid() {
		return fid;
	}

	public void setFid(String fid) {
		this.fid = fid == null ? null : fid.trim();
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid == null ? null : userid.trim();
	}

	public String getUserphone() {
		return userphone;
	}

	public void setUserphone(String userphone) {
		this.userphone = userphone == null ? null : userphone.trim();
	}
	@JsonFormat(pattern="yyyy-MM-dd HH:mm:ss",timezone = "GMT+8") 
	public Date getCreatetime() {
		return createtime;
	}

	public void setCreatetime(Date createtime) {
		this.createtime = createtime;
	}

	public String getSubstance() {
		return substance;
	}

	public void setSubstance(String substance) {
		this.substance = substance == null ? null : substance.trim();
	}

	@Override
	public String toString() {
		return "Feedback [fid=" + fid + ", userid=" + userid + ", userphone=" + userphone + ", createtime=" + createtime
				+ ", substance=" + substance + "]";
	}

}