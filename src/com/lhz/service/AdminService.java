package com.lhz.service;

import java.util.List;
import java.util.Map;

import com.lhz.pojo.Food;
import com.lhz.pojo.User;
import com.lhz.utils.Pages;

public interface AdminService {
	
	//管理员登录
	boolean login(String admin,String password);
	
	//获取所有用户信息
	Pages<User> getUsers(Map map);
	
	//根据id删除用户
	int deleteUser(String uid);
	
	//更新用户基本信息
	int updateUserBase(Map map);
	
	//获取所有用户信息
	Pages<Food> getFoods(Map map);
	
	//根据id删除食品信息
	int deleteFood(String fid);
}
