package cn.anyang.zc.arbitration.model;

import java.util.Collection;

public class ResultModel {
	private Collection<?> list;
	private Integer pageNum;
	private Integer numPerPage;
	private Integer totalCount;

	public Collection<?> getList() {
		return list;
	}
	public void setList(Collection<?> list) {
		this.list = list;
	}
	public Integer getPageNum() {
		return pageNum;
	}
	public void setPageNum(Integer pageNum) {
		this.pageNum = pageNum;
	}
	public Integer getNumPerPage() {
		return numPerPage;
	}
	public void setNumPerPage(Integer numPerPage) {
		this.numPerPage = numPerPage;
	}
	public Integer getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(Integer totalCount) {
		this.totalCount = totalCount;
	}
}