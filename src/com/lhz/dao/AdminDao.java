package com.lhz.dao;

import com.lhz.pojo.Admin;

public interface AdminDao {
	//根据管理员名查询管理员信息
	Admin getAdminByName(String admin);
}
