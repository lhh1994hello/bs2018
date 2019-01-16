package com.huat.bs.bean;

import java.io.Serializable;
import java.util.Date;
@SuppressWarnings("all")
public class AdminUser implements Serializable {
	private String verifCode;
    private String aid;

    private String loginid;

    private String password;

    private String email;

    private String username;

    private Integer states;

    private Date ceatetime;

    private Date lastlogintime;

    private String mobiles;

    private String authority;
    
    public String getVerifCode() {
		return verifCode;
	}

	public void setVerifCode(String verifCode) {
		this.verifCode = verifCode;
	}

	public String getAid() {
        return aid;
    }

    public void setAid(String aid) {
        this.aid = aid == null ? null : aid.trim();
    }

    public String getLoginid() {
        return loginid;
    }

    public void setLoginid(String loginid) {
        this.loginid = loginid == null ? null : loginid.trim();
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email == null ? null : email.trim();
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username == null ? null : username.trim();
    }

    public Integer getStates() {
        return states;
    }

    public void setStates(Integer states) {
        this.states = states;
    }

    public Date getCeatetime() {
        return ceatetime;
    }

    public void setCeatetime(Date ceatetime) {
        this.ceatetime = ceatetime;
    }

    public Date getLastlogintime() {
        return lastlogintime;
    }

    public void setLastlogintime(Date lastlogintime) {
        this.lastlogintime = lastlogintime;
    }

    public String getMobiles() {
        return mobiles;
    }

    public void setMobiles(String mobiles) {
        this.mobiles = mobiles == null ? null : mobiles.trim();
    }

    public String getAuthority() {
        return authority;
    }

    public void setAuthority(String authority) {
        this.authority = authority == null ? null : authority.trim();
    }

	@Override
	public String toString() {
		return "AdminUser [verifCode=" + verifCode + ", aid=" + aid + ", loginid=" + loginid + ", password=" + password
				+ ", email=" + email + ", username=" + username + ", states=" + states + ", ceatetime=" + ceatetime
				+ ", lastlogintime=" + lastlogintime + ", mobiles=" + mobiles + ", authority=" + authority + "]";
	}
    
}