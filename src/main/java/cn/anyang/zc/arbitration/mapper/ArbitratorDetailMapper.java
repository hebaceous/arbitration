package cn.anyang.zc.arbitration.mapper;

import java.util.Collection;

import org.apache.ibatis.annotations.Param;

import cn.anyang.zc.arbitration.domain.ArbitratorDetail;

public interface ArbitratorDetailMapper extends BaseMapper<ArbitratorDetail, String> {

	Collection<ArbitratorDetail> getByCID (@Param("idkey") String idkey);

}