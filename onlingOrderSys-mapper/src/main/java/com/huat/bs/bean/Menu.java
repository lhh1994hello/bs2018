package com.huat.bs.bean;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonFormat;
@SuppressWarnings("all")
public class Menu implements Serializable {
	private String mid;

	private String mname;

	private BigDecimal price;

	private Integer salecount;

	private Integer mcId;
	private Category category;

	private String image;

	private String introduce;

	private Integer mstate;

	private Date createtime;

	private Integer ratestar;
	//private Evaluation evaluation;
	private List<Evaluation> evaluationList;
	@Override
	public String toString() {
		return "Menu [mid=" + mid + ", mname=" + mname + ", price=" + price + ", salecount=" + salecount + ", mcId="
				+ mcId + ", category=" + category + ", image=" + image + ", introduce=" + introduce + ", mstate="
				+ mstate + ", createtime=" + createtime + ", ratestar=" + ratestar + "]";
	}
	
	
	public List<Evaluation> getEvaluationList() {
		return evaluationList;
	}

	public void setEvaluationList(List<Evaluation> evaluationList) {
		this.evaluationList = evaluationList;
	}


	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	public String getMid() {
		return mid;
	}

	public void setMid(String mid) {
		this.mid = mid == null ? null : mid.trim();
	}

	public String getMname() {
		return mname;
	}

	public void setMname(String mname) {
		this.mname = mname == null ? null : mname.trim();
	}

	public BigDecimal getPrice() {
		return price;
	}

	public void setPrice(BigDecimal price) {
		this.price = price;
	}

	public Integer getSalecount() {
		return salecount;
	}

	public void setSalecount(Integer salecount) {
		this.salecount = salecount;
	}

	public Integer getMcId() {
		return mcId;
	}

	public void setMcId(Integer mcId) {
		this.mcId = mcId;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image == null ? null : image.trim();
	}

	public String getIntroduce() {
		return introduce;
	}

	public void setIntroduce(String introduce) {
		this.introduce = introduce == null ? null : introduce.trim();
	}

	public Integer getMstate() {
		return mstate;
	}

	public void setMstate(Integer mstate) {
		this.mstate = mstate;
	}

	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
	public Date getCreatetime() {
		return createtime;
	}

	public void setCreatetime(Date createtime) {
		this.createtime = createtime;
	}

	public Integer getRatestar() {
		return ratestar;
	}

	public void setRatestar(Integer ratestar) {
		this.ratestar = ratestar;
	}
}