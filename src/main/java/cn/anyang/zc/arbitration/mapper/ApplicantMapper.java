package cn.anyang.zc.arbitration.mapper;

import java.util.Collection;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.anyang.zc.arbitration.domain.Applicant;

public interface ApplicantMapper extends BaseMapper<Applicant,Integer> {

	Integer getMaxID();

	Collection<Applicant> getByCid(@Param("cid") String cid);

	List<Applicant> getByCidAndIsApplicant(@Param("cid") String cid, @Param("isApplicant") Boolean isApplicant);

}