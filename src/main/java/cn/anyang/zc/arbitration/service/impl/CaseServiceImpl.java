package cn.anyang.zc.arbitration.service.impl;

import java.util.Collection;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.anyang.zc.arbitration.domain.Case;
import cn.anyang.zc.arbitration.mapper.BaseMapper;
import cn.anyang.zc.arbitration.mapper.CaseMapper;
import cn.anyang.zc.arbitration.model.PageModelNotice123;
import cn.anyang.zc.arbitration.model.ResultModel;
import cn.anyang.zc.arbitration.service.CaseService;

@Service
public class CaseServiceImpl extends BaseServiceImpl<Case,String> implements CaseService {

	@Autowired
	private CaseMapper caseMapper;

	@Override
	public BaseMapper<Case,String> getMapper() {
		return this.caseMapper;
	}

	@Override
	public Case checkCaseId(String id) {
		return this.caseMapper.checkCaseId(id);
	}

	@Override
	public Collection<Case> getCaseByStatus(Integer status) {
		return this.caseMapper.getCaseByStatus(status);
	}

	@Override
	public Collection<Case> getCaseByStatusAndUID(Integer status, Integer uid) {
		return this.caseMapper.getCaseByStatusAndUID(status, uid);
	}

	@Override
	public Integer countByStatus(Integer status) {
		return this.caseMapper.countByStatus(status);
	}

	@Override
	public Integer countByStatusAndUID(Integer status, Integer uid) {
		return this.caseMapper.countByStatusAndUID(status, uid);
	}

	@Override
	public List<Integer> getAllYears() {
		return this.caseMapper.getAllYears();
	}

	@Override
	public Integer caseCount(String date, Integer index) {
		return this.caseMapper.caseCount(date, index);
	}

	@Override
	public Integer typeCount(String date, Integer type) {
		return this.caseMapper.caseType(date, type);
	}

	@Override
	public Integer secretaryCount(String date, Integer uid) {
		return this.caseMapper.caseSecretary(date, uid);
	}

	@Override
	public Integer secretaryCaseCount(Integer uid, Integer status, Integer type, String date) {
		return this.caseMapper.secretaryCaseCount(uid, status, type, date);
	}

	@Override
	public Collection<Case> getCaseByStatusAndUID_GT(Integer status, Integer uid) {
		return this.caseMapper.getCaseByStatusAndUID_GT(status, uid);
	}

	@Override
	public Collection<Case> getCaseByUID(Integer uid) {
		return this.caseMapper.getCaseByUID(uid);
	}

	@Override
	public Collection<Case> getCaseByStatus_LT(Integer status) {
		return this.caseMapper.getCaseByStatus_LT(status);
	}

	@Override
	public ResultModel getCaseNotice(PageModelNotice123 pageModel) {
		if(pageModel.getOrderField() != null){
			if(pageModel.getOrderField().trim().equals("")){
				pageModel.setOrderField(null);
			}
		}
		Collection<Case> list = this.caseMapper.getCaseNotice(pageModel);
		ResultModel resultModel = new ResultModel();
		resultModel.setList(list);
		resultModel.setTotalCount(this.caseMapper.getCaseNoticeCount(pageModel));
		resultModel.setPageNum(pageModel.getPageNum());
		resultModel.setNumPerPage(pageModel.getNumPerPage());
		return resultModel;
	}

}