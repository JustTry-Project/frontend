package com.lhz.service;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lhz.dao.FoodDao;
import com.lhz.pojo.Food;
import com.lhz.pojo.User;
import com.lhz.utils.StringRandom;

@Service
public class FoodServiceImpl implements FoodService {
	
	@Autowired
	private FoodDao foodDao;

	@Override
	public List<Food> getFoodsByTid(String tid) {
		if(tid==null || tid.trim().length()==0) {
			tid = "1";
		}
		List<Food> foods = foodDao.getFoodsByTid(tid);
		return foods;
	}

	@Override
	public List<Food> getFoodByName(String fname) {
		return foodDao.getFoodByName(fname);
	}

	@Override
	public int updateFoodBase(Map map) {
		Food food  = new Food();
		int row = 0;
		
		try {
			food.setFid((String)map.get("fid"));
			food.setFname((String)map.get("fname"));
			food.setTid(map.get("tid").toString());
			food.setFprice(Integer.parseInt(map.get("fprice").toString())*1.0);
			food.setFdesc((String)map.get("fdesc"));
			
			row = foodDao.updateFoodBase(food);
		}catch(Exception e) {
			return row;
		}
		return row;
	}

	@Override
	public int addFood(Map map) {
		Food food  = new Food();
		int row = 0;
		try {
			food.setFid(StringRandom.RandomId());
			food.setFname((String)map.get("fname"));
			food.setTid(map.get("tid").toString());
			food.setFprice(Integer.parseInt(map.get("fprice").toString())*1.0);
			food.setFdesc((String)map.get("fdesc"));
			food.setFpicture((String)map.get("fpicture"));
			food.setFtime(new Date());
			
			row = foodDao.addFood(food);
		}catch(Exception e) {
			return row;
		}
		return row;
	}
	
	
}
