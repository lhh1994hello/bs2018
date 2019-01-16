//创建时间:2018年5月18日下午10:46:20
//用户:lihonghui
package com.test.json;

public class Course {
	private String name;
	private String cid;

	public Course() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Course(String name, String cid) {
		super();
		this.name = name;
		this.cid = cid;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getCid() {
		return cid;
	}

	public void setCid(String cid) {
		this.cid = cid;
	}

	@Override
	public String toString() {
		return "Course [name=" + name + ", cid=" + cid + "]";
	}

}
