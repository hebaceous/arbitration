package cn.anyang.zc.arbitration.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.anyang.zc.arbitration.domain.User;

public interface UserMapper extends BaseMapper<User,Integer> {

	User login(@Param("username") String username, @Param("password") String password);

	User checkUsername(@Param("username") String username);

	List<User> getUsersByRID(@Param("rid") Integer rid);

}