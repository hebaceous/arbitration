package cn.anyang.zc.arbitration.service;

import java.util.Collection;

import cn.anyang.zc.arbitration.domain.Arbitrator;

public interface ArbitratorService extends BaseService<Arbitrator,String> {

	Collection<Arbitrator> getArbitratorBySecretary(String secretary);

}