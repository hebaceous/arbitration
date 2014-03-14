package cn.anyang.zc.arbitration.service;

import java.util.Collection;

import cn.anyang.zc.arbitration.model.PageModel;
import cn.anyang.zc.arbitration.model.ResultModel;

public interface BaseService<T,K> {

	void insert(T t);

	void delete(K id);

	void update(T t);

	T get(K id);

	Collection<T> getAll();

	ResultModel search(PageModel pageModel);

	Integer count(PageModel pageModel);

}