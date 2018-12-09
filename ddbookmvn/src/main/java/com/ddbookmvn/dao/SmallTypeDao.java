package com.ddbookmvn.dao;

import java.util.List;

import com.ddbookmvn.model.SmallType;

public interface SmallTypeDao {

	boolean save(SmallType smallType);

	List<SmallType> findAllBid(int bid);

	int findBidById(int sid);


}
