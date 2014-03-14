package cn.anyang.zc.arbitration.service.impl;

import java.util.Collection;

import org.springframework.transaction.annotation.Transactional;

import cn.anyang.zc.arbitration.mapper.BaseMapper;
import cn.anyang.zc.arbitration.model.PageModel;
import cn.anyang.zc.arbitration.model.ResultModel;
import cn.anyang.zc.arbitration.service.BaseService;

public abstract class BaseServiceImpl<T,K> implements BaseService<T,K> {

	public abstract BaseMapper<T,K> getMapper();

	@Override
	@Transactional
	public void insert(T t) {
		this.getMapper().insert(t);
	}

	@Override
	@Transactional
	public void delete(K id) {
		this.getMapper().delete(id);
	}

	@Override
	@Transactional
	public void update(T t) {
		this.getMapper().update(t);
	}

	@Override
	public T get(K id) {
		return this.getMapper().get(id);
	}

	@Override
	public Collection<T> getAll() {
		return this.getMapper().getAll();
	}

	@Override
	public ResultModel search(PageModel pageModel) {
		if(pageModel.getKeyword() != null){
			if(pageModel.getKeyword().trim().equals("")){
				pageModel.setKeyword(null);
			} else {
				pageModel.setKeyword("%" + pageModel.getKeyword() + "%");
			}
		}
		if(pageModel.getOrderField() != null){
			if(pageModel.getOrderField().trim().equals("")){
				pageModel.setOrderField(null);
			}
		}
		Collection<T> list = this.getMapper().search(pageModel);
		ResultModel resultModel = new ResultModel();
		resultModel.setList(list);
		resultModel.setTotalCount(this.count(pageModel));
		resultModel.setPageNum(pageModel.getPageNum());
		resultModel.setNumPerPage(pageModel.getNumPerPage());
		return resultModel;
	}

	@Override
	public Integer count(PageModel pageModel) {
		return this.getMapper().count(pageModel);
	}

}