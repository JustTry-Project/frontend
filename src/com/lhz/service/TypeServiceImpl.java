package com.lhz.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.lhz.dao.TypeDao;
import com.lhz.pojo.Type;

@Service
public class TypeServiceImpl implements TypeService {
	
	@Autowired
	private TypeDao typeDao;

	@Override
	public List<Type> getTypes() {
		return typeDao.getTypes();
	}
}
