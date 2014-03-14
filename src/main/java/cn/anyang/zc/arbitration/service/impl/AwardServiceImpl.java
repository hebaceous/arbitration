package cn.anyang.zc.arbitration.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.anyang.zc.arbitration.domain.Award;
import cn.anyang.zc.arbitration.mapper.AwardMapper;
import cn.anyang.zc.arbitration.mapper.BaseMapper;
import cn.anyang.zc.arbitration.service.AwardService;

@Service
public class AwardServiceImpl extends BaseServiceImpl<Award, String> implements AwardService {

	@Autowired
	private AwardMapper awardMapper;

	@Override
	public BaseMapper<Award, String> getMapper() {
		return this.awardMapper;
	}

}