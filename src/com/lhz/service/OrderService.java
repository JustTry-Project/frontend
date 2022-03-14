package com.lhz.service;

import java.util.List;
import java.util.Map;

import com.lhz.pojo.Orders;
import com.lhz.utils.Pages;

public interface OrderService {
	
	//获取餐号所有信息
	Pages<Orders> getOrdersPa(Map map);
	
	//获取订餐详细信息
	List<Orders> getOrders(String wait);
	//修改订餐信息状态
	int updateOrder(String oid,String wstate);
	
	//修改订餐整体信息状态
	int updateOrders(String wait,String wstate);
}
