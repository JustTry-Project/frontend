package com.lhz.service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lhz.dao.CardDao;
import com.lhz.dao.OrderDao;
import com.lhz.dao.UserDao;
import com.lhz.pojo.Orders;
import com.lhz.pojo.User;
import com.lhz.utils.StringRandom;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDao userDao;
	@Autowired
	private CardDao cardDao;
	@Autowired
	private OrderDao orderDao;
	
	@Override
	public Map login(String username, String password) {
		Map msg = new HashMap();
		String state = null;
		User user = userDao.getUserByName(username);
		if(user==null) {
			//用户不存在
			state = "0";
			msg.put("state",state);
		}else {
			if(user.getPassword().equals(password)) {
				//用户验证成功
				msg.put("user",user);
				state = "1";
				msg.put("state",state);
			}else {
				//用户密码错误
				state = "-1";
				msg.put("state",state);
			}
		}
		return msg;
	}

	@Override
	public Boolean register(User user) {
		//默认为失败
		Boolean state = false;
		//设置欠缺基本信息
		user.setUid(StringRandom.RandomId());
		user.setAcount(0d);
		user.setUtime(new Date());
		int row = userDao.addUser(user);
		if(row>0) {
			//添加成功
			state = true;
		}
		return state;
	}

	@Override
	public int payFood(Double price,List<String> cids,User user,String wait) {
		int state = 0;
		
		try {
			Double acount = user.getAcount()-price;
			//判断用户是否有足够金额
			if(acount<0) {
				return state;
			}
			//修改菜单支付状态
			cardDao.updateCardPay(user.getUid());
			//添加历史订单
			Orders order = new Orders();
			for(String cid:cids) {
				order.setOid(StringRandom.RandomId());
				order.setUid(user.getUid());
				order.setCid(cid);
				order.setWait(wait);
				order.setWstate("0");
				order.setOtime(new Date());
				//添加订单
				orderDao.addOrder(order);
			}
			//修改用户账户
			User user2 = new User();
			user2.setUid(user.getUid());
			
			user2.setAcount(acount);
			userDao.updateUser(user2);
			state = 1;
		}catch(Exception e) {
			state = -1;
			return state;
		}
		
		return state;
	}

	@Override
	public User getUserById(String uid) {
		// TODO Auto-generated method stub
		return userDao.getUserById(uid);
	}

	@Override
	public int addAcount(double price, User user) {
		int state = -1;
		try {
			double acount = user.getAcount()+price;
			User user2 = new User();
			user2.setUid(user.getUid());
			user2.setAcount(acount);
			state = userDao.updateUser(user2);
		}catch(Exception e) {
			return state;
		}
		return state;
	}

	@Override
	public List<Orders> getCanhao(String uid) {
		return orderDao.getCanhaoById(uid);
	}

	@Override
	public List<Orders> getOrders(String uid) {
		// TODO Auto-generated method stub
		return orderDao.getOrdersById(uid);
	}

	@Override
	public int deleteOrder(String oid) {
		int row = orderDao.deleteOrder(oid);
		return row;
	}

	@Override
	public boolean checkUser(String username) {
		boolean flag = false;
		User user = userDao.getUserByName(username);
		if(user!=null) {
			flag = true;
		}
		return flag;
	}

}
