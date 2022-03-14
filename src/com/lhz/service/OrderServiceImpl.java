package com.lhz.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lhz.dao.OrderDao;
import com.lhz.pojo.Orders;
import com.lhz.utils.Pages;

@Service
public class OrderServiceImpl implements OrderService {
	
	@Autowired
	private OrderDao orderDao;

	@Override
	public Pages<Orders> getOrdersPa(Map map) {
		Pages<Orders> pages = new Pages<Orders>();
		pages.setCount(orderDao.getCount((String)map.get("query")));
		pages.setPageIndex((Integer)map.get("pageIndex"));
		pages.setPageSize((Integer)map.get("pageSize"));
		pages.setList(orderDao.getOrdersPa(pages.getIndexRow(), pages.getPageSize(), (String)map.get("query")));
		return pages;
	}

	@Override
	public List<Orders> getOrders(String wait) {
		// TODO Auto-generated method stub
		return orderDao.getOrders(wait);
	}

	@Override
	public int updateOrder(String oid, String wstate) {
		// TODO Auto-generated method stub
		return orderDao.updateOrder(oid, wstate);
	}

	@Override
	public int updateOrders(String wait, String wstate) {
		// TODO Auto-generated method stub
		return orderDao.updateOrders(wait, wstate);
	}
	
	
}
