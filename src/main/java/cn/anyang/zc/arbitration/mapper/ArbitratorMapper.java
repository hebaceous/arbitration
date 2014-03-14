package cn.anyang.zc.arbitration.mapper;

import java.util.Collection;

import org.apache.ibatis.annotations.Param;

import cn.anyang.zc.arbitration.domain.Arbitrator;

public interface ArbitratorMapper extends BaseMapper<Arbitrator,String> {

	Collection<Arbitrator> getArbitratorBySecretary(@Param("secretary") String secretary);

}