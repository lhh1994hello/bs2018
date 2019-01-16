package com.huat.bs.bean;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonFormat;
@SuppressWarnings("all")
public class User implements Serializable{
	private String verifCode;// 登录时保存验证码

	private String uId;

	private String uLoginid;

	private String uNickname;

	private String uPassword;
	private String uRePassword;
	private String uEmail;

	private String uSex;

	private String uActivaecode;

	private Integer uState;

	private Date uRegisttime;

	private Date uLogintime;

	private String uPhone;

	private Integer uScore;

	private Double uBalance;

	private String uSafequest;

	private String uSafeanswer;

	private String uAddress;

	private Date firstordertime;

	private Integer buycount;

	private String image;

	private String introduce;
	private long activeTime;//邮箱激活时有效时间
	private List<Collects> collectsList;//用户收藏列表
	@Override
	public String toString() {
		return "User [verifCode=" + verifCode + ", uId=" + uId + ", uLoginid=" + uLoginid + ", uNickname=" + uNickname
				+ ", uPassword=" + uPassword + ", uRePassword=" + uRePassword + ", uEmail=" + uEmail + ", uSex=" + uSex
				+ ", uActivaecode=" + uActivaecode + ", uState=" + uState + ", uRegisttime=" + uRegisttime
				+ ", uLogintime=" + uLogintime + ", uPhone=" + uPhone + ", uScore=" + uScore + ", uBalance=" + uBalance
				+ ", uSafequest=" + uSafequest + ", uSafeanswer=" + uSafeanswer + ", uAddress=" + uAddress
				+ ", firstordertime=" + firstordertime + ", buycount=" + buycount + ", image=" + image + ", introduce="
				+ introduce + "]";
	}
	
	public long getActiveTime() {
		return activeTime;
	}

	public void setActiveTime(long activeTime) {
		this.activeTime = activeTime;
	}

	public List<Collects> getCollectsList() {
		return collectsList;
	}

	public void setCollectsList(List<Collects> collectsList) {
		this.collectsList = collectsList;
	}

	public String getVerifCode() {
		return verifCode;
	}

	public void setVerifCode(String verifCode) {
		this.verifCode = verifCode;
	}

	public String getuRePassword() {
		return uRePassword;
	}

	public void setuRePassword(String uRePassword) {
		this.uRePassword = uRePassword;
	}

	public String getuId() {
		return uId;
	}

	public void setuId(String uId) {
		this.uId = uId == null ? null : uId.trim();
	}

	public String getuLoginid() {
		return uLoginid;
	}

	public void setuLoginid(String uLoginid) {
		this.uLoginid = uLoginid == null ? null : uLoginid.trim();
	}

	public String getuNickname() {
		return uNickname;
	}

	public void setuNickname(String uNickname) {
		this.uNickname = uNickname == null ? null : uNickname.trim();
	}

	public String getuPassword() {
		return uPassword;
	}

	public void setuPassword(String uPassword) {
		this.uPassword = uPassword == null ? null : uPassword.trim();
	}

	public String getuEmail() {
		return uEmail;
	}

	public void setuEmail(String uEmail) {
		this.uEmail = uEmail == null ? null : uEmail.trim();
	}

	public String getuSex() {
		return uSex;
	}

	public void setuSex(String uSex) {
		this.uSex = uSex == null ? null : uSex.trim();
	}

	public String getuActivaecode() {
		return uActivaecode;
	}

	public void setuActivaecode(String uActivaecode) {
		this.uActivaecode = uActivaecode == null ? null : uActivaecode.trim();
	}

	public Integer getuState() {
		return uState;
	}

	public void setuState(Integer uState) {
		this.uState = uState;
	}

	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
	public Date getuRegisttime() {
		return uRegisttime;
	}

	public void setuRegisttime(Date uRegisttime) {
		this.uRegisttime = uRegisttime;
	}

	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
	public Date getuLogintime() {
		return uLogintime;
	}

	public void setuLogintime(Date uLogintime) {
		this.uLogintime = uLogintime;
	}

	public String getuPhone() {
		return uPhone;
	}

	public void setuPhone(String uPhone) {
		this.uPhone = uPhone == null ? null : uPhone.trim();
	}

	public Integer getuScore() {
		return uScore;
	}

	public void setuScore(Integer uScore) {
		this.uScore = uScore;
	}

	public Double getuBalance() {
		return uBalance;
	}

	public void setuBalance(Double uBalance) {
		this.uBalance = uBalance;
	}

	public String getuSafequest() {
		return uSafequest;
	}

	public void setuSafequest(String uSafequest) {
		this.uSafequest = uSafequest == null ? null : uSafequest.trim();
	}

	public String getuSafeanswer() {
		return uSafeanswer;
	}

	public void setuSafeanswer(String uSafeanswer) {
		this.uSafeanswer = uSafeanswer == null ? null : uSafeanswer.trim();
	}

	public String getuAddress() {
		return uAddress;
	}

	public void setuAddress(String uAddress) {
		this.uAddress = uAddress == null ? null : uAddress.trim();
	}

	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
	public Date getFirstordertime() {
		return firstordertime;
	}

	public void setFirstordertime(Date firstordertime) {
		this.firstordertime = firstordertime;
	}

	public Integer getBuycount() {
		return buycount;
	}

	public void setBuycount(Integer buycount) {
		this.buycount = buycount;
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
}