package com.lhz.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.lhz.pojo.Food;

public interface FoodDao {
	//根据食品类型查询所有食品
	List<Food> getFoodsByTid(String tid);
	
	//根据食品模糊查询食品
	List<Food> getFoodByName(String fname);
	
	//根据食品名查询总数
	Long getCount(String fname);
	
	//查询食品相关信息
	List<Food> getFoods(@Param("indexRow")Integer indexRow,@Param("pageSize")Integer pageSize,@Param("fname")String fname);
	
	//根据id删除食品信息
	int deleteFood(String fid);
	
	//修改食品基本信息
	int updateFoodBase(Food food);
	
	//添加食品
	int addFood(Food food);
}
