package com.ddbookmvn.biz.impl;

import java.util.List;

import com.ddbookmvn.biz.BigTypeBiz;
import com.ddbookmvn.dao.BigTypeDao;
import com.ddbookmvn.dao.impl.BigTypeDaoJdbcImpl;
import com.ddbookmvn.model.BigType;

public class BigTypeBizImpl implements BigTypeBiz {

	@Override
	public boolean save(String name) {
		BigTypeDao bigTypeDao=new BigTypeDaoJdbcImpl();
		return bigTypeDao.save(name);
	}

	@Override
	public List<BigType> findAllBigType() {
		BigTypeDao bigTypeDao=new BigTypeDaoJdbcImpl();
		return bigTypeDao.findAll();
	}

}
