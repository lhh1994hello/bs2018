package com.huat.bs.bean;

import java.io.Serializable;
import java.util.Date;
import java.util.List;
@SuppressWarnings("all")
public class Category implements Serializable{
    private Integer cid;

    private String cname;

    private String cinfo;

    private Integer cstate;

    private Date createtime;

    private Integer menucount;
    private List<Menu> meunList;
    
    @Override
	public String toString() {
		return "Category [cid=" + cid + ", cname=" + cname + ", cinfo=" + cinfo + ", cstate=" + cstate + ", createtime="
				+ createtime + ", menucount=" + menucount + ", meunList=" + meunList + "]";
	}

	public List<Menu> getMeunList() {
		return meunList;
	}

	public void setMeunList(List<Menu> meunList) {
		this.meunList = meunList;
	}

	public Integer getCid() {
        return cid;
    }

    public void setCid(Integer cid) {
        this.cid = cid;
    }

    public String getCname() {
        return cname;
    }

    public void setCname(String cname) {
        this.cname = cname == null ? null : cname.trim();
    }

    public String getCinfo() {
        return cinfo;
    }

    public void setCinfo(String cinfo) {
        this.cinfo = cinfo == null ? null : cinfo.trim();
    }

    public Integer getCstate() {
        return cstate;
    }

    public void setCstate(Integer cstate) {
        this.cstate = cstate;
    }

    public Date getCreatetime() {
        return createtime;
    }

    public void setCreatetime(Date createtime) {
        this.createtime = createtime;
    }

    public Integer getMenucount() {
        return menucount;
    }

    public void setMenucount(Integer menucount) {
        this.menucount = menucount;
    }
}