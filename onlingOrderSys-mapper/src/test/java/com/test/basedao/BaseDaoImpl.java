//创建时间:2018年5月19日上午11:39:09
//用户:lihonghui
package com.test.basedao;

import java.io.Serializable;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
@SuppressWarnings("all")
public class BaseDaoImpl<T> implements BaseDao<T> {
	private Class clazz = null;

	public BaseDaoImpl(Class clazz) {
		ParameterizedType ptClass = (ParameterizedType) this.getClass().getGenericSuperclass();
		clazz = (Class) ptClass.getActualTypeArguments()[0];

	}

	public void save(T t) {
		// TODO Auto-generated method stub
		System.out.println("对象："+clazz);

	}

	public void delete(T t) {
		// TODO Auto-generated method stub

	}

	public void delete(Serializable id) {
		// TODO Auto-generated method stub

	}

	public Integer getTotalCount() {
		// TODO Auto-generated method stub
		return null;
	}

}
