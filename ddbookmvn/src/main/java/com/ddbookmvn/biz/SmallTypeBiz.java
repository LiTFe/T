package com.ddbookmvn.biz;

import java.util.List;

import com.ddbookmvn.model.SmallType;

public interface SmallTypeBiz {

	boolean save(SmallType smallType);


	List<SmallType> findAllBid(int bid);


	int findBidById(int sid);

}
