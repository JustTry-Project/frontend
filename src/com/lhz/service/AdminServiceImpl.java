package com.lhz.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lhz.dao.AdminDao;
import com.lhz.dao.FoodDao;
import com.lhz.dao.UserDao;
import com.lhz.pojo.Admin;
import com.lhz.pojo.Food;
import com.lhz.pojo.User;
import com.lhz.utils.Pages;

@Service
public class AdminServiceImpl implements AdminService {
	
	@Autowired
	private AdminDao adminDao;
	
	@Autowired
	private UserDao userDao;
	
	@Autowired
	private FoodDao foodDao;

	@Override
	public boolean login(String admin, String password) {
		boolean flag = false;
		Admin ad = adminDao.getAdminByName(admin);
		if(ad!=null) {
			if(ad.getPassword().equals(password)) {
				flag = true;
			}
		}
		return flag;
	}

	@Override
	public Pages<User> getUsers(Map map) {
		System.out.println(map);
		Pages<User> pages = new Pages<User>();
		pages.setPageIndex((Integer)map.get("pagenum"));
		pages.setPageSize((Integer)map.get("pageSize"));
		pages.setCount(userDao.getUserCount((String)map.get("query")));
		pages.setList(userDao.getUsers(pages.getIndexRow(), pages.getPageSize(),(String)map.get("query")));
		
		return pages;
	}

	@Override
	public int deleteUser(String uid) {
		// TODO Auto-generated method stub
		int row = 0;
		try {
			row = userDao.deleteUser(uid);
		}catch(Exception e) {
			return row;
		}
		return row;
	}

	@Override
	public int updateUserBase(Map map) {
		User user  = new User();
		int row = 0;
		try {
			user.setUid((String)map.get("uid"));
			user.setNike((String)map.get("nike"));
			user.setPassword((String)map.get("password"));
			user.setAcount(Integer.parseInt((String)map.get("acount"))*1.0);
			user.setPhone((String)map.get("phone"));
			
			row = userDao.updateUser(user);
		}catch(Exception e) {
			return row;
		}
		return row;
	}

	@Override
	public Pages<Food> getFoods(Map map) {
		Pages<Food> pages = new Pages<Food>();
		pages.setPageIndex((Integer)map.get("pageIndex"));
		pages.setPageSize((Integer)map.get("pageSize"));
		pages.setCount(foodDao.getCount((String)map.get("query")));
		pages.setList(foodDao.getFoods(pages.getIndexRow(), pages.getPageSize(),(String)map.get("query")));
		
		return pages;
	}

	@Override
	public int deleteFood(String fid) {
		int row = 0;
		try {
			row = foodDao.deleteFood(fid);
		}catch(Exception e) {
			return row;
		}
		return row;
	}
	
	
}
