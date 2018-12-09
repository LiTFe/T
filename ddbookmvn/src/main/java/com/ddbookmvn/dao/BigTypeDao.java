package com.ddbookmvn.dao;

import java.util.List;

import com.ddbookmvn.model.BigType;

public interface BigTypeDao {

	boolean save(String name);

	List<BigType> findAll();

}
