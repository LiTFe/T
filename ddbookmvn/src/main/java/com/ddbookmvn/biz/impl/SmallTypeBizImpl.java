package com.ddbookmvn.biz.impl;

import java.util.List;

import com.ddbookmvn.biz.SmallTypeBiz;
import com.ddbookmvn.dao.SmallTypeDao;
import com.ddbookmvn.dao.impl.SmallTypeDaoJdbcImpl;
import com.ddbookmvn.model.SmallType;

public class SmallTypeBizImpl implements SmallTypeBiz {

	@Override
	public boolean save(SmallType smallType) {
		SmallTypeDao smallTypeDao=new SmallTypeDaoJdbcImpl();
		return smallTypeDao.save(smallType);
	}

	@Override
	public List<SmallType> findAllBid(int bid) {
		SmallTypeDao smallTypeDao=new SmallTypeDaoJdbcImpl();
		return smallTypeDao.findAllBid(bid);
	}

	@Override
	public int findBidById(int sid) {
		SmallTypeDao smallTypeDao=new SmallTypeDaoJdbcImpl();
		return smallTypeDao.findBidById(sid);
	}

}
