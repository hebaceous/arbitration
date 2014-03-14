package cn.anyang.zc.arbitration.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.anyang.zc.arbitration.domain.User;
import cn.anyang.zc.arbitration.mapper.BaseMapper;
import cn.anyang.zc.arbitration.mapper.UserMapper;
import cn.anyang.zc.arbitration.service.UserService;

@Service
public class UserServiceImpl extends BaseServiceImpl<User,Integer> implements UserService {

	@Autowired
	private UserMapper userMapper;

	@Override
	public BaseMapper<User,Integer> getMapper() {
		return this.userMapper;
	}

	@Override
	public User login(String username, String password) {
		return this.userMapper.login(username ,password);
	}

	@Override
	public User checkUsername(String username) {
		return this.userMapper.checkUsername(username);
	}

	@Override
	public List<User> getUsersByRID(Integer rid) {
		return this.userMapper.getUsersByRID(rid);
	}

}