//创建时间:2018年5月18日下午10:45:46
//用户:lihonghui
package com.test.json;

import java.util.List;

public class Result<T> {

    private String msg;
    
    private List<T> module;

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public List<T> getModule() {
        return module;
    }

    public void setModule(List<T> module) {
        this.module = module;
    }
    
    
}