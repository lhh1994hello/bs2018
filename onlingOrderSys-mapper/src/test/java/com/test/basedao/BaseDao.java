//创建时间:2018年5月19日上午11:35:23
//用户:lihonghui
package com.test.basedao;

import java.io.Serializable;

public interface BaseDao<T> {
	void save(T t);

	void delete(T t);

	void delete(Serializable id);

	Integer getTotalCount();
}
