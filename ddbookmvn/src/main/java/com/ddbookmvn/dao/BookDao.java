package com.ddbookmvn.dao;

import java.util.List;

import com.ddbookmvn.model.Book;

public interface BookDao {

	boolean saven(Book book);
	List<Book> findAll(int currentPage, String name, int sid);
	int total(String name, int sid);
	int de(int id);
	Book find(int id);
	boolean update(Book book);

}
