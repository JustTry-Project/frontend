package com.lhz.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.lhz.pojo.Orders;

public interface OrderDao {
	
	//添加订单
	int addOrder(Orders order);
	
	//根据用户查询订单
	List<Orders> getOrdersById(String uid);
	
	//根据用户查询餐号信息
	List<Orders> getCanhaoById(String uid);
	
	//根据id删除订单信息
	int deleteOrder(String oid);
	
	//查询条数
	Long getCount(@Param("nike")String nike);
	
	//查询订餐号相关信息
	List<Orders> getOrdersPa(@Param("indexRow")Integer indexRow,@Param("pageSize")Integer pageSize,@Param("nike")String nike);
	
	//查询订餐具体信息
	List<Orders> getOrders(@Param("wait") String wait);
	
	//修改订餐信息状态
	int updateOrder(@Param("oid")String oid,@Param("wstate")String wstate);
	
	//修改订餐整体信息状态
	int updateOrders(@Param("wait")String wait,@Param("wstate")String wstate);
}
