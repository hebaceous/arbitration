package cn.anyang.zc.arbitration.service.impl;

import java.util.Collection;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.anyang.zc.arbitration.domain.Applicant;
import cn.anyang.zc.arbitration.mapper.ApplicantMapper;
import cn.anyang.zc.arbitration.mapper.BaseMapper;
import cn.anyang.zc.arbitration.service.ApplicantService;

@Service
public class ApplicantServiceImpl extends BaseServiceImpl<Applicant,Integer> implements ApplicantService {

	@Autowired
	private ApplicantMapper applicantMapper;

	@Override
	public BaseMapper<Applicant,Integer> getMapper() {
		return this.applicantMapper;
	}

	@Override
	public Integer getMaxID() {
		return this.applicantMapper.getMaxID();
	}

	@Override
	public Collection<Applicant> getByCid(String cid) {
		return this.applicantMapper.getByCid(cid);
	}

	@Override
	public List<Applicant> getByCidAndIsApplicant(String cid, Boolean isApplicant) {
		return this.applicantMapper.getByCidAndIsApplicant(cid, isApplicant);
	}

}