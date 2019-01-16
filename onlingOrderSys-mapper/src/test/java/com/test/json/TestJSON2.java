//创建时间:2018年5月18日下午10:48:03
//用户:lihonghui
package com.test.json;

import java.util.ArrayList;
import java.util.List;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.TypeReference;
@SuppressWarnings("all")
public class TestJSON2 {
	public static void main(String[] args) {
			Result<Course> r=new Result<Course>();
			r.setMsg("msg123");
			List<Course> courseList=new ArrayList<Course>();
			courseList.add(new Course("张三", "123"));
			courseList.add(new Course("李四", "123"));
			 r.setModule(courseList);
			 

	}
}
