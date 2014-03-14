package cn.anyang.zc.arbitration.mapper;

import java.util.Collection;

import org.apache.ibatis.annotations.Param;

import cn.anyang.zc.arbitration.model.PageModel;

public interface BaseMapper<T,K> {

	void insert(T t);

	void delete(@Param("id") K id);

	void update(T t);

	T get(@Param("id") K id);

	Collection<T> getAll();

	Collection<T> search(PageModel pageModel);

	Integer count(PageModel pageModel);

}