package cn.anyang.zc.arbitration.service.impl;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.anyang.zc.arbitration.domain.ArbitratorDetail;
import cn.anyang.zc.arbitration.mapper.ArbitratorDetailMapper;
import cn.anyang.zc.arbitration.mapper.BaseMapper;
import cn.anyang.zc.arbitration.service.ArbitratorDetailService;

@Service
public class ArbitratorDetailServiceImpl extends BaseServiceImpl<ArbitratorDetail, String> implements ArbitratorDetailService {

	@Autowired
	private ArbitratorDetailMapper arbitratorDetailMapper;

	@Override
	public BaseMapper<ArbitratorDetail, String> getMapper() {
		return this.arbitratorDetailMapper;
	}

	@Override
	public Collection<ArbitratorDetail> getByCID(String idkey) {
		return this.arbitratorDetailMapper.getByCID("'"+idkey+"%'");
	}

}
