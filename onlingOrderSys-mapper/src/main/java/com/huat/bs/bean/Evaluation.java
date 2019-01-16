package com.huat.bs.bean;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class Evaluation {
	private String eid;

	private String title;

	private String contexts;

	private Date createtime;

	private String uid;

	private String mid;

	private Integer estate;

	private Integer startnum;
	private User user;

	@Override
	public String toString() {
		return "Evaluation [eid=" + eid + ", title=" + title + ", contexts=" + contexts + ", createtime=" + createtime
				+ ", uid=" + uid + ", mid=" + mid + ", estate=" + estate + ", startnum=" + startnum + ", user=" + user
				+ "]";
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getEid() {
		return eid;
	}

	public void setEid(String eid) {
		this.eid = eid == null ? null : eid.trim();
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title == null ? null : title.trim();
	}

	public String getContexts() {
		return contexts;
	}

	public void setContexts(String contexts) {
		this.contexts = contexts == null ? null : contexts.trim();
	}

	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
	public Date getCreatetime() {
		return createtime;
	}

	public void setCreatetime(Date createtime) {
		this.createtime = createtime;
	}

	public String getUid() {
		return uid;
	}

	public void setUid(String uid) {
		this.uid = uid == null ? null : uid.trim();
	}

	public String getMid() {
		return mid;
	}

	public void setMid(String mid) {
		this.mid = mid == null ? null : mid.trim();
	}

	public Integer getEstate() {
		return estate;
	}

	public void setEstate(Integer estate) {
		this.estate = estate;
	}

	public Integer getStartnum() {
		return startnum;
	}

	public void setStartnum(Integer startnum) {
		this.startnum = startnum;
	}
}