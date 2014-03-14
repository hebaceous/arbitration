package cn.anyang.zc.arbitration.service;

import java.util.Collection;
import java.util.List;

import cn.anyang.zc.arbitration.domain.Case;
import cn.anyang.zc.arbitration.model.PageModelNotice123;
import cn.anyang.zc.arbitration.model.ResultModel;

public interface CaseService extends BaseService<Case,String> {

	Case checkCaseId(String id);

	Collection<Case> getCaseByStatus(Integer status);

	Collection<Case> getCaseByStatusAndUID(Integer status, Integer uid);

	Integer countByStatus(Integer status);

	Integer countByStatusAndUID(Integer status, Integer uid);

	List<Integer> getAllYears();

	Integer caseCount(String date, Integer index);

	Integer typeCount(String date, Integer type);

	Integer secretaryCount(String date, Integer uid);

	Integer secretaryCaseCount(Integer uid, Integer status, Integer type, String date);

	Collection<Case> getCaseByStatusAndUID_GT(Integer status, Integer uid);

	Collection<Case> getCaseByUID(Integer uid);

	Collection<Case> getCaseByStatus_LT(Integer status);

	ResultModel getCaseNotice(PageModelNotice123 pageModelNotice123);

}