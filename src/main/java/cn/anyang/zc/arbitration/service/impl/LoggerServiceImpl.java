package cn.anyang.zc.arbitration.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.anyang.zc.arbitration.domain.Logger;
import cn.anyang.zc.arbitration.mapper.BaseMapper;
import cn.anyang.zc.arbitration.mapper.LoggerMapper;
import cn.anyang.zc.arbitration.service.LoggerService;

@Service
public class LoggerServiceImpl extends BaseServiceImpl<Logger, Long> implements LoggerService {

	@Autowired
	private LoggerMapper loggerMapper;

	@Override
	public BaseMapper<Logger, Long> getMapper() {
		return this.loggerMapper;
	}

}
