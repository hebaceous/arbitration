package cn.anyang.zc.arbitration.service.impl;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.anyang.zc.arbitration.domain.Arbitrator;
import cn.anyang.zc.arbitration.mapper.ArbitratorMapper;
import cn.anyang.zc.arbitration.mapper.BaseMapper;
import cn.anyang.zc.arbitration.service.ArbitratorService;

@Service
public class ArbitratorServiceImpl extends BaseServiceImpl<Arbitrator,String> implements ArbitratorService {

	@Autowired
	private ArbitratorMapper arbitratorMapper;

	@Override
	public BaseMapper<Arbitrator, String> getMapper() {
		return this.arbitratorMapper;
	}

	@Override
	public Collection<Arbitrator> getArbitratorBySecretary(String secretary) {
		return this.arbitratorMapper.getArbitratorBySecretary(secretary);
	}

}