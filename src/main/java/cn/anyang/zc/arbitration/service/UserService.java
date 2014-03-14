package cn.anyang.zc.arbitration.service;

import java.util.List;

import cn.anyang.zc.arbitration.domain.User;

public interface UserService extends BaseService<User,Integer> {

	User login(String username, String password);

	User checkUsername(String username);

	List<User> getUsersByRID(Integer rid);

}