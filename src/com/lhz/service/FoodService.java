package com.lhz.service;

import java.util.List;
import java.util.Map;

import com.lhz.pojo.Food;

public interface FoodService {
	
	//根据类型获取所有食品
	List<Food> getFoodsByTid(String tid);
	
	//根据食品模糊查询食品
	List<Food> getFoodByName(String fname);
	
	//修改食品基本信息
	int updateFoodBase(Map map);
	
	//添加食品信息
	int addFood(Map map);
}
