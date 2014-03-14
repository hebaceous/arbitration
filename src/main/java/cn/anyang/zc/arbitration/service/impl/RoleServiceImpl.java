package cn.anyang.zc.arbitration.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.anyang.zc.arbitration.domain.Role;
import cn.anyang.zc.arbitration.mapper.BaseMapper;
import cn.anyang.zc.arbitration.mapper.RoleMapper;
import cn.anyang.zc.arbitration.service.RoleService;

@Service
public class RoleServiceImpl extends BaseServiceImpl<Role,Integer> implements RoleService {

	@Autowired
	private RoleMapper roleMapper;

	@Override
	public BaseMapper<Role,Integer> getMapper() {
		return this.roleMapper;
	}

}
