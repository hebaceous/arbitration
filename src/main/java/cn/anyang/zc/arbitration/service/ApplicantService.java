package cn.anyang.zc.arbitration.service;

import java.util.Collection;
import java.util.List;

import cn.anyang.zc.arbitration.domain.Applicant;

public interface ApplicantService extends BaseService<Applicant,Integer> {

	Integer getMaxID();

	Collection<Applicant> getByCid(String cid);

	List<Applicant> getByCidAndIsApplicant(String cid, Boolean isApplicant);

}