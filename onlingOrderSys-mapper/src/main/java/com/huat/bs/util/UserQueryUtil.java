package com.huat.bs.util;

import com.huat.bs.bean.User;

/*
 * 多条件组合查�?
 */
@SuppressWarnings("all")
public class UserQueryUtil extends User{
	private String beginTime;
	private String endTime;
	private String stext;

	public String getBeginTime() {
		return beginTime;
	}

	public void setBeginTime(String beginTime) {
		this.beginTime = beginTime;
	}

	public String getEndTime() {
		return endTime;
	}

	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}

	public String getStext() {
		return stext;
	}

	public void setStext(String stext) {
		this.stext = stext;
	}

	@Override
	public String toString() {
		return "QueryUtil [beginTime=" + beginTime + ", endTime=" + endTime + ", stext=" + stext + "]";
	}

}
