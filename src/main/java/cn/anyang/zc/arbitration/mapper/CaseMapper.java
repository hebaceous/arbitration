package cn.anyang.zc.arbitration.mapper;

import java.util.Collection;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.anyang.zc.arbitration.domain.Case;
import cn.anyang.zc.arbitration.model.PageModelNotice123;

public interface CaseMapper extends BaseMapper<Case,String> {

	// 检查案件id是否唯一
	Case checkCaseId(@Param("id") String id);

	// 根据状态获取案件
	Collection<Case> getCaseByStatus(@Param("status") Integer status);

	// 根据负责人获取案件
	Collection<Case> getCaseByUID(@Param("uid") Integer uid);

	// 根据状态和秘书编号获取案件
	Collection<Case> getCaseByStatusAndUID(@Param("status") Integer status, @Param("uid") Integer uid);

	Integer countByStatus(@Param("status") Integer status);

	Integer countByStatusAndUID(@Param("status") Integer status, @Param("uid") Integer uid);

	// 获取案件中所有的年份集合
	List<Integer> getAllYears();

	// 案件数量统计
	Integer caseCount(@Param("date") String date, @Param("index") Integer index);

	// 案件类型统计
	Integer caseType(@Param("date") String date, @Param("type") Integer type);

	// 人员办案数量统计
	Integer caseSecretary(@Param("date") String date, @Param("uid") Integer uid);

	// 秘书案件统计
	Integer secretaryCaseCount(@Param("uid") Integer uid, @Param("status") Integer status, @Param("type") Integer type, @Param("date") String date);

	Collection<Case> getCaseByStatusAndUID_GT(@Param("status") Integer status, @Param("uid") Integer uid);

	Collection<Case> getCaseByStatus_LT(@Param("status") Integer status);

	// 三次通知书
	Collection<Case> getCaseNotice(PageModelNotice123 model);

	Integer getCaseNoticeCount(PageModelNotice123 model);

}