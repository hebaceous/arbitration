package cn.anyang.zc.arbitration.service;

import java.util.Collection;

import cn.anyang.zc.arbitration.domain.ArbitratorDetail;

public interface ArbitratorDetailService extends BaseService<ArbitratorDetail,String> {

	Collection<ArbitratorDetail> getByCID (String idkey);

}