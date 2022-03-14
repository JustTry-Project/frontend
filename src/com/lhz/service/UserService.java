package com.lhz.service;

import java.util.List;
import java.util.Map;

import com.lhz.pojo.Orders;
import com.lhz.pojo.User;

public interface UserService {
	
	//用户登录
	Map login(String username,String password);
	//用注册
	Boolean register(User user);
	
	//用户支付
	int payFood(Double price,List<String> cids,User user,String wait);
	
	//根据id获取用户信息
	User getUserById(String uid);
	
	boolean checkUser(String username);
	
	//用户充值
	int addAcount(double price,User user);
	
	//用户查询自己的餐号信息
	List<Orders> getCanhao(String uid);
	
	//用户查询自己的历史订单
	List<Orders> getOrders(String uid);
	
	//用户删除订单
	int deleteOrder(String oid);
	
}
