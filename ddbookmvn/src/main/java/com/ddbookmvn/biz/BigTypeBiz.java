package com.ddbookmvn.biz;

import java.util.List;

import com.ddbookmvn.model.BigType;

public interface BigTypeBiz {

	boolean save(String name);

	List<BigType> findAllBigType();

}
