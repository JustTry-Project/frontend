package com.lhz.dao;


import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.lhz.pojo.User;

public interface UserDao {
	
	//根据用户名查询用户信息
	User getUserByName(String username);
	
	//查询所有用户信息
	List<User> getUsers(@Param("indexRow") Integer indexRow,@Param("pageSize") Integer pageSize,@Param("nike")String nike);
	
	//查询模糊查询信息
	Long getUserCount(String nike);
	
	//根据用户名ID查询用户信息
	User getUserById(String uid);
	
	//添加用户
	int addUser(User user);
	
	//更改用户账户信息
	int updateUser(User user);
	
	//根据id删除用户信息
	int deleteUser(String uid);
}
