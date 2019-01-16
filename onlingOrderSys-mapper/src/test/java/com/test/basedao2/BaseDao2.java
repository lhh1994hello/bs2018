//创建时间:2018年5月19日下午1:18:17
//用户:lihonghui
package com.test.basedao2;

import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
@SuppressWarnings("all")
public class BaseDao2<T> {
	private Class clazz=null;
	public BaseDao2() {
		super();
		// TODO Auto-generated constructor stub
	}

	public void show() {
		ParameterizedType ptClass = (ParameterizedType) this.getClass().getGenericSuperclass();
		clazz = (Class) ptClass.getActualTypeArguments()[0];
		System.out.println("Class对象:"+clazz);
	}

}
